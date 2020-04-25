#!/bin/bash
# Check for expected programs. The user is expected to manually install missing programs themselves.

programs=(
    "nvim"
    "pipenv"
    )
missing_programs=()
found_programs=()

for program in "${programs[@]}"; do
    if [[ ! -x $(command -v "${program}") ]]; then
        missing_programs+=("${program}")
    else
        found_programs+=("${program}")
    fi
done

if [[ "${#missing_programs[@]}" != "0" ]]; then
    echo "Found ${#found_programs[@]}/${#programs[@]} programs."
    echo ""
    echo "Missing programs:"
    for missing_program in "${missing_programs[@]}"; do
        echo "${missing_program}"
    done
else
    echo "Found all programs."
fi
