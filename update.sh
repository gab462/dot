#!/bin/sh

FILES=$(find . -type f \
             -not -path "./.git/*" \
             -not -path "./NOTES" \
             -not -path "./PKGS" \
             -not -path "./update.sh")

for file in $FILES; do
    if ! diff $file ${file:1} 1>/dev/null; then
        echo Updating $file with ${file:1}
        echo Diff:
        diff $file ${file:1}
        echo
        cp ${file:1} $file
    fi
done

pacman -Qe | sed -e 's/ .*//' > PKGS
