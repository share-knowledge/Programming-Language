# CMake generated Testfile for 
# Source directory: /Users/steven/github/Programming-Language/C++/cmake_example
# Build directory: /Users/steven/github/Programming-Language/C++/cmake_example
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_run "Demo")
add_test(test_usage "Demo")
set_tests_properties(test_usage PROPERTIES  PASS_REGULAR_EXPRESSION "Usage")
subdirs(tool)
