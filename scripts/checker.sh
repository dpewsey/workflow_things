declare -a hosts=("host1" "host2")
for i in "${hosts[@]}"
do [[ $(curl -s https://${i}.domain.com/login\?from\=%2F) =~ "text" ]] && echo ":heavy_check_mark: ${i} is up" || echo ":red_circle: ${i}is down"
done

