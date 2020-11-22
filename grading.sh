if [ "$#" -ne  "1" ]; then
    echo "score directory missing"
    exit 1
fi

if [! -d "$1"]; then
    echo "$1 is not a directory"
fi

cd $1

for file in *.txt; do 
    percentage=$(awk '
    BEGIN {FS = ","} 
    $0 !~ /^[I]/ {for(i=2; i<=NF; i++) sum += $i*2 } 
    END{print sum}' $file)

    ID=$(awk '
    BEGIN {FS = ","} 
    $0 !~ /^[I]/ {print $1}
    ' $file)

    echo $percentage

    if (( $percentage >= 93 )); then
        echo "A"
    elif (( $percentage >= 80 )); then
        echo "B"
    elif (( $percentage >= 65 )); then
        echo "C"
    else
        echo "D"
    fi
done