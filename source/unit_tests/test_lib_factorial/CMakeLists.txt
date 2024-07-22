# [[ Project ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

# Each unit test can act as a project. You can also just use a normal
# variable name for the same purpose if you wish to.

# Project name cannot contain any spaces. Use underlines instead.
project("Test_Lib_Factorial"

    VERSION 0.0.1

    DESCRIPTION "A simple UNIT_TEST to make sure that the
                 Lib_Factorial is working correctly."

    LANGUAGES CXX)

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Project ]]





# [[ Files ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

set(HEADER_FILES

    "${CMAKE_CURRENT_SOURCE_DIR}/include/test_factorial.hpp")


set(SOURCE_FILES

    "${CMAKE_CURRENT_SOURCE_DIR}/src/test_factorial.cpp")

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Files ]]





# [[ Test ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

add_executable(${PROJECT_NAME})




# Tests usually contain well... tests! So i don't see the point of exposing header files to the rest of the project.
# As a result, headers are private
target_sources(${PROJECT_NAME}

    PRIVATE
    ${HEADER_FILES}
    ${SOURCE_FILES})


target_include_directories(${PROJECT_NAME}

    PRIVATE

    "${CMAKE_CURRENT_SOURCE_DIR}/include")


target_link_libraries(${PROJECT_NAME}

    PRIVATE
    ${EXTERNAL_LIBRARIES_TO_LINK})

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Library ]]





# [[ Internal Libraries ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

# The list should be populated by the time we reach here as UNIT_TESTS come
# after everything else. (You can totally ignore the list if you wish to)

target_link_libraries(${PROJECT_NAME}

    PRIVATE
    "Lib_Factorial")

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Internal Libraries ]]





# [[ Discover Test ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

catch_discover_tests(${PROJECT_NAME})

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Discover Test ]]
