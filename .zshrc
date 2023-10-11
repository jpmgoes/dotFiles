export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
source ~/.zgen/zgen.zsh
. "$HOME/.asdf/asdf.sh"
. ~/.asdf/plugins/java/set-java-home.zsh # JAVA_HOME with asdf

zgen load denysdovhan/spaceship-zsh-theme spaceship
zgen load zdharma-continuum/fast-syntax-highlighting
zgen load zsh-users/zsh-autosuggestions
zgen load zsh-users/zsh-completions

COMPLETION_WAITING_DOTS="true"

plugins=(
  git zsh-autosuggestions zsh-completions asdf
)
autoload -U compinit && compinit

SPACESHIP_PROMPT_ORDER=(
  user dir host git node hg exec_time line_sep jobs exit_code char
)
SPACESHIP_USER_SHOW="always" # Shows System user name before directory name
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "

autoload -U promptinit; promptinit

fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit
