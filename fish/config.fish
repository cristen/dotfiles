set -g VIRTUALFISH_COMPAT_ALIASES # uncomment for virtualenvwrapper-style commands
set -U EDITOR emacs
. ~/.config/fish/custom/virtual.fish
# set -g VIRTUALFISH_COMPAT_ALIASES # uncomment for virtualenvwrapper-style commands . path/to/virtual.fish
# optional plugins
. ~/.config/fish/custom/auto_activation.fish
. ~/.config/fish/custom/global_requirements.fish
# map ~/Projects directories to variables named after it
. ~/.config/fish/custom/map_directories
# emacsclient
. ~/.config/fish/custom/emacsclient
# alias to pavucontrol
. ~/.config/fish/custom/mixer
. ~/.config/fish/custom/teepy.fish

set -gx BROWSER /usr/bin/chromium
