#include <stdio.h>

extern float testDeliverable1();
extern float testDeliverable2();
extern float testDeliverable3();

int main()
{
    if (testDeliverable1() < 30 || testDeliverable2() < 30) {
        printf("Warning: Previous Deliverables are not fully correct and might affect Deliverable 3\n");
    }

    float marks = testDeliverable1() + testDeliverable2();
    float task3Mark = testDeliverable3();
    if (task3Mark < 40) {
        printf("Warning: Deliverable 3 is not fully Correct\n");
    }
    // Done
    printf("Total Marks %.f\n", marks + task3Mark);
    return 0;
}