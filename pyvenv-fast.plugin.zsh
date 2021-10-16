function pv_GenerateGitIgnore(){
    echo ".pyvenvdir" >> .gitignore
    echo "/.${call_state[pv_directory]}" >> .gitignore
}

function pv_CreatePyVenvInCurrentDirectory(){
    ${call_state[python_version]} -m venv ".${PWD##*/}"
    echo ".${PWD##*/}" >> .pyvenvdir
}

function pv_CreatePyVenvInNewDirectory(){
    mkdir -p ${call_state[pv_directory]}
    cd ${call_state[pv_directory]}
    ${call_state[python_version]} -m venv ".${call_state[pv_directory]}"
    echo ".${call_state[pv_directory]}" >> .pyvenvdir
}

function pv(){
    declare -A local call_state
    call_state[pv_directory]=${argv[-1]}
    call_state[python_version]="python3.10"
    call_state[git_ignore]=false
    
    
    # exit if no args
    if [ ! ${1} ]; then
        echo "usage: pv [-v] directory"
        return
    fi
    
    # check for flags
    while getopts 'v:g' OPTION; do
        case "${OPTION}" in
            v) # python version flag -v
                call_state[python_version]=${OPTARG}
                echo "Using ${call_state[python_version]}..."
            ;;
            g) # git ignore append flag -g
                call_state[git_ignore]=true
            ;;
        esac
    done
    
    # call in current or new dir
    if [ "${call_state[pv_directory]}" = "." ]; then
        pv_CreatePyVenvInCurrentDirectory
    else
        pv_CreatePyVenvInNewDirectory ${call_state[pv_directory]}
    fi
    
    if [ ${call_state[git_ignore]} ]; then
        pv_GenerateGitIgnore
    fi
}