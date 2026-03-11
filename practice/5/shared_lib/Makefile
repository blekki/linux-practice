CXX := g++
CXXFLAGS := -std=c++17 -fPIC -Wall -Wextra -Werror -O2

SLIB_NAME := librandom.so
OBJECTS := random.o

.PHONY: all
all: $(SLIB_NAME) clean

$(SLIB_NAME): $(OBJECTS)
	$(CXX) -shared -o $@ $^

$(OBJECTS): %.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o $@

.PHONY: full-clean
full-clean: clean
	@rm -f $(SLIB_NAME)

.PHONY: clean
clean: $(OBJECTS)
	@rm -f $^