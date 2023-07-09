# Installing dependencies
xargs -rxa dependencies.txt -- sudo apt-get install -y --;

# Applying patches
git apply patches/*;

# Installing suckless programs
modules_to_install='dwm dmenu st slstatus'

for module in $modules_to_install; do
    echo $module
    cd $module;
    sudo rm config.h;
    sudo make clean install;
    cd ..;
done

for module in $modules_to_install; do
    echo $module
    cd $module;
    sudo rm config.h;
    sudo make clean;
    git checkout -- .;
    cd ..;
done

# Finish dwm instalation
sudo apt-get install dwm -y
sudo cp /usr/share/xsessions/dwm.desktop{,.bak}
sudo apt-get purge dwm -y
sudo mv /usr/share/xsessions/dwm.desktop{.bak,}
