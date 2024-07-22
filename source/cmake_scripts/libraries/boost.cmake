# [[ Fetching Library ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

FetchContent_Declare(Boost

    GIT_REPOSITORY "https://github.com/boostorg/boost.git"
    GIT_TAG "boost-1.80.0"
    GIT_SHALLOW TRUE)


FetchContent_MakeAvailable(Boost)

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Fetching Library ]]





# [[ Grabbing Components ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

list(APPEND EXTERNAL_LIBRARIES_TO_LINK

    Boost::filesystem
    Boost::system
    Boost::regex
    Boost::date_time
    Boost::thread
    Boost::coroutine
    Boost::chrono
    Boost::atomic
    Boost::program_options
    Boost::unit_test_framework
    Boost::log
    Boost::serialization
    Boost::math
    Boost::random
    Boost::uuid
    Boost::signals2
    Boost::asio
    Boost::graph
    Boost::property_tree
    Boost::mpi)

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Grabbing Components ]]
