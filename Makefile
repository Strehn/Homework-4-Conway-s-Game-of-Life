# Compiler settings
CC = gcc
CFLAGS = -Wall -g

# Directories
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin

# Source files
SRC_FILES = $(SRC_DIR)/main.c \
            $(SRC_DIR)/game_of_life.c \
            $(SRC_DIR)/arrays.c \
            $(SRC_DIR)/utils.c

# Object files
OBJ_FILES = $(SRC_FILES:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

# Output binary name
OUTPUT = $(BIN_DIR)/game_of_life

# Default target: build the program
all: $(OUTPUT)

# Create the binary
$(OUTPUT): $(OBJ_FILES)
	$(CC) $(CFLAGS) -o $@ $^

# Create the object directory if it doesn't exist
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

# Compile .c files to .o files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up build files
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)

# Run the program with test parameters
run: $(OUTPUT)
	./$(OUTPUT) 20 10 5

# Ensure the output directory exists
$(BIN_DIR):
	mkdir -p $(BIN_DIR)

.PHONY: all clean run
