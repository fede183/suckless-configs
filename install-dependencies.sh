# Installing dependencies
xargs -rxa dependencies.txt -- sudo pacman -Sy --;

# Install yay
cd yay;
makepkg -si;
cd ..;