header_line_number=$(grep -n "\[multilib\]" pacman.conf | grep -Eo '^[^:]+');
include_line_number="$(($header_line_number+1))"

sed -i 's/\#\[multilib\]/\[multilib\]/g' /etc/pacman.conf;
sed -i "${include_line_number} s/\\#Include/Include/g" /etc/pacman.conf;

sudo pacman -Suy;
sudo pacman -Sy steam;