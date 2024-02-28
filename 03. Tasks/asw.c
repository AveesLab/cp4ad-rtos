#include "bsw.h"

TASK(Task1)
{
	printfSerial("Task1 Begins...");
	mdelay(3000);
	printfSerial("Task1 Finishes...");

	TerminateTask();
}

TASK(Task2)
{
	// Write the code below.

	TerminateTask();
}

ISR2(TimerISR)
{
	static long c = 0;
	printfSerial("\n%4ld: ", c++);
}
