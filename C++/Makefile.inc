ROOT_DIR=$(shell \
	I=0; \
	DIR=".."; \
	while true; \
	do \
		if [ -f "$${DIR}/__TEST_ROOT_DIR__" ]; then \
			echo "$${DIR}"; \
			break; \
		fi; \
	DIR="$${DIR}/.."; \
	let I=$$I+1; \
	if [ $$I -gt 10 ]; then \
		echo "can't find the root, please check __TEST_ROOT_DIR__ file"; \
		break; \
	fi \
	done \
)

BUILD_INFO="build_in_$(shell date +%Y%m%d_%H_%M_%S)_by_$(shell whoami)"

CXXFLAGS+=-Wall -fPIC -g -I. -I$(ROOT_DIR) -D 'BUILD_INFO="$(BUILD_INFO)"'

CXX=g++
CC=gcc
AR=ar

