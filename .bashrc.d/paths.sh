join_path()
{
  local IFS=":";
  echo "$*";
}

cleanup_path()
{
  #echo -n "$1" | /bin/awk 'BEGIN{RS=":"} {sub(sprintf("%c$",10),""); if(A[$0]) {} else {A[$0]=1; printf(((NR==1)?"":":")$0)} }';
  local new_path=$(echo -n "${!1}" | awk 'BEGIN{RS=":"} {sub(sprintf("%c$",10),""); if(A[$0] || $0 == "") {} else {A[$0]=1; printf((one?":":"")$0); one=1} }');
  eval ${1}=\"$new_path\";
  # echo -n "${!1}";
}

remove_regex_from_path()
{
  for str in "${@:2}"; do
    local new_path=$(echo -n "${!1}" | awk -v pat="${str}" 'BEGIN{RS=":"} $0 !~ pat {printf((one?":":""))$0; one=1}');
    eval ${1}=\"$new_path\";
  done;
  # echo -n "${!1}";
}

remove_string_from_path()
{
  for str in "${@:2}"; do
    local new_path=$(echo -n "${!1}" | awk -v pat="${str}" 'BEGIN{RS=":"} $0 != pat {printf((one?":":""))$0; one=1}');
    eval ${1}=\"$new_path\";
  done;
  # echo -n "${!1}";
}

prepend_to_path()
{
  local new_part=$(join_path "${@:2}");
  eval ${1}=\"${new_part}:${!1}\";
  # echo -n "${!1}";
}

append_to_path()
{
  local new_part=$(join_path "${@:2}");
  eval ${1}=\"${!1}:${new_part}\";
  # echo -n "${!1}";
}

complete -vd cleanup_path remove_regex_from_path remove_string_from_path prepend_to_path append_to_path

pathop()
{
  declare -a _append _prepend _string _regex;
  local _clean=false;

  local OPTIND=1 OPTERR=0 OPTARG;

  while getopts ":a:p:r:s:c" opt; do
    case $opt in
      a)
        _append[${#_append[*]}+1]="$OPTARG";
        ;;
      p)
        _prepend[${#_prepend[*]}+1]="$OPTARG";
        ;;
      r)
        _regex[${#_regex[*]}+1]="$OPTARG";
        ;;
      s)
        _string[${#_string[*]}+1]="$OPTARG";
        ;;
      c)
        _clean=true;
        ;;
      \?)
        echo "Invalid option: -$OPTARG" >&2;
        return 1;
        ;;
      :)
        echo "Option -$OPTARG requires an argument" >&2;
        return 1;
        ;;
      *)
        echo "hiho: -$OPTARG";
        ;;
    esac;
  done;

  echo "a: ${_append[*]}";
  echo "p: ${_prepend[*]}";
  echo "r: ${_regex[*]}";
  echo "s: ${_string[*]}";
}

# mdg()
# {
#   if (($# != 1))
#   then
#     echo "Error: One argument required" 1>&2
#     false
#   else
#     mkdir -p $1 && pushd $1
#   fi
# }

