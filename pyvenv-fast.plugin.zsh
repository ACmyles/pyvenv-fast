# appends .pyvenvdir and the pyvenv directory to .gitignore
function _pv_AppendToGitIgnore(){
    echo ".pyvenvdir" >> .gitignore
    echo "/.${pv_call_keys[pv_directory]}" >> .gitignore
}

# creates a pyvenv in the working directory
function _pv_CreatePyVenvInWorkingDirectory(){
    ${pv_call_keys[python_version]} -m venv ".${PWD##*/}"
    echo ".${PWD##*/}" >> .pyvenvdir
}

# creates a pyvenv in a brand new directory (uses mkcd)
function _pv_CreatePyVenvInNewDirectory(){
    mkdir -p ${pv_call_keys[pv_directory]}
    cd ${pv_call_keys[pv_directory]}
    ${pv_call_keys[python_version]} -m venv ".${pv_call_keys[pv_directory]}"
    echo ".${pv_call_keys[pv_directory]}" >> .pyvenvdir
}

function pv(){
    # exit if no arguments provided
    if [ ! ${1} ]; then
        echo "usage: pv [-g] [-v ...] directory"
        return
    fi
    
    # create call state dictionary key:value store
    declare -A local pv_call_keys
    pv_call_keys[pv_directory]=${argv[-1]}
    pv_call_keys[python_version]="python3.11"
    pv_call_keys[git_ignore]=false
    
    # evaluate flags
    while getopts 'v:g' OPTION; do
        case "${OPTION}" in
            v) # python version flag -v
                pv_call_keys[python_version]=${OPTARG}
                echo "Using ${pv_call_keys[python_version]}..."
            ;;
            g) # git ignore append flag -g
                pv_call_keys[git_ignore]=true
            ;;
        esac
    done
    
    # evaluate directory
    if [ "${pv_call_keys[pv_directory]}" = "." ]; then
        _pv_CreatePyVenvInWorkingDirectory
    else
        _pv_CreatePyVenvInNewDirectory ${pv_call_keys[pv_directory]}
    fi
    
    # append .pyvenvdir and the new py venv to .gitignore on -g flag
    if [ ${pv_call_keys[git_ignore]} = true ]; then
        _pv_AppendToGitIgnore
    fi
}