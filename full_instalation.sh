# Creating alias
unalias connect_to_gamepad;
alias connect_to_gamepad='gamepad_id='8C:41:F2:07:02:3F';
timeout 5 bluetoothctl scan on;
bluetoothctl pair $gamepad_id;
bluetoothctl connect $gamepad_id;'

# Installing dependencies
xargs -rxa dependencies.txt -- sudo pacman -Sy --;

# Applying patches
git apply patches/*;

# Installing suckless programs
modules_to_install='dwm dmenu st slstatus'

for module in $modules_to_install; do
    echo $module;
    cd $module;
    sudo rm config.h;
    sudo make clean install;
    cd ..;
done

for module in $modules_to_install; do
    echo $module;
    cd $module;
    sudo rm config.h;
    sudo make clean;
    git checkout -- .;
    cd ..;
done

# Install yay
cd yay;
makepkg -si;
cd ..;

# Install aur's
aurs_to_install='codium libxft neovim'
for aur in $aurs_to_install; do
    echo $aur;
    yay $aur;
done

sudo pacman -Qdtq;
sudo pacman -Sc;

read -p "you want to install the fonts? (type y)" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
   exit;
fi

mkdir ~/.local/share/fonts;
mkdir fonts;
cd fonts;
fonts_to_download='LiberationMono JetBrainsMono Hack Noto';

for font in $fonts_to_download; do
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/$font.zip;
    unzip $font.zip -d ~/.local/share/fonts;
done
sudo fc-cache -fv;
cd ..;
rm -rf fonts;
