# [[ MSVC STATIC ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

# These settings ensure that MSVC projects are built as static.

set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Release>:Release>")

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ MSVC STATIC ]]
