bash
Copiar
#!/bin/bash

declare -a urls=("<url1>" "<url2>" "<url3>")

file=$(mktemp)
printf "$(date)" > "$file"
for url in "${urls[@]}"; do
    status=$(curl -m 10 -s -I $url | head -n 1 | awk '{print $2}')
    printf "$url,$status" >> "$file"
done
column -s, -t "$file"
#rm -f "$file"
sleep 10
done
