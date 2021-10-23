#!/bin/sh
sudo pacman -S kitty powertop zsh ttf-fira-code ttf-roboto ttf-fira-sans discord git git-core gcc jre-openjdk jdk-openjdk code flatpak
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
sudo pacman -S sublime-text
flatpak install flathub com.spotify.Client
yay -S --noconfirm zsh-theme-powerlevel10k-git
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
sudo echo 'background            #181c27
foreground            #ada37a
cursor                #91805a
selection_background  #172539
color0                #181818
color8                #555555
color1                #800009
color9                #ab3834
color2                #48513b
color10               #a6a65d
color3                #cc8a3e
color11               #dcde7b
color4                #566d8c
color12               #2f97c6
color5                #724c7c
color13               #d33060
color6                #5b4f4a
color14               #f3dab1
color7                #ada37e
color15               #f3f3f3
selection_foreground #181c27' >> ~/.config/kitty/theme.conf
sudo echo 'include ./theme.conf' >> ~/.config/kitty/kitty.conf
firefox https://www.jetbrains.com/toolbox-app/ &
firefox https://zoom.us/download?os=linux &
echo 'XFCE Settings================================
	Appearance
		Style
		  -nordic-darker
		Icons
		  -candy
		Fonts
		  -default roboto medium 10 
		  -monospace fira code retina 10
	Window manager (XFWM4) 
		Style
		   theme 
			 -nordic darker
		   title 
			 -roboto condensed regular
		   title 
			  -alighment left
		Keyboard 
		  -maximize window super + M
		  -close window super + Q
	Default applications
 		utilities 
 		   terminal 
 			  -kitty
'
sleep 5

read -p "Run zsh? [y/N] " x
if [[ $x = y ]] ; then
	zsh
fi

read -p "Configure zsh? [y/N] " x
if [[ $x = y ]] ; then
	zsh -c "p10k configure"
fi

read -p "Run kitty? [y/N] " x
if [[ $x = y ]] ; then
	kitty&
fi
