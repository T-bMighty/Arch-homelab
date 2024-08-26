
---

# Arch-homelab
!warning! this is my first script and can most likely be improved. It works for me currently and I wanted to share it.

Bash script to install various homelab programs. I found arch(garuda) to be the most stable and out performed windows.

I want to emphasize that this will allow you to create/install anything with docker,pip and build a personal cloud/docker ecosystem. You'll be able to install basically anything from github.
Javascript excluded(for now). If anything goes wrong use your AI sidekick to solve your problem. Pair that with Arch's yay and you have A LOT of capabilities. 

- some of that packages will error and I will clean that up at some point. They are carry overs from ubuntu. sorry.Non-essesntial.

# This script will install 
- **Jellyfin**: Media server for streaming videos, music, photos, and more with support for Nvidia transcoding.
- **Ollama**: AI-powered chatbot or assistant.
- **Docker**: Platform to run applications in containers, simplifying application deployment and management.
- **Open-webui**: Web interface to interact with Ollama.
- **Pyenv - global python 3.10**: This will add your pyenv to your bash profile. Automatically starts when logged in.
- **Stable-diffusion**: AI-based image generation tool. 
- **CasaOS**: Docker-based cloud solution for managing and accessing home servers. I use this for its file sharing the most.

# F - Functional
# A - Automated
# R - Robust
# T - Technologies

Who said you can't enjoy your own F.A.R.T?


# To use script

- Open a terminal
- Copy and paste the following commands one by one

```bash
git clone https://github.com/T-bMighty/Arch-homelab.git
```
```bash
cd Arch-homelab.git
```
```bash
sudo chmod +x fart.sh
```
```bash
bash fart.sh ##lol
```

or

```bash
./fart.sh
```

# After the script has finished 
This will create servers/websites/dockers for you to visit in your browser of choice

- Open a browser and visit the following addresses to create accounts: The first accounts created are admin.
  - **Jellyfin** can be found at `yourip:8096`
  - **Open-webui (ollama)** can be found at `yourip:8080 `
  - **CasaOS** will be found at `yourip`

**Stable-Diff**
- To run:
  ```bash
  ./webui.sh --xformers 
  or
  ./webui.sh --xformers --listen
  ```
- To connect from a different computer or to connect it to Open-webui:
  ```bash
  ./webui.sh --xformers --listen --api
  ```

Go to [automatic1111's pages](https://github.com/ModelTCG/stable-diffusion-webui/wiki/Optimization) for more optimization flags.

- Download models from [civitai](https://civitai.com/) or [huggingface](https://huggingface.co/models)

## info 
If you are having trouble finding your IP or webpages, open a terminal and run the command `ip addr`. This will show your machine's IP address.

- If your IP address has a `/24`, that is your subnet, not your machine's IP.
- Your machine's IP is handed out by your router. If all else fails, log into your router and identify your machine. It will have it either in `clients` or `dhcp leases`.

These self-hosted servers/websites/dockers cannot be accessed from outside your network unless you use a proxy or VPN.

## Firewall
You may need to open ports for other devices on your network to connect.

- You can run these commands in a terminal:
  ```bash
  sudo ufw allow 8096 # Unblock Jellyfin
  ```
  ```bash
  sudo ufw allow (whateverPORT) # Enter the port you'd like to open
  ```
  ```bash
  sudo ufw enable # Enables the firewall if it wasn't enabled
  ```

## Log
A log can be found in your `Documents` folder.
