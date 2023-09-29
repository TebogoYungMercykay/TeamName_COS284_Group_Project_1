#include <stdio.h>
#include "dfa.h"

extern bool sameLanguage(DFA *dfa1, DFA *dfa2);

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
