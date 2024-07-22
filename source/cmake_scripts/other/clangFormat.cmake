# [[ Clang-format ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

# First we check to see if clangFormat is installed...
find_program(CLANG_FORMAT_EXE

    NAMES "clang-format"
    DOC "Path to clang-format executable")



# What happens if clangFormat is not found...
if(NOT CLANG_FORMAT_EXE)

    message(STATUS "Clang-Format not found.")
endif()


# What happens if clangFormat is found...
if(CLANG_FORMAT_EXE)

    message(STATUS "Clang-Format found: ${CLANG_FORMAT_EXE}")

    file(GLOB_RECURSE ALL_FILES

        "${CMAKE_SOURCE_DIR}/*.cpp"
        "${CMAKE_SOURCE_DIR}/*.hpp"
        "${CMAKE_SOURCE_DIR}/*.c"
        "${CMAKE_SOURCE_DIR}/*.h")

    message(STATUS "Found source files: ${ALL_FILES}")

    add_custom_target(ApplyFormatting

        COMMAND ${CLANG_FORMAT_EXE} -i -style=file ${ALL_FILES}
        COMMENT "Running clang-format on all source files"
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})  # Set the working directory for the command

    add_dependencies(${EXECUTABLE_NAME} ApplyFormatting)
endif()

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Clang-format ]]
