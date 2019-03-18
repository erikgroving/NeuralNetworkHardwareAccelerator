SRC_DIR = src
TEST_DIR = test
CC=g++
CFLAGS= -std=c++14 -Wall -Wreturn-type -g

SRC = $(wildcard src/*.cpp)
TEST = $(wildcard test/*.cpp)

OBJECTS = $(SRC:%.cpp=%.o)

SRC_OBJECTS = $(filter-out src/main.o, $(OBJECTS))
TEST_OBJECTS = $(TEST:%.cpp=%.o)

all: main

clean :
	rm -f main
	rm -f all_tests
	rm -f $(SRC_DIR)/*.o
	rm -f gtest.a gtest_main.a *.o
	rm -f $(TEST_DIR)/*.o

main: $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o $@

%.o: %.cpp
	$(CC) $(CFLAGS) -c $*.cpp -o $@


# Points to the root of Google Test, relative to where this file is.
# Remember to tweak this if you move this file.
GTEST_DIR = ./googletest

CPPFLAGS += -isystem $(GTEST_DIR)/include

CXXFLAGS += -std=c++14 -g -Wall -pthread

GTEST_HEADERS = $(GTEST_DIR)/include/gtest/*.h \
                $(GTEST_DIR)/include/gtest/internal/*.h

GTEST_SRCS_ = $(GTEST_DIR)/src/*.cc $(GTEST_DIR)/src/*.h $(GTEST_HEADERS)


test/%.o: $(TEST_DIR)/%.cpp \
                     $(SRC_DIR)/*.h $(GTEST_HEADERS)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $(TEST_DIR)/$*.cpp -o $@

all_tests : $(SRC_OBJECTS) $(TEST_OBJECTS) gtest_main.a
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -lpthread $^ -o $@

gtest-all.o : $(GTEST_SRCS_)
	$(CXX) $(CPPFLAGS) -I$(GTEST_DIR) $(CXXFLAGS) -c \
            $(GTEST_DIR)/src/gtest-all.cc

gtest_main.o : $(GTEST_SRCS_)
	$(CXX) $(CPPFLAGS) -I$(GTEST_DIR) $(CXXFLAGS) -c \
            $(GTEST_DIR)/src/gtest_main.cc

gtest.a : gtest-all.o
	$(AR) $(ARFLAGS) $@ $^

gtest_main.a : gtest-all.o gtest_main.o
	$(AR) $(ARFLAGS) $@ $^