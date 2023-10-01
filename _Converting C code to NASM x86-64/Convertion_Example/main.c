#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

typedef struct
{
    int id;
    bool isAccepting;
} State;

// Transition Structure
typedef struct
{
    int from;
    int to;
    char symbol;
} Transition;

// DFA Structure
typedef struct
{
    State *states;
    Transition *transitions;
    int numStates;
    int numTransitions;
    int startState;
} DFA;

// This function will read the file and construct the DFA
DFA* readDfa(const char* filename) {
    FILE* myFile = fopen(filename, "r");
    if (myFile == NULL) {
        return NULL;
    } else {
        int numStates, numTransitions;
        fscanf(myFile, "%d,%d\n", &numStates, &numTransitions);

        // Allocate memory for the DFA structure
        DFA* createDFA = (DFA* )malloc(sizeof(DFA));
        if (createDFA == NULL) {
            fclose(myFile);
            return NULL;
        }

        // Initialize DFA fields
        createDFA->numStates = numStates;
        createDFA->numTransitions = numTransitions;
        createDFA->startState = 0; // Starting state is always 0

        // Allocate memory for states and transitions
        createDFA->states = (State* )malloc(numStates* sizeof(State));
        createDFA->transitions = (Transition* )malloc(numTransitions* sizeof(Transition));

        if (createDFA->states == NULL || createDFA->transitions == NULL) {
            free(createDFA->states);
            free(createDFA->transitions);
            fclose(myFile);
            free(createDFA);
            return NULL;
        }

        // Read state IDs
        for (int i = 0; i < numStates; i++) {
            if (i < numStates - 1) {
                fscanf(myFile, "%d,", &createDFA->states[i].id);
            } else {
                fscanf(myFile, "%d\n", &createDFA->states[i].id);
            }
            // Initialize all states as non-accepting
            createDFA->states[i].isAccepting = false;
        }

        // Read accepting state IDs
        char accept_states_line[256];
        if (fgets(accept_states_line, sizeof(accept_states_line), myFile) != NULL) {
            char* token = strtok(accept_states_line, ",");
            while (token != NULL) {
                int state_id = atoi(token);
                if (state_id >= 0 && state_id < numStates) {
                    createDFA->states[state_id].isAccepting = true;
                }
                token = strtok(NULL, ",");
            }
        }

        // Read transitions
        for (int i = 0; i < numTransitions; i++) {
            int from, to;
            char symbol;
            fscanf(myFile, "%d,%d,%c", &from, &to, &symbol);
            if (from >= 0 && from < numStates && to >= 0 && to < numStates) {
                createDFA->transitions[i].from = from;
                createDFA->transitions[i].to = to;
                createDFA->transitions[i].symbol = symbol;
            } else {
                return NULL;
            }
        }

        fclose(myFile);
        return createDFA;
    }
}



// This function will simulate the input string over the DFA
bool simulateDfa(DFA* dfa, const char* inputString) {
    if (dfa == NULL || inputString == NULL) {
        return false;
    }

    State *currentState = NULL;

    for(int i = 0; i < dfa->numStates; i++) {
        if(dfa->states[i].id == dfa->startState) {
            currentState = &(dfa->states[i]);
            break;
        }
    }

    if (currentState == NULL) {
        return false;
    }

    for(const char *c = inputString; *c != '\0'; c++) {
        char symbol = *c;
        bool transitionFound = false;

        // Check transitions
        for(int i = 0; i < dfa->numTransitions; i++) {
            if(dfa->transitions[i].from == currentState->id && dfa->transitions[i].symbol == symbol) {
                currentState = &(dfa->states[dfa->transitions[i].to]);
                transitionFound = true;
                break;
            }
        }

        // No valid transition found for the symbol
        if(!transitionFound) {
            return false;
        }
    }

    // Check if the final state is an accepting state
    return currentState->isAccepting;
}

// This function will return true if the two DFA represent the same language, otherwise it will return false.
bool sameLanguage(DFA* dfa1, DFA* dfa2) {
    return false;
}