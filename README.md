## Assignment 4: Conway's Game of Life

# Background:
Conway's Game of Life is a popular 2D cellular automaton where the grid is populated with cells that have two possible states: alive (1) or dead (0). The next state of each cell depends on its current state and the states of its eight neighbors.

The rules are simple:

A live cell with fewer than two live neighbors dies (under-population).

A live cell with two or three live neighbors survives to the next generation.

A live cell with more than three live neighbors dies (over-population).

A dead cell with exactly three live neighbors becomes a live cell (reproduction).

In this assignment, we will implement Conway's Game of Life, where the grid evolves over multiple generations.

# Input Format:
The program should read the following input from the command line:
$ ./executable width height generations
Where:

width: The width of the grid (number of cells per row).

height: The height of the grid (number of rows).

generations: The number of generations to simulate.

# Output Format:
For each generation, print the grid with . representing a dead cell (0) and X representing a live cell (1).

Example:
$ ./executable 5 5 5
Generation 1:
.....
.....
..X..
.....
.....

Generation 2:
.....
.....
...X.
.....
.....

Generation 3:
.....
.....  
..X..
.....
.....

Generation 4:
.....
.....
.X...
.....
.....

Generation 5:
.....
.....
..X..
.....
.....

# Program Structure:
Your program should be split into the following files:

main.c: The main entry point of the program, responsible for reading the command-line input, calling the game of life functions, and managing the overall program flow.

game_of_life.c: This file will implement the logic for:

game_of_life_rule(int row, int col, bool **grid, int width, int height); - Determines the next state of the cell at position (row, col) based on the current state of the grid and its neighbors.

next_generation(bool **grid, int width, int height); - Computes the next generation of the grid by applying the game_of_life_rule to each cell.

print_grid(bool **grid, int width, int height); - Prints the current state of the grid.

arrays.c: This file handles memory management:

bool **malloc_2d(int width, int height); - Allocates memory for a 2D grid.

void free_2d(bool **grid, int height); - Frees the memory for the 2D grid.

utils.c: This file contains utility functions for:

initialize_grid_random(bool **grid, int width, int height); - Randomly initializes the grid, setting some cells to true and others to false.

initialize_grid_static(bool **grid, int width, int height); - Optionally, allows for initializing the grid to a predefined state (useful for testing).

# Example Output:
For a 5x5 grid with 5 generations:
$ ./executable 5 5 5
Generation 1:
.....
.....
..X..
.....
.....

Generation 2:
.....
.....
...X.
.....
.....

Generation 3:
.....
.....
..X..
.....
.....

Generation 4:
.....
.....
.X...
.....
.....

Generation 5:
.....
.....
..X..
.....
.....
For a 10x10 grid with a glider pattern starting at generation 1:

$ ./executable 10 10 6
Generation 1:
..........
..........
...X......
....X.....
.X.......
..........
..........
..........
..........
..........

Generation 2:
..........
..........
....X.....
...X......
.....X....
..........
..........
..........
..........
..........

Generation 3:
..........
..........
.....X....
....X.....
..X......
..........
..........
..........
..........
..........

Generation 4:
..........
..........
....X.....
.....X....
.....X....
..........
..........
..........
..........
..........

Generation 5:
..........
..........
.....X....
.....X....
....X.....
..........
..........
..........
..........
..........

Generation 6:
..........
..........
.X......
....X....
....X.....
..........
..........
..........
..........
..........

# Additional Notes:
Edge Handling: Cells on the edges of the grid have fewer than 8 neighbors. For edge cells, treat out-of-bound positions as dead cells (false).

Memory Management: Allocate memory dynamically for the grid, and ensure it is freed properly after the simulation ends.

Random Initialization: If you'd like, you can randomize the initial state of the grid, or you can define a fixed pattern (e.g., a glider, blinker, or other known patterns).

Generations: The program should allow the user to specify how many generations to simulate, and print the grid for each generation.

# Suggested Approach:
Start with grid initialization: Write functions to randomly initialize the grid, and optionally allow static initialization for testing purposes.

Implement the rule logic: Create a function that computes the next state of a cell based on its neighbors.

Implement the generation update: Write a function to update the grid to the next generation by applying the rule to every cell.

Memory management: Ensure proper allocation and deallocation of memory for the grid.

Testing: Test the grid using known patterns (e.g., gliders, blinkers) to verify that your implementation correctly simulates the Game of Life.
