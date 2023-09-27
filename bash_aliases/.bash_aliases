#my aliases definitions
alias pygrep='grep --color=auto --include=*.py'
# Tmux Clear pane
alias tmxc='clear; tmux clear-history; clear'

######### GIT ALIASES ########  
# git status
alias gits='git status'
# git pull rebase
alias gitpr='git pull --rebase'
# git rebase to main
alias gitr2m='git pull --rebase origin main'
# git rebase to master
alias gitr2mstr='git pull --rebase origin master'
# git push force
alias gitpf='git push --force'
#git add modified
alias gitau='git add -u'
# git commit with message
alias gitcm='git commit -m'

#nvim with python support
alias pynvim='source ~/.venv/bin/activate; nvim'

#yapf with user style
alias yapf='yapf --style="$HOME/.config/yapf/style"'
