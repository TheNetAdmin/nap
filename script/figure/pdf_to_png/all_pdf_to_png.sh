#!/bin/bash

script_path="$(realpath "$(dirname "$0")")"

for file in ./*.pdf
do
    bash "$script_path/pdf_to_png.sh" "$file"
done
