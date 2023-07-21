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

sudo pacman -Qdtq;
sudo pacman -Sc;