#include "bsw.h"

TASK(Task1)
{
	// Write the code below.
	printfSerial("Hello World\n");
	mdelay(3000);
	printfSerial("Goodbye World\n");
	TerminateTask();
}


ISR2(TimerISR)
{
	static long c = 0;
	printfSerial("\n%4ld: ", c++);
}
