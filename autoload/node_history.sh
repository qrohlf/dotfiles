function node(){
  if test "$#" -lt 1
    then repl.history
  else
    env node $@
  fi
}