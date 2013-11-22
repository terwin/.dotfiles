function my-tmux-env
{
  tmux show-environment | sed -re 's/^([^-])/export \1/;s/^-/unset /;s/=(.*)$/="\1"/;'
}

alias tmux='TERM=xterm-256color tmux'
alias tenv='my-tmux-env | xargs -n1 eval'

if [ -f /usr/share/doc/packages/tmux/examples/bash_completion_tmux.sh ]; then
  . /usr/share/doc/packages/tmux/examples/bash_completion_tmux.sh
fi

