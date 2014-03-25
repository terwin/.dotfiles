# .bashrc

test -n "$_BASHRC_LOADED" && exit

export _BASHRC_LOADED=1

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# export TERM_PROGRAM=$TERM
export HISTSIZE=1000
export HISTFILESIZE=1000
shopt -s histappend

set -o vi

# source scripts in a directory
source_scripts()
{
  for script in $1/*; do
    if [ -x "$script" ]; then # if executable
      source $script
    fi
  done
}

source_scripts ~/.bashrc.d
source_scripts ~/.bashrc_local.d

# clean up paths
cleanup_path PATH
cleanup_path LD_LIBRARY_PATH
cleanup_path MANPATH

# export paths
export PATH
export LD_LIBRARY_PATH
export MANPATH
