# Neovim for debian/ubuntu/linux mint

## Oneliner to install everything
```
cd; sudo add-apt-repository ppa:neovim-ppa/stable; sudo apt-get update; sudo apt-get install neovim python-neovim python3-neovim xclip python-software-properties; curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -; sudo apt-get install nodejs; cd ~/.config; git clone https://github.com/DetEMagic/nvim.git; cd nvim; nvim init.vim
```

## Install neovim 
```
cd
sudo add-apt-repository ppa:neovim-ppa/stable
(for unstable neovim: sudo add-apt-repository ppa:neovim-ppa/unstable) 
sudo apt-get update
sudo apt-get install neovim
```
## Install necessary packages for plugins in init.vim
###### Python
```
sudo apt-get install python-neovim
sudo apt-get install python3-neovim
```

###### System clipboard
```
sudo apt-get install xclip
```
###### Nodejs
```
sudo apt-get install curl python-software-properties
curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -
sudo apt-get install nodejs
```
## Configure init.vim

```
cd
cd ~/.config
git clone https://github.com/DetEMagic/nvim.git
```

After you have cloned the repository:
```
cd nvim
nvim init.vim
```
Run :checkhealth inside neovim to see if everything works as intended.

## One more thing...
Change CapsLock to Esc: menu->keyboard->keyboard layouts->CapsLock behavior->swap Esc and CapsLock





