function pv_CreatePyVenvInCurrentDirectory(){
    $PYTHON_VERSION -m venv ".${PWD##*/}"
    echo ".${PWD##*/}" >> .pyvenvdir
}

function pv_CreatePyVenvInNewDirectory(){
    mkdir -p $1
    cd $1
    $PYTHON_VERSION -m venv ".$1"
    echo ".$1" >> .pyvenvdir
}

# function pv_EvalulateOptionalFlags(){
#     while getopts 'v:' OPTION; do
#         case "$OPTION" in
#             v)
#                 PYTHON_VERSION=${OPTARG}
#             ;;
#         esac
#     done
# }

function pvf(){
    if [ ! $1 ]
    then
        echo "No arguments provided."
        return
    fi
    
    local PYTHON_VERSION="python3.9"
    # local pv_EvalulateOptionalFlags ${args}
    local args=("$@")
    local pvf_dir=${args[-1]}
    
    if [ ${pvf_dir} = "." ]
    then
        pv_CreatePyVenvInCurrentDirectory
    else
        pv_CreatePyVenvInNewDirectory ${pvf_dir}
    fi
}