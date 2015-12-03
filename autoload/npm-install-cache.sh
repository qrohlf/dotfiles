npm() {
    if [[ $@ == "install" || $@ == "i" ]]; then
        command npm-cache install npm
    else
        command npm "$@"
    fi
}
