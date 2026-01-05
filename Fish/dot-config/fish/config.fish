if status is-interactive
# Base
#---------------# 
	set -g fish_greeting
	oh-my-posh init fish --config ~/.config/oh-my-posh/config.json | source

	if not set -q TMUX
		tmux new-session -A -s (pgrep -c kitty)
	end


	zoxide init fish | source

	fastfetch
#---------------# 


# Alias'
#---------------# 
	alias -- cat='bat --color=always --theme Dracula --style=header-filename,header-filesize,grid '
	alias -- cd=z
	alias -- cp='cp -i'
	alias -- ff='clear && fastfetch'
	alias -- la='eza -lah --icons=auto'
	alias -- ls='eza -lh --icons=auto'
	alias -- mv='mv -i'
	alias -- rm='rm -i'
	alias -- tmuxa='tmux new-session -A -s main'
	alias -- tmuxq='tmux kill-server'
	alias -- xclip='xclip -selection clipboard'

	abbr --add clock peaclock
	abbr --add df 'df -h'
	abbr --add shutdown 'shutdown now'
	abbr --add update 'sudo pacman -Syu'
	abbr --add onedrive 'rclone --vfs-cache-mode writes -v mount "onedrive": ~/Onedrive'
	abbr --add scan 'nmcli device wifi list --rescan yes'
	abbr --add install 'sudo pacman -S'
	abbr --add remove 'sudo pacman -Rns'
#---------------# 
end


# ENV variables
#---------------# 
set -gx EDITOR nvim
set -gx VISUAL nvim

set -gx FZF_DEFAULT_OPTS "--layout=reverse --border=bold --border=rounded --margin=3% --color=dark"

set -g fish_complete_path

fish_add_path -g ~/.local/bin
#---------------#
