function pv_mkcd(){
  mkdir $1
  cd $1
  python3 -m venv ".$1"
  echo ".$1" >> .pyvenvdir
}

function pv(){
  if [ $1 ]
    then
      pv_mkcd $1
  else
      python3 -m venv ".${PWD##*/}"
      echo ".${PWD##*/}" >> .pyvenvdir
  fi
}