#PROMPT_COMMAND='echo -ne "\e]0;$(PWD)$(__my_git_ps1)\a"'
#PROMPT_COMMAND='echo -ne "\033]0;$(PWD)$(__my_git_ps1)\007"'
PROMPT_COMMAND='history -a'

function PWD
{
  local PWDn
  local tmp
  PWDn=${PWD/$HOME/\~};
  PWDn=${PWDn/\/home\//\~};
  tmp=${PWDn%/*/*};
  [ ${#tmp} -gt 0 -a "$tmp" != "$PWDn" ] && echo .../${PWDn:${#tmp}+1} || echo $PWDn;
}

function __my_git_ps1 ()
{
  if (type -t __git_ps1 &>/dev/null)
  then
    echo -n "$(__git_ps1 $1)"
  fi
}

GIT_PS1_SHOWDIRTYSTATE=1

#PS1="\e[34;1m\u@\h[\e[0m\e[34;2m\$(PWD)\e[0m\e[34;1m]\$(__my_git_ps1 '(%s)')\$\e[0m "
#PS1="\u@\h[\[\e[31;1m\]\$(PWD)\[\e[0m\]]\[\e[35;1m\]\$(__my_git_ps1 '(%s)')\[\e[0m\]\$ "
#PS1="\[\e[0m\]\[\e[1m\]\u@\h[\[\e[31;1m\]\$(PWD)\[\e[0m\]\[\e[1m\]]\[\e[35;1m\]\$(__my_git_ps1 '(%s)')\[\e[0m\]\[\e[1m\]\$\[\e[0m\] "
#PS1="\[\e[30;1m\]\u@\h[\[\e[31;1m\]\$(PWD)\[\e[30;1m\]]\[\e[35;1m\]\$(__my_git_ps1 '(%s)')\[\e[30;1m\]\$\[\e[0m\] "
#PS1="\[\e[34;1m\]\u@\h[\[\e[0m\]\[\e[34;2m\]\$(PWD)\[\e[0m\]\[\e[34;1m\]]\$(__my_git_ps1 '(%s)')\$\[\e[0m\] "
#PS1="\[\e[34m\]\u@\h[\[\033[1m\]\$(PWD)\[\033[m\]]\$\[\e[0m\] "
#PS1='$promptn${PWD#${PWD%/*/*}/}: '

#PS1="[\W]> "

if [[ $TERM =~ 'rxvt-unicode' ]]; then
  #PS1="\e[0m\e[1m\u@\h[\e[1;38;5;9m\$(PWD)\e[0m\e[1m]\e[1;38;5;13m\$(__my_git_ps1 '(%s)')\e[0m\e[1m\$\e[0m "
  PS1="\[\e[0m\]\[\e[1m\]\u@\h[\[\e[1;38;5;9m\]\$(PWD)\[\e[0m\]\[\e[1m\]]\[\e[1;38;5;13m\]\$(__my_git_ps1 '(%s)')\[\e[0m\]\[\e[1m\]\$\[\e[0m\] "
else
  PS1="\[\e[0m\]\[\e[1m\]\u@\h[\[\e[31;1m\]\$(PWD)\[\e[0m\]\[\e[1m\]]\[\e[35;1m\]\$(__my_git_ps1 '(%s)')\[\e[0m\]\[\e[1m\]\$\[\e[0m\] "
fi
