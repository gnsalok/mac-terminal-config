# [IMPORTANT] Source the profile file to ensure environment variables are loaded
# for all interactive shells, even non-login ones.
[[ -f ~/.zprofile ]] && source ~/.zprofile

# aliases
source ~/.aliases
alias clear='printf "\033c"'

# Python
#export PATH=$(brew --prefix python)/libexec/bin:$PATH

# Oh My Zsh Theme
ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Source Oh My Zsh
# Note: ZSH environment variable is now set in .zprofile
source $ZSH/oh-my-zsh.sh

# Starship Prompt
eval "$(starship init zsh)"
