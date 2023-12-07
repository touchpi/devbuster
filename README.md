# WSL devbuster image

Base für a WSL development environment for touchpi apps on a windows machine. The linux environment with amd64 libs is similar to an arm based Raspberry PI OS Buster (e.g. installed on an old Raspberry PI2 or a Raspberry Zero) and is intended for developing touchpi python3 apps.

### Prerequisites
- Windows 10/11
- Docker Desktop
- WSL (default should be WSL2)
- Any WSL terminal environment (e.g. Ubuntu from MS Store)
- X Windows Server on windows machine (GWSL, XMing, VcXsrv,...)

### Install
- Create a `C:\wsl` folder on your windows machine (you can use any other folder at C:, but then you have to adjust some lines later)
- **Open WSL linux terminal** (e.g. Ubuntu)
- Clone this repo and `cd devbuster`
- Optional: Change USERNAME, TZ in Dockerfile
- Build local Docker image with: `docker build -t pitouch/devbuster .`
- If you don't want to build the images by your own, you can pull the image with `docker pull pitouch/devbuster`
- Run Docker container: `run -d -t pitouch/devbuster ls`  (container is created, runs and exits)
- Get your containerid with: `docker ps -a`
- Export container: `docker export DockerContainerID > /mnt/c/wsl/devbuster.tar`
- **Open a window terminal** (e.g. Power Shell)
- Import from a window terminal (e.g. Power Shell) with: `wsl --import devbuster c:\wsl c:\wsl\devbuster.tar` (this will create the light-weight WSL2 virtual machine file ext4.vhdx in c:\wsl)
- **Open WSL devbuster shell** with `wsl -d devbuster`
- Check environment in WSL shell with `env`. If DISPLAY is not set, then add once the line `export DISPLAY=:0` in .bashrc (don't forget to stop and start shell again)
- Optional: `apt update` and `apt upgrade`
- Optional: install your favorite IDE (e.g. pycharm)
- Optional: insert your github ssh key with `nano ./.ssh/id_rsa`
- Clone forked touchpi repo
- cd to your touchpi folder
- Install touchpi once with `./scripts/install.sh` (venv and python requirements are installed)

### Use
- Run your X Windows Server
- Open your development shell with: `wsl -d devbuster`
- Default browser is chromium. Just enter `chromium` in your WSL shell. It is not recommended to use this browser for internet surfing, because it is an old version with lots of vulnerabilities. Just use it internally or use it only with well known internets sites (e.g. entering your pycharm licence key).
- Run touchpi with `./start.sh`
- Start your IDE in your WSL devbuster shell. If it is graphical it will apear as X Window.


Happy developing. Guides for developer are in work.
