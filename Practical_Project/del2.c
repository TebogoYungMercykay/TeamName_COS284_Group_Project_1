#include <stdio.h>
#include "dfa.h"

extern bool simulateDfa(DFA *dfa, const char *inputString);

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
