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
// This function will return true if the two DFA represent the same language, otherwise it will return false.
bool sameLanguage(DFA *dfa1, DFA *dfa2) {
    if (dfa1->numStates != dfa2->numStates || dfa1->numTransitions != dfa2->numTransitions) {
        return false;
    }

    for (int i = 0; i < dfa1->numStates; i++) {
        bool found = false;
        for (int j = 0; j < dfa2->numStates; j++) {
            if (dfa1->states[i].id == dfa2->states[j].id) {
                found = true;
                break;
            }
        }
        if (!found) {
            return false;
        }
    }

    for (int i = 0; i < dfa1->numTransitions; i++) {
        bool found = false;
        for (int j = 0; j < dfa2->numTransitions; j++) {
            if (dfa1->transitions[i].from == dfa2->transitions[j].from &&
                dfa1->transitions[i].to == dfa2->transitions[j].to &&
                dfa1->transitions[i].symbol == dfa2->transitions[j].symbol) {
                found = true;
                break;
            }
        }
        if (!found) {
            return false;
        }
    }

    return true;
}