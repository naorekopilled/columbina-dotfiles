# columbina-dotfiles
A Columbina themed KDE Plasma 6 rice, purple and pink on navy

## How to install :
1. Put columbina-flat (and columbina if you want the older rounded style) from .local/share/plasma/desktoptheme/ into ~/.local/share/plasma/desktoptheme/
2. Put ColumbinaNight.colors from .local/share/color-schemes/ into ~/.local/share/color-schemes/
3. Put Columbina-Candy and columbina-desktop from .local/share/icons/ into ~/.local/share/icons/
4. Put Columbina from .icons/ into ~/.icons/ (that's the cursor)
5. Put the two folders from .local/share/ksysguard/sensorfaces/ into ~/.local/share/ksysguard/sensorfaces/ (the CPU/GPU/RAM bars in the top panel use org.columbina.barlabel)
6. Put the Columbina folder from .local/share/wallpapers/ into ~/.local/share/wallpapers/
7. Put .bashrc, .blerc and the stuff in .config/ into your home folder the same way
8. Columbina-Candy only replaces some icons, the rest comes from candy icons, which aren't made by me. You can find the download here : https://store.kde.org/p/1305251

After that, change your colors, icons, cursor and Plasma Style in your settings. The window decoration is Darkly.

## Panels :
.config/plasma-org.kde.plasma.desktop-appletsrc is my whole panel and wallpaper layout. If you use it, replace /home/USER with your own home folder first, and log out before copying it so plasmashell doesn't overwrite it. It needs these widgets/plugins :
- Panel Colorizer (for the dock pill and the pink clock)
- Smart Video Wallpaper Reborn (for the video wallpapers)

## Terminal :
- WezTerm, with JetBrains Mono and FantasqueSansM Nerd Font Mono
- ble.sh for the syntax colors (`yay -S blesh-git`)
- fastfetch with the moon/dove logo, and the btop theme in .config/btop/themes/

## Lock screen clock :
.local/share/columbina-rice/lockscreen-clock.py moves the lock screen clock to the bottom-right. Put the script in /usr/local/share/columbina-rice/ and run it with sudo. On Arch you can put columbina-lockscreen-clock.hook in /etc/pacman.d/hooks/ so it runs again after every plasma-workspace update.

## Credits :
- columbina-flat is the YunYun Syndrome theme by Tetralink recolored (https://github.com/Tetralink/YunYun-Syndrome-KDE-Plasma-Theme), GPL, the license is in its folder
- candy icons by EliverLara (https://github.com/EliverLara/candy-icons)
