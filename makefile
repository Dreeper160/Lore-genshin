
CC = gcc

# Directories
SRC_DIR = src
BUILD_DIR = build
TARGET = $(BUILD_DIR)/genshinlore.exe

# Compilation flags
CFLAGS = -Wall -Wextra -Werror -Iinclude

# Librairies
LDLIBS = -lmariadb

# Automatic retrieval of source files
SRCS = $(wildcard $(SRC_DIR)/*.c)
OBJS = $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRCS))

# Main target
all: $(TARGET)

# link editiion
$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $@ $(LDFLAGS) $(LDLIBS)


$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Create compilation file
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# clean up
clean:
	rm -rf $(BUILD_DIR)

# Complete recompilation
re: clean all

.PHONY: all clean re
