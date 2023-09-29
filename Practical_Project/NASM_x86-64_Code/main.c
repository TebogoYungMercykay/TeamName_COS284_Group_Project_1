#include <stdio.h>

extern float testDeliverable1();
extern float testDeliverable2();
extern float testDeliverable3();

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