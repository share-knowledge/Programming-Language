NEED_BOOST=1

FILES=$(wildcard test_*.cpp)
OBJS=$(patsubst %.cpp, %.o, $(FILES))
BINS=$(patsubst %.cpp, %, $(FILES))
all:$(BINS)

$(BINS):%:%.o
	$(CXX) -o $@.out $< $(LDFLAGS)

$(OBJS):%.o:%.cpp
	$(CXX) -c $(CXXFLAGS) -o $@ $<

.PHONT:clean

clean:
	rm -rf $(BINS) $(OBJS)


include ../../Makefile.inc
