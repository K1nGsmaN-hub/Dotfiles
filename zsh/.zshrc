# Antigen
#source $HOME/bin/antigen.zsh
source /usr/local/share/antigen/antigen.zsh

# asdf programming version manager
#source $HOME/.asdf/asdf.sh
source /usr/local/opt/asdf/libexec/asdf.sh

# scmpuff
eval "$(scmpuff init -s)"

### Prepend ~/bin to $PATH
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

### Configuration https://github.com/Powerlevel9k/powerlevel9k/
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
VIRTUAL_ENV_DISABLE_PROMPT=1
POWERLEVEL9K_BATTERY_STAGES=(
   $'▏    ▏' $'▎    ▏' $'▍    ▏' $'▌    ▏' $'▋    ▏' $'▊    ▏' $'▉    ▏' $'█    ▏'
   $'█▏   ▏' $'█▎   ▏' $'█▍   ▏' $'█▌   ▏' $'█▋   ▏' $'█▊   ▏' $'█▉   ▏' $'██   ▏'
   $'██   ▏' $'██▎  ▏' $'██▍  ▏' $'██▌  ▏' $'██▋  ▏' $'██▊  ▏' $'██▉  ▏' $'███  ▏'
   $'███  ▏' $'███▎ ▏' $'███▍ ▏' $'███▌ ▏' $'███▋ ▏' $'███▊ ▏' $'███▉ ▏' $'████ ▏'
   $'████ ▏' $'████▎▏' $'████▍▏' $'████▌▏' $'████▋▏' $'████▊▏' $'████▉▏' $'█████▏' )
POWERLEVEL9K_IP_INTERFACE='en0'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon user dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time ip ram load battery root_indicator background_jobs)

# Antigen Plugininstall
antigen theme bhilburn/powerlevel9k powerlevel9k
antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
  bundler
  rails
  zsh-completions
  command-not-found
  zsh-users/zsh-syntax-highlighting
EOBUNDLES

antigen apply

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Fancy Ctrl-z
# instead of fg<enter> lets you use ctrl+z (like in vim)
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Map vim to nvim
alias vim="nvim"

# Update neovim bundles
alias nvbi="nvim +PlugInstall +qa"
alias nvbu="nvim +PlugUpdate +qa"

# Git aliases
alias g="git"
alias gst="git status -sb"
alias gco="git checkout"
alias gpom="git push origin master"
alias gpo="git push origin"
alias glog='git log --pretty=format:"%C(yellow)%h%C(reset) %C(green)%ar%C(reset) %C(bold blue)%an%C(reset) %C(red)%d%C(reset) %s" --graph --abbrev-commit --decorate'
alias gd="git diff"
alias gap="git add -p"
alias gaa="git add ."
alias gc="git commit"
alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch -D"
alias gca="git commit --amend"
alias gmc='git ls-files --unmerged | cut -f2 | uniq' # git merge conflicts
alias glh="git lg | head -n 20"
alias grv="git remote -v"
alias gfo="git fetch origin"
alias gclr="git reset HEAD --hard ; git clean -fd"
alias gz="git archive -o snapshot.zip HEAD"
alias gt="git archive -o snapshot.tar.gz HEAD"
alias gpr="git --no-pager lg HEAD --not $1"
alias grp="git remote prune origin"
alias grhh="git reset HEAD --hard"

# Bundler
alias bi="bundle install"
alias be="bundle exec"
alias bu="bundle update"

# Overwrites
alias ll='ls -ahl'

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Hide hostname when logged in as ericclaus
DEFAULT_USER="ericclaus"

# Load keys into ssh-agent
# ssh-add &>/dev/null

# pyenv
eval "$(pyenv init -)"
