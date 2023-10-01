#ifndef DFA_H
#define DFA_H

#include <stdbool.h>
#include <stdlib.h>

// State Structure
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

#define MAX_ERRORS 10
typedef struct
{
    const char *errors[MAX_ERRORS];
    int numErrors;
} ErrorReport;

// Function declarations
ErrorReport *createErrorReport();
void addErrorToReport(ErrorReport *report, const char *error);
void freeErrorReport(ErrorReport *report);

// Deliverables
DFA *readDfa(const char *filename);
bool simulateDfa(DFA* dfa, const char* inputString);
bool sameLanguage(DFA* dfa1, DFA* dfa2);

void printDfa(DFA *dfa);
ErrorReport *validateDfa(DFA *dfa);
bool compareDfaWithFile(DFA *dfa, const char *filename, ErrorReport *report);
float testDeliverable1();
float testDeliverable2();
float testDeliverable3();

#endif // DFA_H
