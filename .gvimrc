"au GUIEnter * let ethan=confirm("Are you a Punk-Schlag?", "&Yes", 1)

set background=dark
colorscheme solarized
set lines=62

set guifont=Inconsolata\ Medium\ 12,Monospace\ 10

if v:version >= 703
  set columns=83
  set relativenumber
  set numberwidth=3
else
  set columns=80
endif

if &diff
  set columns=230
endif