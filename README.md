My suckless setups
================================

# Special thanks
- Luke Smith [github](https://github.com/LukeSmithxyz) [youtube](https://www.youtube.com/@LukeSmithxyz)
- MentalOutlaw [youtube](https://www.youtube.com/@MentalOutlaw)
- Bread on Penguins [github](https://github.com/BreadOnPenguins) [youtube](https://www.youtube.com/@BreadOnPenguins)

You guys are being really helpfull on this journey of mine.

# Includes my forks of:
- dwm
- st
- dmenu
- slstatus

Each one of these with their respective patches already apply. I do not know if forking directly from the projects and modify them with patches and setups is the best option. But I think that if they update those in the future the amount of work to re-apply the patches will be the same.

I do not include surf because I feel that is too unconfortable to use for my taste. I try other unconventional browsers like vimb for examble, but I prefer librewolf for now.

# Solution for the emoji problem
As any person that try suckless software knows, the minimalistic approach almost always works, but there are also some problems you may want to solve before starting with the customizations. In my opinion the most urgent is the fact that st and dmenu do not suport emoji render.

The best fix I could find was to install libxft-bgra.

I include the instalation of fonts JetBrainsMono and Noto.

# Customizations
Apart from some key bindings, the main difference from the base instalation is the configuration of slstatus bar.

[Menu](docs/slstatus.jpg)

- volume, with his key bindings
- the hour

Try to keep it simple. I do not really enjoy the over extended setups I saw on most videos. Just a matter of taste. I also think it just create more potencial problems for future updates. Maybe I will add alerts for emails, but I doubt it would be more fancy than that.

# Update submodules
git submodule update --init --recursive --remote

# TODO:
- fix the chinese and japanese characters (probably it needs another font)
- set alarms for events
- complete docs with commands of git
- script to download documentation and files from google drive
- filter not executable programs in dmenu

# PARTIALLY DONE:
- color scheme for st (done, need ajustments)
- set up email locally (gmail still has to be set)
