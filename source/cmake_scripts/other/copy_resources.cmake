# [[ Custom target for copying resources ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

add_custom_target(CopyResources ALL
        COMMAND ${CMAKE_COMMAND} -E copy_directory
        ${PROJECT_SOURCE_DIR}/resources
        ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/resources
        COMMENT "Copying resources into executable location")

add_dependencies(${EXECUTABLE_NAME} CopyResources)

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Custom target for copying resources ]]
