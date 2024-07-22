# [[ Project ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

# Each internal library can act as a project. You can also just use a normal
# variable name for the same purpose if you wish to.

# Project name cannot contain any spaces. Use underlines instead.
project("Lib_Factorial"

    VERSION 0.0.1

    DESCRIPTION "A simple factorial library that calculates
                 the factorial of a number."

    LANGUAGES CXX)

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Project ]]





# [[ Files ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

set(HEADER_FILES

    "${CMAKE_CURRENT_SOURCE_DIR}/include/factorial.hpp")
	

set(SOURCE_FILES

    "${CMAKE_CURRENT_SOURCE_DIR}/src/factorial.cpp")

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Files ]]





# [[ Library ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

add_library(${PROJECT_NAME} STATIC)




target_sources(${PROJECT_NAME}

    PUBLIC
    ${HEADER_FILES}

    PRIVATE
    ${SOURCE_FILES})


target_include_directories(${PROJECT_NAME}
	
    PUBLIC

    "${CMAKE_CURRENT_SOURCE_DIR}/include")


target_link_libraries(${PROJECT_NAME}

    PRIVATE
    ${EXTERNAL_LIBRARIES_TO_LINK})

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Library ]]





# [[ Add Internal Libraries ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

# Include any additional internal libraries that this library may rely on.

target_link_libraries(${PROJECT_NAME}

    PRIVATE)

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Add Internal Libraries ]]
