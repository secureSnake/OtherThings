#!/bin/bash

found=()
interesting=()

echo -e "\e[38;5;129m Finding something sweet..."

find / -user $(whoami) -perm /007 -name "*.conf" -o -name "*.config" -print0 2>/dev/null > tmpfile
while IFS=  read -r -d $'\0'; do
    found+=("$REPLY")
done <tmpfile
rm -f tmpfile


echo -e "\e[38;5;129m Now for something salty..."

for f in "${found[@]}"
do
        if cat $f | grep -q 'username\|password\|passwd'; then
            interesting+=("$f")
        fi
done


if [ "${#interesting[@]}" -ne 0 ]; then
        echo -e "\e[38;5;118m Found something in:"

        for r in "${interesting[@]}"
        do
                printf '\n \e[38;5;118m [*] %s \n' $r
        done
else
    echo -e "\e[31m [-] Found nothing interesting."
fi
