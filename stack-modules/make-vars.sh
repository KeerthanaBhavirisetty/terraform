file=$1

for i in `cat $file grep -v '^#' | awk -F = '{print $1}'`; do
    echo -e "variable $i" '{}'
done
