#include "bsw.h"

TASK(Task1)
{
	printfSerial("Hello !\n");
	printfSerial("%f\n", 0.1);

	TerminateTask();
}
