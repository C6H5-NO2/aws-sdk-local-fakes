#!/bin/sh
filename="antlr.jar"
url="https://www.antlr.org/download/antlr-4.13.2-complete.jar"
sha256="eae2dfa119a64327444672aff63e9ec35a20180dc5b8090b7a6ab85125df4d76"

rm -f "$filename"

curl -fsSL -o "$filename" "$url"
if [ $? -ne 0 ]; then
    exit 1
fi

echo "$sha256 *$filename" | sha256sum -c --quiet --status --strict
if [ $? -ne 0 ]; then
    rm -f "$filename"
    exit 1
fi
