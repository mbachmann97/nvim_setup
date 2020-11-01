# Repo for my nvim, Windows Terminal and bash config files

## Step 1: Download Windows Terminal
- Windows Store or https://github.com/microsoft/terminal/releases/tag/v1.3.2651.0

## Step 2: Copy Terminal Config inside your config
- Click "Settings" in the Windows Terminal dropdown
- Change "icon" and "backgroundImage" paths to the included Ubuntu icons
- You'll probably have to edit the "guid" fields in the profile section

## Step 3: Download Ubuntu and copy the bash config into your ~/.bashrc file

## Step 4: Install nodejs and npm

## Step 5: Install nvim

## Step 6: Get the nvim plugin manager
- curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \ 
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## Step 7: Create the directory ~/.config/nvim/ and copy the init.vim file into it

## Step 8: Open nvim in normal mode and type " :PlugInstall "
