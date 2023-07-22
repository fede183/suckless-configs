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

sudo pacman -R $(pacman -Qdtq);