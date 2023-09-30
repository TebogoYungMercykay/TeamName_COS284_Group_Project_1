#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include "dfa.h"

int main()
{
    if (testDeliverable1() < 29 || testDeliverable2() < 29)
    {
        printf("Warning: Previous Deliverables are not fully correct and might affect Deliverable 3\n");
    }

    float marks = testDeliverable3();
    printf("Total Marks %.f\n", marks);

    return 0;
}

// * Implementation in C
// This function will read the file and construct the DFA
DFA* readDfa(const char* filename) {
    return NULL;
}

// This function will simulate the input string over the DFA
bool simulateDfa(DFA* dfa, const char* inputString) {
    return false;
}

// This function will return true if the two DFA represent the same language, otherwise it will return false.
bool sameLanguage(DFA* dfa1, DFA* dfa2) {
    return false;
}

// * Testing Methods for the C-Implementation

float testDeliverable1()
{
    const char *dfaFiles[] = {"dfa1.txt", "dfa2.txt", "dfa3.txt", "dfa4.txt"};
    const int numDFA = 4;
    float marks = 0;
    float marksPerDFA = 30.0 / numDFA;

    for (int i = 0; i < numDFA; i++)
    {
        DFA *dfaTest = readDfa(dfaFiles[i]);

        ErrorReport *report = validateDfa(dfaTest);

        if (!compareDfaWithFile(dfaTest, dfaFiles[i], report))
        {
            for (int j = 0; j < report->numErrors; j++)
            {
                printf("Error: %s\n", report->errors[j]);
            }
        }
        else
        {
            marks += marksPerDFA;
        }

        freeErrorReport(report); // Don't forget to free after each DFA test
    }

    return marks;
}

float testDeliverable2()
{
    const char *dfaFile = "dfa1.txt";

    DFA *dfaTest = readDfa(dfaFile);
    if (!dfaTest)
    {
        printf("Error reading DFA from %s\n", dfaFile);
        return false;
    }

    // Assuming you have a predefined set of test strings for this DFA
    const char *testStrings[] = {"abab", "aaa", "aabbaa", "aababb"}; // These are just sample strings
    bool expectedResults[] = {false, true, true, true};              // Sample expected results
    const int numTests = 4;                                          // Number of test strings
    float marks = 0;
    float marksPerTest = 30.0 / numTests; // Assuming equal marks distribution among all tests

    for (int j = 0; j < numTests; j++)
    {
        bool result = simulateDfa(dfaTest, testStrings[j]);
        if (result == expectedResults[j])
        {
            marks += marksPerTest;
        }
        else
        {
            printf("Simulation mismatch for DFA from %s with input %s. Expected: %s, Got: %s\n", dfaFile, testStrings[j], expectedResults[j] ? "true" : "false", result ? "true" : "false");
        }
    }

    return marks;
}

float testDeliverable3()
{
    const char *dfaFiles1[] = {"dfa1.txt", "dfa2.txt", "dfa3.txt", "dfa4.txt", "dfa1.txt", "dfa2.txt", "dfa4.txt"}; // Example DFA file names
    const char *dfaFiles2[] = {"dfa4.txt", "dfa1.txt", "dfa2.txt", "dfa3.txt", "dfa3.txt", "dfa2.txt", "dfa2.txt"}; // Counterpart DFA file names for comparison
    bool expectedResults[] = {false, true, false, false, false, true, false};                                       // Whether the pairs represent the same language or not
    const int numTests = 7;                                                                                         // Number of pairs to test
    float marks = 0;
    float marksPerTest = 40.0 / numTests;

    for (int i = 0; i < numTests; i++)
    {
        DFA *dfa1 = readDfa(dfaFiles1[i]);
        DFA *dfa2 = readDfa(dfaFiles2[i]);

        if (!dfa1 || !dfa2)
        {
            printf("Error reading one of the DFAs: %s or %s\n", dfaFiles1[i], dfaFiles2[i]);
            continue; // Skip this iteration
        }

        bool result = sameLanguage(dfa1, dfa2);
        if (result == expectedResults[i])
        {
            marks += marksPerTest;
        }
        else
        {
            printf("Mismatch for DFA pair (%s, %s). Expected: %s, Got: %s\n", dfaFiles1[i], dfaFiles2[i], expectedResults[i] ? "true" : "false", result ? "true" : "false");
        }
    }

    return marks;
}

// * Helper Functions

ErrorReport *createErrorReport()
{
    ErrorReport *report = (ErrorReport *)malloc(sizeof(ErrorReport));
    for (int i = 0; i < MAX_ERRORS; i++)
    {
        report->errors[i] = NULL;
    }
    report->numErrors = 0;
    return report;
}

void addErrorToReport(ErrorReport *report, const char *error)
{
    if (report->numErrors < MAX_ERRORS)
    {
        report->errors[report->numErrors++] = strdup(error); // duplicate string so it persists
    }
}

void freeErrorReport(ErrorReport *report)
{
    for (int i = 0; i < report->numErrors; i++)
    {
        free((void *)report->errors[i]); // free the duplicated strings
    }
    free(report);
}

void printDfa(DFA *dfa)
{
    if (!dfa)
    {
        printf("DFA is NULL.\n");
        return;
    }

    printf("DFA Representation:\n\n");

    // Print States
    printf("States:\n");
    for (int i = 0; i < dfa->numStates; i++)
    {
        // Check if this state is the start state
        if (dfa->states[i].id == dfa->startState)
        {
            printf("(%d)", dfa->states[i].id); // Start state
        }
        else
        {
            printf("%d", dfa->states[i].id);
        }

        // Check if this state is an accepting state
        if (dfa->states[i].isAccepting)
        {
            printf("[A]"); // Accepting state
        }

        printf(", ");
    }

    // Print Transitions
    printf("\n\nTransitions:\n");
    for (int i = 0; i < dfa->numTransitions; i++)
    {
        printf("%d --%c--> %d\n", dfa->transitions[i].from, dfa->transitions[i].symbol, dfa->transitions[i].to);
    }
}

ErrorReport *validateDfa(DFA *dfa)
{
    ErrorReport *report = createErrorReport();

    if (!dfa)
    {
        addErrorToReport(report, "The DFA is NULL.");
        return report;
    }

    if (!dfa->states || dfa->numStates <= 0)
    {
        addErrorToReport(report, "The DFA states are missing or the number of states is zero or negative.");
    }
    else
    {
        bool startStateFound = false;
        for (int i = 0; i < dfa->numStates; i++)
        {
            if (dfa->states[i].id == dfa->startState)
            {
                startStateFound = true;
                break;
            }
        }
        if (!startStateFound)
        {
            addErrorToReport(report, "The start state ID doesn't correspond to any of the provided state IDs.");
        }
    }

    if (!dfa->transitions || dfa->numTransitions <= 0)
    {
        addErrorToReport(report, "The DFA transitions are missing or the number of transitions is zero or negative.");
    }
    else
    {
        for (int i = 0; i < dfa->numTransitions; i++)
        {
            bool validFrom = false;
            bool validTo = false;
            for (int j = 0; j < dfa->numStates; j++)
            {
                if (dfa->transitions[i].from == dfa->states[j].id)
                {
                    validFrom = true;
                }
                if (dfa->transitions[i].to == dfa->states[j].id)
                {
                    validTo = true;
                }
            }
            if (!validFrom)
            {
                addErrorToReport(report, "One or more transitions have an invalid 'from' state ID.");
            }
            if (!validTo)
            {
                addErrorToReport(report, "One or more transitions have an invalid 'to' state ID.");
            }
        }
    }

    return report;
}

bool compareDfaWithFile(DFA *dfa, const char *filename, ErrorReport *report)
{
    if (!dfa || !filename || !report)
    {
        addErrorToReport(report, "Invalid inputs provided to the function.");
        return false;
    }

    FILE *file = fopen(filename, "r");
    if (file == NULL)
    {
        addErrorToReport(report, "Error opening file.");
        return false;
    }

    int numStates, numTransitions;
    fscanf(file, "%d,%d\n", &numStates, &numTransitions);

    // Compare number of states
    if (dfa->numStates != numStates)
    {
        addErrorToReport(report, "Mismatch in number of states between DFA and file.");
    }

    // Compare number of transitions
    if (dfa->numTransitions != numTransitions)
    {
        addErrorToReport(report, "Mismatch in number of transitions between DFA and file.");
    }

    int states[numStates];

    for (int i = 0; i < numStates; i++)
    {
        if (i < numStates - 1)
        {
            fscanf(file, "%d,", &states[i]);
        }
        else
        {
            fscanf(file, "%d\n", &states[i]); // Added '\n' to consume the newline
        }
    }

    for (int i = 0; i < numStates; i++)
    {
        bool stateFound = false;
        for (size_t j = 0; j < numStates; j++)
        {
            if (dfa->states[j].id == states[i])
            {
                stateFound = true;
                break;
            }
        }
        if (!stateFound)
        {
            char errorMsg[256];
            sprintf(errorMsg, "State ID %d from the file is found in the provided DFA.", states[i]);
            addErrorToReport(report, errorMsg);
        }
    }

    char accept_states_line[256];
    fgets(accept_states_line, sizeof(accept_states_line), file);
    char *token = strtok(accept_states_line, ",");
    while (token != NULL)
    {
        int state_id = atoi(token);
        if (!dfa->states[state_id].isAccepting)
        {
            char errorMsg[256];
            sprintf(errorMsg, "State ID %d from the file is not an accepting state in the provided DFA.", state_id);
            addErrorToReport(report, errorMsg);
        }
        token = strtok(NULL, ",");
    }

    // Compare transitions
    for (int i = 0; i < numTransitions; i++)
    {
        int from, to;
        char symbol;
        fscanf(file, "%d,%d,%c", &from, &to, &symbol);

        bool transitionMatch = false;
        for (int j = 0; j < dfa->numTransitions; j++)
        {
            if (dfa->transitions[j].from == from && dfa->transitions[j].to == to && dfa->transitions[j].symbol == symbol)
            {
                transitionMatch = true;
                break;
            }
        }

        if (!transitionMatch)
        {
            char errorMsg[256];
            sprintf(errorMsg, "Mismatched transition: %d --%c--> %d was found in the file but not in the DFA.", from, symbol, to);
            addErrorToReport(report, errorMsg);
        }
    }

    fclose(file);

    return report->numErrors == 0;
}
