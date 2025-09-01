#ZINIT CONFIGURATIONS
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

#zinit plugins
zinit light zsh-users/zsh-syntax-highlighting #load syntax-highlighting
zinit light zsh-users/zsh-autosuggestions #load auto-suggestions
zinit light zsh-users/zsh-completions #load completions

#load completions
autoload -U compinit && compinit

# STARSHIP CONFIGURATIONS
export STARSHIP_CONFIG="$HOME/.config/starship.toml"
eval "$(starship init zsh)"

#HISTORY
HISTSIZE=2500
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

#STYLING
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'