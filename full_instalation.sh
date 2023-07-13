# Installing dependencies
xargs -rxa dependencies.txt -- sudo apt-get install -y --;

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

# Finish dwm instalation
sudo apt-get install dwm -y;
sudo cp /usr/share/xsessions/dwm.desktop{,.bak};
sudo apt-get purge dwm -y;
sudo mv /usr/share/xsessions/dwm.desktop{.bak,};

# ly instalation
cd ly;
make run;
make install installsystemd;
systemctl enable ly.service;
cd ..;

# Fix the fonts
cd libxft-bgra;
chmod +x autogen.sh;
sh autogen.sh --sysconfdir=/etc --prefix=/usr --mandir=/usr/share/man;
sudo make install;
cd ..;

sudo apt-get autoremove -y;

read -p "you want to install the fonts? (type y)" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit;
fi

mkdir ~/.local/share/fonts;
mkdir fonts;
cd fonts;
fonts_to_download='JetBrainsMono Hack Noto';

for font in $fonts_to_download; do
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/$font.zip;
    unzip fonts/$font.zip -d ~/.local/share/fonts/ -A;
done
sudo fc-cache -fv;
cd ..;
rm -rf fonts;
