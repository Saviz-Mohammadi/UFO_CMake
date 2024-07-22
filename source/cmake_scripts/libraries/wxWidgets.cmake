# [[ Library Options ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

set(wxWidgets_USE_STATIC 1)

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Library Options ]]





# [[ Fetching Library ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

FetchContent_Declare(wxWidgets

    GIT_REPOSITORY "https://github.com/wxWidgets/wxWidgets.git"
    GIT_TAG "v3.2.1"
    GIT_SHALLOW TRUE)


FetchContent_MakeAvailable(wxWidgets)

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Fetching Library ]]





# [[ Grabbing Components ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

list(APPEND EXTERNAL_LIBRARIES_TO_LINK

    wx::base
    wx::core
    wx::adv
    wx::aui
    wx::propgrid
    wx::richtext
    wx::stc
    wx::html
    wx::media
    wx::net
    wx::webview
    wx::xml
    wx::qa
    wx::gl
    wx::ribbon
    wx::xrc)

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Grabbing Components ]]




# [[ GUI Instructions ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

# These properties ensure that CMake builds a GUI app instead
# of a terimnal/console app for Windows and MacOS.
#
# By default Linux does not require any special instructions for this
# operation.
set_target_properties(${EXECUTABLE_NAME}

    PROPERTIES

    WIN32_EXECUTABLE "$<PLATFORM_ID:Windows>"
    MACOSX_BUNDLE "$<PLATFORM_ID:Darwin>")

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ GUI Instructions ]]
