SET(CHILDPROJECT_INCLUDE_DIRS ${CMAKE_INSTALL_PREFIX}/include)
SET(CHILDPROJECT_LIBRARIES ${CMAKE_INSTALL_PREFIX}/lib/${CMAKE_SHARED_LIBRARY_PREFIX}childproject${CMAKE_SHARED_LIBRARY_SUFFIX})
SET(CHILDPROJECT_FOUND ON)
ADD_LIBRARY(childproject SHARED IMPORTED)

