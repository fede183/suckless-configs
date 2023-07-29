#!/bin/sh

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
