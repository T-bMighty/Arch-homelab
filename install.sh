#!/bin/bash

paru -S figlet

echo "Give them FIRE" | figlet


logfile=~/Documents/script_execution.log

function check_success() {
    if [ $? -eq 0 ]; then
        echo "$1 completed successfully." >> "$logfile"
    else
        echo "$1 failed. Check log for details." >> "$logfile"
        exit 1
    fi
}

function update_system() {
    sudo pacman -Syu --noconfirm
}

### Jellyfin Setup ###
echo "Installing Jellyfin..."
sudo pacman -S jellyfin-git --noconfirm
sudo systemctl start jellyfin
sudo systemctl enable jellyfin
check_success "Jellyfin installation"

### Transcoding Setup for Nvidia GPU (if applicable) ###
if nvidia-smi > /dev/null 2>&1; then
    echo "NVIDIA GPU detected. Setting up transcoding..."
    sudo pacman -Syu jellyfin-ffmpeg nvidia-utils --noconfirm
    nvidia-smi
    echo "Please configure Jellyfin settings manually: Go to playback > transcoding and select 'NVIDIA' from the dropdown menu."
    check_success "Transcoding setup for NVIDIA GPU"
else
    echo "No NVIDIA GPU detected. Skipping transcoding setup."
fi


# Enable and start Docker
sudo systemctl enable --now docker
check_success "Docker enabling and starting"



### Ollama Setup ###
echo "Installing Ollama..."
curl -fsSL https://ollama.com/install.sh | sh
sudo systemctl start ollama
sudo systemctl enable ollama
ollama pull llama3.1
check_success "Ollama installation"

### Open WebUI Install ###
echo "Installing Open WebUI..."
sudo docker run -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-webui --restart always ghcr.io/open-webui/open-webui:main
check_success "Open WebUI installation"

### Stable Diffusion Install ###
echo "Installing Stable Diffusion dependencies and tools..."
# Prerequisites for Pyenv
paru -S --needed make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev git

# Install Pyenv
curl https://pyenv.run | bash
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bash_profile
{
    echo 'eval "$(pyenv init --path)"'
    echo 'eval "$(pyenv init -zsh)"'
    echo 'eval "$(pyenv virtualenv-init -zsh)"'
} >> ~/.bash_profile
source ~/.bash_profile

# Install Python 3.10
pyenv install 3.10
pyenv global 3.10

# Check all dependencies
echo "Installing Stable Diffusion..."
wget -q https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh
chmod +x webui.sh
./webui.sh &
check_success "Stable Diffusion installation"

### CasaOS Setup ###
echo "Installing CasaOS prerequisites..."
update_system  # Reuse the function to update and upgrade the system before installing CasaOS prerequisites
paru -S --needed curl smartmontools ntfs-3g net-tools samba apparmor \
parted cifs-utils unzip docker-compose rclone docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin --noconfirm
paru -S --needed udevil-git mergerfs --noconfirm
check_success "CasaOS prerequisites installation"

# Install CasaOS using the script provided by CasaOS
curl -fsSL https://get.casaos.io | sudo bash
check_success "CasaOS installation"
echo "Script execution completed. Log file is located at $logfile."

echo "Enjoy :)" | figlet
