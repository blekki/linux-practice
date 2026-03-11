CXX 	 := g++
CXXFLAGS := -std=c++17 -Wall -Wextra -Werror -O2
LDLIBS	 := $(SLIB_FOLDER)/librandom.so pthread

PROJECT    	:= main
# rename: folder --> dir
SRC_FOLDER 	:= src
SLIB_FOLDER := shared_lib

OBJ_NAMES  	:= main.o math.o
OBJECTS    	:= $(addprefix $(SRC_FOLDER)/, $(OBJ_NAMES))

.PHONY: all
all: compile run

# compile a shared lib
.PHONY: slib
slib:
	@$(MAKE) -C $(SLIB_FOLDER) --no-print-directory

# all actions to compile base project source files
.PHONY: compile	# todo: ranme to "compile-link"
compile: slib $(OBJECTS)
	$(CXX) $(CXXFLAGS) $(OBJECTS) -o $(PROJECT) $(SLIB_FOLDER)/librandom.so
# 	$(CXX) $(CXXFLAGS) $^ -o ./$(PROJECT) $(LIB_FLAGS)

$(OBJECTS): %.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o $@ $(LDLIBS)

%.cpp:
	@touch $@

# run a compiled project
.PHONY: run
run:
	@echo "~~~ Program result ~~~"
	@./$(PROJECT)

# cleaning
.PHONY: full-clean
full-clean: clean
	@$(MAKE) -C $(SLIB_FOLDER) --no-print-directory full-clean
	@rm -f $(PROJECT)

.PHONY: clean
clean:
	@rm -f $(SRC_FOLDER)/*.o

# AM as analyze_mode
AM ?= 0
.PHONY: analyze
analyze:
ifeq ($(AM), ASM)
	@objdump -d $(PROJECT)
else ifeq ($(AM), NM)
	@nm -C $(PROJECT)
endif