# Install script for directory: /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/Eigen

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/aarch64-bullseye-linux-gnu-objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/unsupported/Eigen" TYPE FILE FILES
    "/home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/Eigen/AdolcForward"
    "/home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/Eigen/AlignedVector3"
    "/home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/Eigen/ArpackSupport"
    "/home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/Eigen/AutoDiff"
    "/home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/Eigen/BVH"
    "/home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/Eigen/EulerAngles"
    "/home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/Eigen/FFT"
    "/home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/Eigen/IterativeSolvers"
    "/home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/Eigen/KroneckerProduct"
    "/home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/Eigen/LevenbergMarquardt"
    "/home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/Eigen/MatrixFunctions"
    "/home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/Eigen/MoreVectorization"
    "/home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/Eigen/MPRealSupport"
    "/home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/Eigen/NonLinearOptimization"
    "/home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/Eigen/NumericalDiff"
    "/home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/Eigen/OpenGLSupport"
    "/home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/Eigen/Polynomials"
    "/home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/Eigen/Skyline"
    "/home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/Eigen/SparseExtra"
    "/home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/Eigen/SpecialFunctions"
    "/home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/Eigen/Splines"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/unsupported/Eigen" TYPE DIRECTORY FILES "/home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/Eigen/src" FILES_MATCHING REGEX "/[^/]*\\.h$")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/unsupported/Eigen/CXX11/cmake_install.cmake")

endif()

