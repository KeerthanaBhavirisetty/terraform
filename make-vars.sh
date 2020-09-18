file=$1

for i in `cat $file | awk -F = '{print $1}'`; do
    echo -e "variable $i" '{}'
done
