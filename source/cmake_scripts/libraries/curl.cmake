# If you're using a Linux machine, you may need to install the OpenSSL
# libraries for Curl to function properly. You can do this by running
# the following command:

# sudo apt-get install libssl-dev


# [[ Library Options ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

# Full list of options: (https://github.com/curl/curl/blob/5ce164e0e9290c96eb7d502173426c0a135ec008/CMakeLists.txt#L84C1-L91C77)

set(BUILD_STATIC_LIBS ON)

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Library Options ]]





# [[ Fetching Library ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

FetchContent_Declare(curl

    URL "https://curl.se/download/curl-8.5.0.tar.gz"
    DOWNLOAD_EXTRACT_TIMESTAMP true)


FetchContent_MakeAvailable(curl)

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Fetching Library ]]





# [[ Grabbing Components ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

list(APPEND EXTERNAL_LIBRARIES_TO_LINK

    CURL::libcurl_static)

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Grabbing Components ]]
