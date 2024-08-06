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


# To use script

- open a terminal
- copy a paste the following line by line

'''

git clone https://github.com/T-bMighty/Arch-homelab.git

cd Arch-homelab.git

sudo chmod +x fart.sh
 
bash fart.sh ##lol

or

./fart.sh

'''


# After the script has finished 
This will create servers/websites/dockers for you to visit in your browser of choice

open a browser and visit the following addresses to create accounts : the first accounts made are admin

jellyfin can be found at yourip:8096

Openwebui(ollama) can be found at yourip:8080 

CasaOS will be found at yourip

 
# Stable diffusion
run stable diffusion with this command 
./webui.sh --xformers

to connect from a different computer or to connect it to open web ui

./webui.sh --xformers --listen --api

Go to automatic1111's pages for more optimization flags

download models from civitai or huggingface

## info 
If you are having trouble finding your ip or webpages open a terminal and run the command "ip addr" . this will show your machines I.P. address.

if your ip address has a /24 that is your subnet and not your machines I.P.

Your machines I.P. is handed out by your router. If all else fails find your ip by logging into your router and identifying your machine. It will have it either clients or dhcp leases. 


 A log can be found in your Documents folder

 These self hosted server/websites/dockers cannot be accessed from outside your network unless you use a proxy or vpn. Those can be made in casaos in the app store.

 
## firewall
 you may need to open ports for other devives in your network to connect

 you can run these commands in a terminal

 sudo ufw allow 8096 # Unblock Jellyfin

 sudo ufw allow (whateverPORT) #enter in the port you'd like to open

 sudo ufw enable # enables the firewall if it wasn't 

