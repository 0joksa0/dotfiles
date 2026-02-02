# ────────────────────────────────────────────
# Oh-My-Zsh core
# ────────────────────────────────────────────
export ZSH="/usr/share/oh-my-zsh"

plugins=(git kitty)
ZSH_THEME="powerlevel10k/powerlevel10k"

ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/oh-my-zsh"
mkdir -p "${ZSH_CACHE_DIR}"

source "${ZSH}/oh-my-zsh.sh"

export XDG_CONFIG_HOME="$HOME/.config"


alias nv='nvim'
alias la='ls -alF'
alias h='history | grep --color=auto'
alias c='clear'
alias logout='loginctl terminate-user $USER'   
alias files='nemo'
alias files.='nemo .'
alias help='less -N ~/.zshrc'
alias kubectl="minikube kubectl --"

alias cProject='/home/0joksa0/workspaces/shell-ws/cProjectCreator/cProject'

[[ -f ~/.bash_profile ]] && source ~/.bash_profile

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

export VCPKG_ROOT="$HOME/vcpkg"
export PATH="$VCPKG_ROOT:$(ruby -e 'print Gem.user_dir')/bin:$PATH"

export VISUAL=nvim
export EDITOR=$VISUAL
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH


export GRAPH_TOKEN=


#path za python ros2 stvari 
export PYTHONPATH=/opt/ros/humble/lib/python3.10/site-packages:$PYTHONPATH

PATH="$PATH":"$HOME/.local/scripts/"
bindkey -s ^f "tmux-sessionizer\n"

export PATH="$HOME/.local/bin:$PATH"



# Load Angular CLI autocompletion.
source <(ng completion script)
