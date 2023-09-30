# Only for the main.c file

C_SOURCES := main.c
OBJ_DIR := .
BIN_DIR := .
EXECUTABLE := $(BIN_DIR)/test
C_OBJECTS := $(addprefix $(OBJ_DIR)/, $(notdir $(C_SOURCES:.c=.o)))

all: $(OBJ_DIR) $(BIN_DIR) $(EXECUTABLE)

$(EXECUTABLE): $(C_OBJECTS)
	gcc -o $@ $^

$(OBJ_DIR)/%.o: %.c
	gcc -c $< -o $@

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

run: $(EXECUTABLE)
	./$(EXECUTABLE)

debug: $(EXECUTABLE)
	gdb $(EXECUTABLE)

clean:
	rm -f $(C_OBJECTS) $(EXECUTABLE)
	reset
	clear

fresh: clean all
