CXX 	 := g++
CXXFLAGS := -std=c++17 -Wall -Wextra -Werror -O2

PROJECT    	:= main
SRC_DIR 	:= src
SLIB_DIR 	:= shared_lib

OBJ_NAMES  	:= main.o math.o
SLIB_NAMES	:= librandom.so
OBJECTS    	:= $(addprefix $(SRC_DIR)/, $(OBJ_NAMES))
LDLIBS		:= $(addprefix $(SLIB_DIR)/, $(SLIB_NAMES))

.PHONY: all
all: slib compile run

# compile a shared lib
.PHONY: slib
slib:
	@$(MAKE) -C $(SLIB_DIR) --no-print-directory

# all actions to compile base project source files
.PHONY: compile
compile: $(OBJECTS)
	$(CXX) $(CXXFLAGS) $(OBJECTS) -o $(PROJECT) $(LDLIBS)

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
	@rm -f $(PROJECT)
	@$(MAKE) -C $(SLIB_DIR) --no-print-directory full-clean

.PHONY: clean
clean:
	@rm -f $(SRC_DIR)/*.o
	@$(MAKE) -C $(SLIB_DIR) --no-print-directory clean

# AM as analyze_mode
AM ?= 0
.PHONY: analyze
analyze:
	@if [ "$(AM)" = "ASM" ]; then \
		objdump -d $(PROJECT); \
	elif [ "$(AM)" = "NM" ]; then \
		nm -C $(PROJECT); \
	else \
		echo "Usage: AM=ASM or AM=NM"; \
	fi