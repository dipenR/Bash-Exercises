if [ ! -f "$1" ]; then
    echo "missing data file"
    exit 1
fi

args=( "$@" )
weights=${args[@]:1}

sum_weights=0
for i in ${weights[@]}; do
    sum_weights=$(($sum_weights+$i))
done 

while IFS=',' read -ra record; do
    weighted_sum=0
    for (( i=1; i<${#record[@]}; i++)); do
        if [ "$i" -lt "${#args[@]}" ]; then
            prod=$((${record[i]}*${args[i]}))
            weighted_sum=$(($weighted_sum+$prod))
        else 
            sum_weights=$(($sum_weights+1))
            weighted_sum=$(($weighted_sum+${record[i]}))       
        fi
    done
    average=$(($weighted_sum/$sum_weights))
    echo "${record[0]}:$average"
done < <(tail -n +2 <( tr -d "\r" <$1)) 