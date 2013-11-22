function cvstat
{
  cvs status $* 2>&1 | sed -n -e "/Status:/p" -e "/ Examining /p";
}

function cvsx
{
  cvstat $* 2>&1 | fgrep -v "Up-to-date";
}

