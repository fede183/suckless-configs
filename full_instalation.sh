modules_to_install='dwm dmenu st slstatus'

for module in $modules_to_install; do
    echo $module
    cd $module;
    rm config.h;
    sudo make clean install;
    cd ..;
done

for module in $modules_to_install; do
    echo $module
    cd $module;
    rm config.h;
    sudo make clean;
    cd ..;
done