data="$(cat config.json)"

idx=1;
for arg in $@; do 
    idx=$(($idx + 1))
    data="$(echo $data | sed -e "s/\$$idx/$arg/g")"
done

curl -X POST http://localhost:8083/connectors -H "Content-Type: application/json" -d "$data"