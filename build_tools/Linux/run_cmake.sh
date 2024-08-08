#!/bin/bash



# PATHS:
PATH_JQ_EXECUTABLE="./../jq/jq-linux-amd64"  # Assuming jq executable for Linux is in a similar relative path
PATH_CONFIGURATION="./config.json"



# FLAGS:
extraEchoEnabled=false
removingBEnabled=false



# Check arguments.
while [[ $# -gt 0 ]]; do

        case "$1" in
        -e)
                extraEchoEnabled=true
                shift
                ;;
        -d)
                removingBEnabled=true
                shift
                ;;
        *)
                shift
                ;;
        esac
done



# Variables corresponding to each CMake argument and value.
declare -A cmake_args

S_value=""
B_value=""
G_value=""
DCMAKE_TOOLCHAIN_FILE_value=""



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
        if [ "$option" = "-S" ]; then

                S_value="$value"
        elif [ "$option" = "-B" ]; then

                B_value="$value"
        elif [ "$option" = "-G" ]; then

                G_value="$value"
        elif [ "$option" = "-DCMAKE_TOOLCHAIN_FILE" ]; then

                DCMAKE_TOOLCHAIN_FILE_value="$value"
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
        echo "-S, $S_value"
        echo "-B, $B_value"
        echo "-G, $G_value"
        echo "-DCMAKE_TOOLCHAIN_FILE, $DCMAKE_TOOLCHAIN_FILE_value"
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
if [ -n "$S_value" ]; then
        Arguments+=( "-S" "$S_value" )
fi

if [ -n "$B_value" ]; then
        Arguments+=( "-B" "$B_value" )
fi

if [ -n "$G_value" ]; then
        Arguments+=( "-G" "$G_value" )
fi

if [ -n "$DCMAKE_TOOLCHAIN_FILE_value" ]; then
        Arguments+=( "-DCMAKE_TOOLCHAIN_FILE=$DCMAKE_TOOLCHAIN_FILE_value" )
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



# Delete contents of build directory if flag is set.
if [ "$removingBEnabled" = true ]; then

        echo "Deleting contents of $B_value"

        rm -rf "$B_value"
        mkdir "$B_value"

        echo "Delete operation complete."
fi



# Call cmake to generate project
cmake "${Arguments[@]}"



# Call cmake to build project
cmake --build "$B_value" --parallel
