#!/bin/bash

tree > code.txt
find . -type f \( -iname "*.py" -o -iname "*.h" -o -iname "*.cpp" -o -iname "*.c" -o -iname "*.hpp" -o -iname "*.md" -o -iname "*.yaml" -o -iname "*.yml" -o -iname "*.sh" \) | while read -r file; do
    echo "=====================================" >> code.txt
    echo "File: $file" >> code.txt
    echo "=====================================" >> code.txt
    cat "$file" >> code.txt
    echo "" >> code.txt
done
