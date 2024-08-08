#!/bin/bash



# PATHS:
PATH_JQ_EXECUTABLE="./../jq/jq-macos-amd64"  # Assuming jq executable for MacOS is in a similar relative path
PATH_CONFIGURATION="./config.json"



# FLAGS:
extraEchoEnabled=false



# Check arguments.
while [[ $# -gt 0 ]]; do

        case "$1" in
        -e)
                extraEchoEnabled=true
                shift
                ;;
        *)
                shift
                ;;
        esac
done



# Variables corresponding to each CMake argument and value.
declare -A cmake_args

B_value=""



# Echo messages.
if [ "$extraEchoEnabled" = true ]; then

        echo
        echo "Output of what was provided from jq program"
        echo "[[---------------------------------------------------------------]]"
        echo "[[---------------------------------------------------------------]]"
        echo
fi



# Loop through each option and value pair using jq.
while IFS='@' read -r option value; do

        # Process each option and value pair.
        option="${option}"
        value="${value}"

        # Assign value to corresponding variable
        if [ "$option" = "-B" ]; then

                B_value="$value"
        fi

        # Echo messages.
        if [ "$extraEchoEnabled" = true ]; then

                echo "$option, $value"
        fi
done < <("$PATH_JQ_EXECUTABLE" -r '.cmake_args[] | .option + "@" + .value' "$PATH_CONFIGURATION")



# Echo messages.
if [ "$extraEchoEnabled" = true ]; then

        echo
        echo "[[---------------------------------------------------------------]]"
        echo "[[---------------------------------------------------------------]]"
        echo
        echo
fi



# Echo messages.
if [ "$extraEchoEnabled" = true ]; then

        echo
        echo "Output of what is stored in variables after processing"
        echo "[[---------------------------------------------------------------]]"
        echo "[[---------------------------------------------------------------]]"
        echo
        echo "-B, $B_value"
fi



# Echo messages.
if [ "$extraEchoEnabled" = true ]; then

        echo
        echo "[[---------------------------------------------------------------]]"
        echo "[[---------------------------------------------------------------]]"
        echo
        echo
fi



# Initialize arguments variable.
Arguments=()



# Build arguments with non-empty values.
if [ -n "$B_value" ]; then
        Arguments+=( "$B_value" )
fi



# Echo messages.
if [ "$extraEchoEnabled" = true ]; then

        echo
        echo "Output of what is stored in Arguments"
        echo "[[---------------------------------------------------------------]]"
        echo "[[---------------------------------------------------------------]]"
        echo
        echo "${Arguments[@]}"
fi



# Echo messages.
if [ "$extraEchoEnabled" = true ]; then

        echo
        echo "[[---------------------------------------------------------------]]"
        echo "[[---------------------------------------------------------------]]"
        echo
        echo
fi



# Call CTest
ctest --test-dir "${Arguments[@]}"

