# wsl-setup for ubuntu

<h4> Author: Aodhan Dalton </h4>
<h4> Version: 0.51 </h4>

<h2> Overview </h2>

 - This repo contains a set of shell scripts for setting up my wsl environment.

 <h2> What other tools I use with WSL </h2>
 
 - Docker Desktop
    - [Docker Desktop Download](https://www.docker.com/products/docker-desktop)

- VS Code, Code editor that integrates well with wsl
    - [VS Code Download](https://code.visualstudio.com/Download)
    - `code .` To open current folder tree in a new vs code window

- Vim, Code editor built into linux alot faster than vs code however less visual
    - [My vim setup](https://github.com/AodhanDalton/vim-setup)
    - `vim {filename}`
    - [vim commands](https://vim.rtorr.com/)
    
- tmux, terminal multiplexer allows multiple terminals open within the same shell
    - `sudo apt install tmux`
    - `tmux`
    - [tmux commands](https://tmuxcheatsheet.com/)

- Firefox, web browser
 - [firefox download](https://www.mozilla.org/en-US/firefox/download/thanks/)

- DuckDuckGo, Anonymous search engine
 - [install for firefox](https://addons.mozilla.org/en-US/firefox/addon/duckduckgo-for-firefox/)

<h2> How to install </h2>
 
 - git clone --depth=1 https://github.com/AodhanDalton/wsl-setup.git ~/.wsl-setup

 - sudo sh ~/.wsl-setup/install.sh
 - sudo sh ~/.wsl-setup/kube-install.sh
 - sudo sh ~/.wsl-setup/omf-install.sh

<h2>Troubleshooting</h2>
 
If cursor blinks in the terminal indefinitly and there is no sign of the terminal updating, one way to resolve this issue
is to follow the steps in figure 1.

![wsl-fix](https://github.com/AodhanDalton/wsl-setup/blob/master/images/fix_wsl.PNG)
_Figure 1._ wsl fix
