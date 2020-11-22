if [ "$#" -le "1" ]; then
    echo "input file and dictionary missing"
    exit 1
elif [ "$#" -eq "2" ]; then
    if [ ! -e "$1" ]; then
        echo "$1 is not a file"
        exit 1
    elif [ ! -e "$2" ]; then
        echo "$2 is not a file"
        exit 1
    fi
fi
declare -a dict
while read line; do
    # echo $line
    dict=(${dict[@]} "$line")
done < <(tr -d "\r" <$2)

while read line; do
    words=( $line )
    for i in ${words[@]}; do
        if echo $i | grep -q "^....$"; then
            # echo $i
            if [[ ! ${dict[@]} =~ $i ]]; then
                echo $i
            fi 
        fi
    done
done < <(tr -d "\r" <$1)