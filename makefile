CC = gcc

# Directories
SRC_DIR = src
BUILD_DIR = build
TARGET = $(BUILD_DIR)/genshinlore.exe
# Compilation flags
CFLAGS = -Wall -Wextra -Werror -Iinclude -g

# Libraries
LDLIBS = -lmariadb

# Automatic retrieval of source files (I hate make)
SRCS = $(wildcard $(SRC_DIR)/*.c)
OBJS = $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRCS))

# Main target
all: $(TARGET)

# Link the executable
$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $@ $(LDFLAGS) $(LDLIBS)

# Compile source files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Create the build directory
$(BUILD_DIR):
	if not exist "$(BUILD_DIR)" mkdir "$(BUILD_DIR)"

# Clean up build files
clean:
	if exist "$(BUILD_DIR)" rmdir /S /Q "$(BUILD_DIR)"


# Complete recompilation
re: clean all

.PHONY: all clean re