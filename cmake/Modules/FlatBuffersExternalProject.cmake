# flatbuffers external project
# target:
#  - flatbuffer_ep
# depends:
#
# defines:
#  - FLATBUFFERS_HOME
#  - FLATBUFFERS_INCLUDE_DIR
#  - FLATBUFFERS_STATIC_LIB
#  - FLATBUFFERS_COMPILER
#  - FBS_DEPENDS, to keep compatible

set(flatbuffers_VERSION "1.9.0")
set(flatbuffers_URL "https://github.com/google/flatbuffers/archive/v${flatbuffers_VERSION}.tar.gz")
set(flatbuffers_URL_MD5 "8be7513bf960034f6873326d09521a4b")

set(FLATBUFFERS_INSTALL_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/external/flatbuffers-install")
set(FBS_DEPENDS flatbuffers_ep)

# The following is needed because in CentOS, the lib directory is named lib64
if(EXISTS "/etc/redhat-release" AND CMAKE_SIZEOF_VOID_P EQUAL 8)
  set(LIB_SUFFIX 64)
endif()

set(FLATBUFFERS_HOME "${FLATBUFFERS_INSTALL_PREFIX}")
set(FLATBUFFERS_INCLUDE_DIR "${FLATBUFFERS_INSTALL_PREFIX}/include")
set(FLATBUFFERS_STATIC_LIB "${FLATBUFFERS_INSTALL_PREFIX}/lib${LIB_SUFFIX}/libflatbuffers.a")
set(FLATBUFFERS_COMPILER "${FLATBUFFERS_INSTALL_PREFIX}/bin/flatc")

ExternalProject_Add(flatbuffers_ep
  PREFIX external/flatbuffers
  URL ${flatbuffers_URL}
  URL_MD5 ${flatbuffers_URL_MD5}
  CMAKE_ARGS
  "-DCMAKE_CXX_FLAGS=-fPIC"
  "-DCMAKE_INSTALL_PREFIX:PATH=${FLATBUFFERS_INSTALL_PREFIX}"
  "-DFLATBUFFERS_BUILD_TESTS=OFF"
  "-DCMAKE_BUILD_TYPE=RELEASE")
