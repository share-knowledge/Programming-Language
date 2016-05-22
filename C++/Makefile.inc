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

ifdef NEED_LIBEVENT
CXXFLAGS+=-I/usr/local/include/
LDFLAGS+=/usr/local/lib/libevent_core.a -levent
endif

ifdef NEED_BOOST
CXXFLAGS+=-I/usr/local/include/ -DBOOST_LOG_DYN_LINK
LDFLAGS+=-lboost_log-mt -lboost_log_setup-mt -lboost_filesystem-mt -lboost_system-mt -lboost_thread-mt
endif


CXX=g++
CC=gcc
AR=ar

