#! /usr/bin/bash


if [ "$#" -ne  "2" ]; then
    echo "src and dest dirs missing"
    exit 1
fi

function copy_contents() {
    pwd
    if [ ! -d "$2" ]; then
        mkdir "$2"
    fi
    full_from_path=$( realpath "$1" )
    full_to_path=$( realpath "$2" )
    cd "$full_from_path"
    for file in *; do
        if [ -d "$file" ]; then
            from_path=$( realpath "$file" ) 
            cd "$full_to_path"
            to_path=$( realpath "$file" )
            copy_contents "$from_path" "$to_path"
            cd "$full_from_path"
            pwd
        fi
        cp *.o "$full_to_path"
    done
}

copy_contents $1 $2
