# === Compiler and flags ===
CC  := x86_64-w64-mingw32-gcc
CXX := x86_64-w64-mingw32-g++
CFLAGS   := -Wall -Wextra -O0 -g -Icommon
CXXFLAGS := -std=c++17 -Wall -Wextra -O0 -g -Icommon
LDFLAGS  := -shared

# === Directory structure ===
SRC_DIRS := installer common loader
OBJ_DIR := obj
BIN_DIR := bin

# === Source discovery (per directory) ===
INSTALLER_CSOURCES := $(wildcard installer/*.c)
INSTALLER_CPPSOURCES := $(wildcard installer/*.cpp)

LOADER_CSOURCES := $(wildcard loader/*.c)
LOADER_CPPSOURCES := $(wildcard loader/*.cpp)

COMMON_CSOURCES := $(wildcard common/*.c)
COMMON_CPPSOURCES := $(wildcard common/*.cpp)

# === Object lists ===
INSTALLER_OBJS := $(patsubst %.c,$(OBJ_DIR)/%.o,$(INSTALLER_CSOURCES)) \
				  $(patsubst %.cpp,$(OBJ_DIR)/%.o,$(INSTALLER_CPPSOURCES)) \
				  $(patsubst %.c,$(OBJ_DIR)/%.o,$(COMMON_CSOURCES)) \
				  $(patsubst %.cpp,$(OBJ_DIR)/%.o,$(COMMON_CPPSOURCES))

LOADER_OBJS := $(patsubst %.c,$(OBJ_DIR)/%.o,$(LOADER_CSOURCES)) \
			   $(patsubst %.cpp,$(OBJ_DIR)/%.o,$(LOADER_CPPSOURCES)) \
			   $(patsubst %.c,$(OBJ_DIR)/%.o,$(COMMON_CSOURCES)) \
			   $(patsubst %.cpp,$(OBJ_DIR)/%.o,$(COMMON_CPPSOURCES))

# === Output files ===
INSTALLER_DLL := $(BIN_DIR)/installer.dll
LOADER_DLL    := $(BIN_DIR)/loader.dll

# === Default target builds both ===
all: $(INSTALLER_DLL) $(LOADER_DLL)

# === Build installer.dll ===
$(INSTALLER_DLL): $(INSTALLER_OBJS) | $(BIN_DIR)
	$(CXX) $(LDFLAGS) $^ -o $@

# === Build loader.dll ===
$(LOADER_DLL): $(LOADER_OBJS) | $(BIN_DIR)
	$(CXX) $(LDFLAGS) $^ -o $@

# === Compile rules ===
$(OBJ_DIR)/%.o: %.c | prepare_dirs
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o: %.cpp | prepare_dirs
	$(CXX) $(CXXFLAGS) -c $< -o $@

# === Directory creation ===
prepare_dirs:
	@mkdir -p $(BIN_DIR)
	@for dir in $(SRC_DIRS); do mkdir -p $(OBJ_DIR)/$$dir; done

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)

.PHONY: all clean prepare_dirs

