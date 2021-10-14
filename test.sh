function pv(){
    if [ "${1}"="." ] || [ ! $1 ]
    then
        $PYTHON_VERSION -m venv ".${PWD##*/}"
        echo ".${PWD##*/}" >> .pyvenvdir
    else
        pv_mkcd $1
    fi
}

function pv_mkcd(){
    mkdir -p $1
    cd $1
    ls
    $PYTHON_VERSION -m venv ".$1"
    echo ".$1" >> .pyvenvdir
}

function evaluate_flags(){
    while getopts 'v:' OPTION; do
        case "$OPTION" in
            v)
                PYTHON_VERSION=${OPTARG}
            ;;
        esac
    done
}

function pvf(){
    local PYTHON_VERSION="python3.9"
    local NEW_DIRECTORY="."
    
    evaluate_flags $@
    shift $((OPTIND-1))
    
    echo "${PYTHON_VERSION}"
    
    if [ $1 ]
    then
        pv_mkcd $1
    else
        pv
    fi
}
pvf $@