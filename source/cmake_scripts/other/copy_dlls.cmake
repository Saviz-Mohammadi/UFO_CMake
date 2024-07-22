# [[ Windows Copy DLLS ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

# Collect all DLL files in the binary directory recursively.
file(GLOB_RECURSE DLLS "${CMAKE_BINARY_DIR}/**/*.dll")




# Define a custom target for copying DLLs post-build
add_custom_target(CopyDllFiles

    COMMENT "Copying DLLs to the output directory"

    VERBATIM)




foreach(DLL ${DLLS})

    get_filename_component(DIR ${DLL} DIRECTORY)
    

    add_custom_command(TARGET CopyDllFiles POST_BUILD

        COMMAND ${CMAKE_COMMAND} -E copy ${DLL} ${OUTPUT_DIRECTORY}/$<CONFIG>/executable

        COMMENT "Copying ${DLL} to ${OUTPUT_DIRECTORY}/$<CONFIG>/executable"

        VERBATIM)
endforeach()





add_dependencies(${EXECUTABLE_NAME} CopyDllFiles)

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Windows Copy DLLS ]]
