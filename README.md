# WSL devbuster image (amd64 libs)

Base für WSL devlopment environment for touchpi python apps on a windows machine (amd64 libs).

### Prerequisites
- Windows 10/11
- Docker Dekstop
- WSL (Default should be WSL2)
- Any WSL terminal environment (e.g. Ubuntu from MS Store)
- X Windows Server on windows machine (GWSL, XMing, VcXsrv,...)

### Install
- Build Docker image in a WSL linux terminal environment 
- Run Docker container (can be in exited status after a short running)
- Export from WSL linux terminal environment to a windows mount area e.g. /mnt/c/tmp
- Import from window terminal (e.g. Power Shell). This will create the light-wight WSL2 virtual machine.
- Run WSL shell with wsl -d <wsl_terminal_name>.
- Check environment in WSL shell with env. If DISPLAY is not set, then add once export DISPLAY=:0 in .bashrc (don't forget to stop and start shell again)
- Optional: apt update and apt upgrade 
- Install your favorite IDE

### Use
- Run WSL shell with wsl -d <wsl_terminal_name>.
- Default browser is chromium. Just enter chromium in WSL shell. It is not recommended to use the browser for internet surfing, because it is an old version with lots of vulnerabilities. Just use it internally or use it for  well known internets sites.
- Clone your forked touchpi
- Install touchpi once with ./scripts/install.sh (venv and python requirements are installed)
- Test run with ./start.sh or with 
- Happy developing
