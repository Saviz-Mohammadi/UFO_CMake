# [[ Fetching Library ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

# Integration docs: (https://github.com/catchorg/Catch2/blob/devel/docs/cmake-integration.md)

FetchContent_Declare(Catch2

    GIT_REPOSITORY "https://github.com/catchorg/Catch2.git"
    GIT_TAG "v3.4.0"
    GIT_SHALLOW TRUE)


FetchContent_MakeAvailable(Catch2)

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Fetching Library ]]





# [[ Grabbing Components ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

list(APPEND EXTERNAL_LIBRARIES_TO_LINK

    Catch2::Catch2WithMain)

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Grabbing Components ]]





# [[ Special Catch2 Instructions ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

list(APPEND CMAKE_MODULE_PATH ${catch2_SOURCE_DIR}/extras)
include(CTest)
include(Catch)
set(CMAKE_CATCH_DISCOVER_TESTS_DISCOVERY_MODE PRE_TEST)

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Special Catch2 Instructions ]]
