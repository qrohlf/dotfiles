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
    UPLOAD=true     # enable push to origin by default
    BROWSE=false    # disable browse by default
    DEPLOY=false    # disable deploy by default
    local OPTIND    # http://stackoverflow.com/questions/16654607/using-getopts-inside-a-bash-function
    while getopts "qdbx" flag
    do
        case $flag in 
            q) VERBOSE=false;;
            d) DEPLOY=true;;
            b) BROWSE=true;;
            x) UPLOAD=false;;
        esac
    done

    if [ "$UPLOAD" = true ]; then
        if git push; then
            if [ "$VERBOSE" = true ]; then notify "$TITLE" 'git push successful'; fi
        else
            if [ "$VERBOSE" = true ]; then notify "$TITLE" 'git push unsuccessful'; fi
            return 1
        fi
    fi

    if [ "$DEPLOY" = true ]; then
        DEPLOY_SUCCESS=false

        # run the custom deploy script if it exists
        if [ -a .shipit ]; then
            if bash .shipit; then
                DEPLOY_SUCCESS=true
            fi
        # otherwise assume heroku
        else 
            if git push heroku master; then
                DEPLOY_SUCCESS=true
            fi
        fi


        if [ "$DEPLOY_SUCCESS" = true ] && [ "$VERBOSE" = true ]; then
            notify "$TITLE" 'Deploy successful'
        else
            notify "$TITLE" 'Deploy unsuccessful'
            return 1
        fi
    fi

    if [ "$BROWSE" = true ]; then
        if [ -a .shipit-browse ]; then 
            open `cat .shipit-browse`; 
        elif heroku info &> /dev/null; then
            heroku open
        elif hub browse -u; then
            hub browse
        fi
    fi
}

notify() {
     osascript -e "display notification \"$2\" with title \"$1\""
}

alias fuckitshipit='booyah -db' # sometimes a little extra enthusiasm is needed