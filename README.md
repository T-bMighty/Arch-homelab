# Arch-homelab
!warning! this is my first script and can most likely be improved. It works for me currently and I wanted to share it.

Bash script to install various homelab programs. I found arch(garuda) to be the most stable and out performed windows.

I created a script from my journey.

# This script will install 
Jellyfin with Nvidia transoding

Ollama

Docker

Open-webui(to chat with ollama

Pyenv - global python 3.10

Stable-diffusion(create images with ai

CasaOS(Docker based cloud solution)

# F - Functional
# A - Automated
# R - Robust
# T - Technologies

Who said you can't enjoy your own F.A.R.T.?


'''

git clone https://github.com/T-bMighty/Arch-homelab.git

cd Arch-homelab.git

sudo chmod +x fart.sh
 
bash fart.sh ##lol

or

./fart.sh

'''


# After the script has finished 
jellyfin can be found at yourip:8096

Openwebui can be found at yourip:8080

CasaOS will be found at yourip

 A log can be found in your Documents folder

# Stable diffusion
run stable diffusion with this command 
./webui.sh --xformers

to connect from a different computer or to connect it to open web ui

./webui.sh --xformers --listen --api

Go to automatic1111's pages for more optimization flags

download models from civitai or huggingface
