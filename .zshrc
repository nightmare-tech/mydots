# Lines configured by zsh-newuser-install
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/arpit/.zshrc'
 
autoload -Uz compinit
compinit
# End of lines added by compinstall
 
# case insensistive tab completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select 

# user prefrences
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
 
# aliases
alias egrep='grep -E --color=auto'
alias fgrep='grep -F --color=auto'
alias grep='grep --color=auto'
alias la='ls -la --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-tilde --show-dot'
alias xzegrep='xzegrep --color=auto'
alias xzfgrep='xzfgrep --color=auto'
alias xzgrep='xzgrep --color=auto'
alias zegrep='zegrep --color=auto'
alias zfgrep='zfgrep --color=auto'
alias zgrep='zgrep --color=auto'
 
# syntax highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# auto suggestion
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
 
# dotfile bare repo
alias dotgit='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# zoxide
eval "$(zoxide init --cmd cd zsh)"
# show execution time on right
function preexec() {
  timer=${timer:-$SECONDS}
}
 
function precmd() {
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    export RPROMPT="%F{green}${timer_show}s %{$reset_color%}"
    unset timer
  fi
}

 
# recongnising ctrl + arrow keys
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# configuring the Delete key
bindkey "^[[3~" delete-char

# Adding .local/bin to PATH
path+=('/home/arpit/.local/bin/')
export PATH

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# init ohmyposh
eval "$(
oh-my-posh init zsh --config \
    /home/arpit/local/mydots/ohmyposh/zen.toml
)"

