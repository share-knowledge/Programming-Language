# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.5.2/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.5.2/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/steven/github/Programming-Language/C++/cmake_example2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/steven/github/Programming-Language/C++/cmake_example2/build

# Include any dependencies generated for this target.
include bin/CMakeFiles/hello.dir/depend.make

# Include the progress variables for this target.
include bin/CMakeFiles/hello.dir/progress.make

# Include the compile flags for this target's objects.
include bin/CMakeFiles/hello.dir/flags.make

bin/CMakeFiles/hello.dir/main.cc.o: bin/CMakeFiles/hello.dir/flags.make
bin/CMakeFiles/hello.dir/main.cc.o: ../src/main.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/steven/github/Programming-Language/C++/cmake_example2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object bin/CMakeFiles/hello.dir/main.cc.o"
	cd /Users/steven/github/Programming-Language/C++/cmake_example2/build/bin && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/hello.dir/main.cc.o -c /Users/steven/github/Programming-Language/C++/cmake_example2/src/main.cc

bin/CMakeFiles/hello.dir/main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/hello.dir/main.cc.i"
	cd /Users/steven/github/Programming-Language/C++/cmake_example2/build/bin && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/steven/github/Programming-Language/C++/cmake_example2/src/main.cc > CMakeFiles/hello.dir/main.cc.i

bin/CMakeFiles/hello.dir/main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/hello.dir/main.cc.s"
	cd /Users/steven/github/Programming-Language/C++/cmake_example2/build/bin && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/steven/github/Programming-Language/C++/cmake_example2/src/main.cc -o CMakeFiles/hello.dir/main.cc.s

bin/CMakeFiles/hello.dir/main.cc.o.requires:

.PHONY : bin/CMakeFiles/hello.dir/main.cc.o.requires

bin/CMakeFiles/hello.dir/main.cc.o.provides: bin/CMakeFiles/hello.dir/main.cc.o.requires
	$(MAKE) -f bin/CMakeFiles/hello.dir/build.make bin/CMakeFiles/hello.dir/main.cc.o.provides.build
.PHONY : bin/CMakeFiles/hello.dir/main.cc.o.provides

bin/CMakeFiles/hello.dir/main.cc.o.provides.build: bin/CMakeFiles/hello.dir/main.cc.o


# Object files for target hello
hello_OBJECTS = \
"CMakeFiles/hello.dir/main.cc.o"

# External object files for target hello
hello_EXTERNAL_OBJECTS =

bin/hello: bin/CMakeFiles/hello.dir/main.cc.o
bin/hello: bin/CMakeFiles/hello.dir/build.make
bin/hello: bin/CMakeFiles/hello.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/steven/github/Programming-Language/C++/cmake_example2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable hello"
	cd /Users/steven/github/Programming-Language/C++/cmake_example2/build/bin && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hello.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
bin/CMakeFiles/hello.dir/build: bin/hello

.PHONY : bin/CMakeFiles/hello.dir/build

bin/CMakeFiles/hello.dir/requires: bin/CMakeFiles/hello.dir/main.cc.o.requires

.PHONY : bin/CMakeFiles/hello.dir/requires

bin/CMakeFiles/hello.dir/clean:
	cd /Users/steven/github/Programming-Language/C++/cmake_example2/build/bin && $(CMAKE_COMMAND) -P CMakeFiles/hello.dir/cmake_clean.cmake
.PHONY : bin/CMakeFiles/hello.dir/clean

bin/CMakeFiles/hello.dir/depend:
	cd /Users/steven/github/Programming-Language/C++/cmake_example2/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/steven/github/Programming-Language/C++/cmake_example2 /Users/steven/github/Programming-Language/C++/cmake_example2/src /Users/steven/github/Programming-Language/C++/cmake_example2/build /Users/steven/github/Programming-Language/C++/cmake_example2/build/bin /Users/steven/github/Programming-Language/C++/cmake_example2/build/bin/CMakeFiles/hello.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : bin/CMakeFiles/hello.dir/depend

