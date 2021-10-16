function pv_GenerateGitIgnore(){
    echo ".pyvenvdir" >> .gitignore
    echo "/.${pvf_dir}" >> .gitignore
}

function pv_CreatePyVenvInCurrentDirectory(){
    $PYTHON_VERSION -m venv ".${PWD##*/}"
    echo ".${PWD##*/}" >> .pyvenvdir
    if [ git_ignore ]; then
        pv_GenerateGitIgnore
    fi
}

function pv_CreatePyVenvInNewDirectory(){
    mkdir -p $pvf_dir
    cd $pvf_dir
    $PYTHON_VERSION -m venv ".$pvf_dir"
    echo ".$pvf_dir" >> .pyvenvdir
    if [ git_ignore ]; then
        pv_GenerateGitIgnore
    fi
}

function pv(){
    local PYTHON_VERSION="python3.10"
    local args=("$@")
    local pvf_dir=${args[-1]}
    local git_ignore=false
    
    # exit if no args
    if [ ! $1 ]; then
        echo "usage: pv [-v] directory"
        return
    fi
    
    # check for flags
    while getopts 'v:g' OPTION; do
        case "$OPTION" in
            v) # python version flag -v
                PYTHON_VERSION=${OPTARG}
                echo "Using ${PYTHON_VERSION}..."
            ;;
            g)
                git_ignore=true
            ;;
        esac
    done
    
    # call in current or new dir
    if [ "$pvf_dir" = "." ]; then
        pv_CreatePyVenvInCurrentDirectory
    else
        pv_CreatePyVenvInNewDirectory $pvf_dir
    fi
}