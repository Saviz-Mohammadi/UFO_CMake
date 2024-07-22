#!/bin/bash



# PATHS:
PATH_JQ_EXECUTABLE="./../jq/jq-macos-amd64"  # Assuming jq executable for Linux is in a similar relative path
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
A_value=""
DCMAKE_BUILD_TYPE_value=""
DCMAKE_CONFIGURATION_TYPES_value=""
DCMAKE_CXX_FLAGS_value=""
DCMAKE_PREFIX_PATH_value=""
DCMAKE_CXX_COMPILER_value=""
DCMAKE_LINKER_value=""



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
        elif [ "$option" = "-A" ]; then

                A_value="$value"
        elif [ "$option" = "-DCMAKE_BUILD_TYPE" ]; then

                DCMAKE_BUILD_TYPE_value="$value"
        elif [ "$option" = "-DCMAKE_CONFIGURATION_TYPES" ]; then

                DCMAKE_CONFIGURATION_TYPES_value="$value"
        elif [ "$option" = "-DCMAKE_CXX_FLAGS" ]; then

                DCMAKE_CXX_FLAGS_value="$value"
        elif [ "$option" = "-DCMAKE_PREFIX_PATH" ]; then

                DCMAKE_PREFIX_PATH_value="$value"
        elif [ "$option" = "-DCMAKE_CXX_COMPILER" ]; then

                DCMAKE_CXX_COMPILER_value="$value"
        elif [ "$option" = "-DCMAKE_LINKER" ]; then

                DCMAKE_LINKER_value="$value"
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
        echo "-A, $A_value"
        echo "-DCMAKE_BUILD_TYPE, $DCMAKE_BUILD_TYPE_value"
        echo "-DCMAKE_CONFIGURATION_TYPES, $DCMAKE_CONFIGURATION_TYPES_value"
        echo "-DCMAKE_CXX_FLAGS, $DCMAKE_CXX_FLAGS_value"
        echo "-DCMAKE_PREFIX_PATH, $DCMAKE_PREFIX_PATH_value"
        echo "-DCMAKE_CXX_COMPILER, $DCMAKE_CXX_COMPILER_value"
        echo "-DCMAKE_LINKER, $DCMAKE_LINKER_value"
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

if [ -n "$A_value" ]; then
        Arguments+=( "-A" "$A_value" )
fi

if [ -n "$DCMAKE_BUILD_TYPE_value" ]; then
        Arguments+=( "-DCMAKE_BUILD_TYPE=$DCMAKE_BUILD_TYPE_value" )
fi

if [ -n "$DCMAKE_CONFIGURATION_TYPES_value" ]; then
        Arguments+=( "-DCMAKE_CONFIGURATION_TYPES=$DCMAKE_CONFIGURATION_TYPES_value" )
fi

if [ -n "$DCMAKE_CXX_FLAGS_value" ]; then
        Arguments+=( "-DCMAKE_CXX_FLAGS=$DCMAKE_CXX_FLAGS_value" )
fi

if [ -n "$DCMAKE_PREFIX_PATH_value" ]; then
        Arguments+=( "-DCMAKE_PREFIX_PATH=$DCMAKE_PREFIX_PATH_value" )
fi

if [ -n "$DCMAKE_CXX_COMPILER_value" ]; then
        Arguments+=( "-DCMAKE_CXX_COMPILER=$DCMAKE_CXX_COMPILER_value" )
fi

if [ -n "$DCMAKE_LINKER_value" ]; then
        Arguments+=( "-DCMAKE_LINKER=$DCMAKE_LINKER_value" )
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
cmake --build "$B_value"

