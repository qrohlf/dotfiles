#!/bin/bash
# fancy git/heroku deploy script
# dependencies: hub, heroku toolbelt, OSX 10.9+
#
# makes the following totally reasonable assumptions:
# - you're deploying from master
# - your heroku remote is named 'heroku'
#
# flags: 
# -q quiet mode: disable notifications
# -d deploy: push to heroku
# -b browse: open on github/heroku
booyah() {
    TITLE=${PWD##*/}
    VERBOSE=true    # enable notifications by default
    BROWSE=false    # disable browse by default
    DEPLOY=false    # disable deploy by default
    local OPTIND    # http://stackoverflow.com/questions/16654607/using-getopts-inside-a-bash-function
    while getopts "qdb" flag
    do
        case $flag in 
            q) VERBOSE=false;;
            d) DEPLOY=true;;
            b) BROWSE=true;;
        esac
    done

    if git push origin master
    then
        if [ "$VERBOSE" = true ]; then notify "$TITLE" 'git push successful'; fi
        if [ "$BROWSE" = true ]; then hub browse; fi
    else
        if [ "$VERBOSE" = true ]; then notify "$TITLE" 'git push unsuccessful'; fi
        return 1
    fi

    if [ "$DEPLOY" = true ]; then
        if git push heroku master
        then
            if [ "$VERBOSE" = true ]; then notify "$TITLE" 'Heroku deploy successful'; fi
            if [ "$BROWSE" = true ]; then heroku open; fi
        else
            if [ "$VERBOSE" = true ]; then notify "$TITLE" 'Heroku deploy unsuccessful'; fi
            return 1
        fi
    fi
}

notify() {
     osascript -e "display notification \"$2\" with title \"$1\""
}

alias fuckitshipit='booyah -db' # sometimes a little extra enthusiasm is needed