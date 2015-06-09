cmake_minimum_required(VERSION 2.8)

# ExternalProject comes with cmake (I think)
INCLUDE(ExternalProject)

ExternalProject_Add(
    external-childproject
    # where to get sourcecode from:
    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/childproject   
    # where to build it:
    PREFIX ${CMAKE_BINARY_DIR}/childproject  
    # use -DCMAKE_INSTALL_PREFIX to set install directory
    CMAKE_CACHE_ARGS -DCMAKE_INSTALL_PREFIX:STRING=${CMAKE_INSTALL_PREFIX}
)

set(childproject_DIR childproject)
# reads the childproject/childprojectConfig.cmake file
# which makes variables from that file available here
# in the specific, this gives us, in this case:
#    childproject target
#    CHILDPROJECT_INCLUDE_DIRS
#    CHILDPROJECT_LIBRARIES
# (but, if we dont own the child project, we might not be able to
#  control this much)
find_package(childproject REQUIRED)

add_executable( callchild callchild.cpp )
include_directories( ${CHILDPROJECT_INCLUDE_DIRS})
target_link_libraries( callchild ${CHILDPROJECT_LIBRARIES} )

# otherwise, callchild will build before the .so and .h files
# have been installed to install, and thus callchild build will fail
ADD_DEPENDENCIES(callchild external-childproject)

# install callchild components
INSTALL( TARGETS callchild
    RUNTIME DESTINATION bin )
INSTALL( FILES scripts/activate
    DESTINATION . )
INSTALL( PROGRAMS scripts/run.sh
    DESTINATION . )

