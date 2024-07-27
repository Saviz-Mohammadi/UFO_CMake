# [[ Finding Library ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

find_package(Doxygen REQUIRED)

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Finding Library ]]





# [[ Library Options ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

set(DOXYGEN_GENERATE_HTML

    YES)


set(DOXYGEN_HTML_OUTPUT

    "${CMAKE_BINARY_DIR}/doxygen")


set(DOXYGEN_GENERATE_TREEVIEW

    YES)

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Library Options ]]





# [[ Calling Doxygen ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

doxygen_add_docs(Documentation "${PROJECT_SOURCE_DIR}"

    ALL
    COMMENT "Generating documentation")

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Calling Doxygen ]]