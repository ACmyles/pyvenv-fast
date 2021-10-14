function pv_CreatePyVenvInCurrentDirectory(){
    $PYTHON_VERSION -m venv ".${PWD##*/}"
    echo ".${PWD##*/}" >> .pyvenvdir
}

function pv_CreatePyVenvInNewDirectory(){
    mkdir -p $pvf_dir
    cd $pvf_dir
    $PYTHON_VERSION -m venv ".$pvf_dir"
    echo ".$pvf_dir" >> .pyvenvdir
}

function pv_t(){
    local PYTHON_VERSION="python3.10"
    local args=("$@")
    local pvf_dir=${args[-1]}
    
    # exit if no args
    if [ ! $1 ]
    then
        echo "No arguments provided."
        return
    fi
    
    # check for flags
    while getopts 'v:' OPTION; do
        case "$OPTION" in
            v) # python version flag -v
                PYTHON_VERSION=${OPTARG}
                echo ${PYTHON_VERSION}
            ;;
        esac
    done
    
    # call in current or new dir
    if [ "$pvf_dir" = "." ]
    then
        pv_CreatePyVenvInCurrentDirectory
    else
        pv_CreatePyVenvInNewDirectory $pvf_dir
    fi
}