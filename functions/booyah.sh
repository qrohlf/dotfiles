#!/bin/bash
# fancy git/heroku deploy script
# dependencies: hub, heroku toolbelt, OSX 10.9+
#
# makes the following totally reasonable assumptions:
# - you're deploying from master
# - your heroku remote is named 'heroku'
#
# Customization:
# - custom deployment scripts can be added to your project root as '.shipit'
# - custom urls to open when the browse flag is specified can be added to
#   your project root as '.shipit-browse'
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
    DEPLOY=true     # enable deploy by default
    local OPTIND    # http://stackoverflow.com/questions/16654607/using-getopts-inside-a-bash-function
    while getopts "qdbx" flag
    do
        case $flag in
            q) VERBOSE=false;;
            d) DEPLOY=false;;
            b) BROWSE=true;;
            x) UPLOAD=false;;
        esac
    done

    if [ "$UPLOAD" = true ]; then
        echo_highlight "pushing current branch"
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
            echo_highlight "running custom deploy script"
            if bash .shipit; then
                DEPLOY_SUCCESS=true
            fi
        # otherwise assume heroku
        elif heroku info &> /dev/null; then
            echo_highlight "deploying to heroku"
            if git push heroku master; then
                DEPLOY_SUCCESS=true
            fi
        else
            NODEPLOY=true
            echo "deploy not attempted: could not find a deploy target"
        fi

        if [ -z "$NODEPLOY" ] && [ "$VERBOSE" = true ]; then
            if [ "$DEPLOY_SUCCESS" = true ]; then
                notify "$TITLE" 'Deploy successful'
            else
                notify "$TITLE" 'Deploy failed'
            fi
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

echo_highlight() {
    printf "\e[0;36;49m$1\e[0m\n"
}

notify() {
     osascript -e "display notification \"$2\" with title \"$1\""
}

:shipit:() {
  cat<<"EOF"

 ,;;:;,          Ship it.
 ;;;;;          /
,:;;:;    ,'=.
;:;:;' .=" ,'_\
':;:;,/  ,__:=@
 ';;:;  =./)_
   `"=\_  )_"`
        ``'"`

EOF
}

fuckitshipit() {
  booyah
  :shipit:
}
