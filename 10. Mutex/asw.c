#include "bsw.h"
#include "mutex.h"

MutexType M1;

ISR2(TimerISR)
{
    static long c = -5;
    printfSerial("\n%4ld: ", ++c);
    if(c == -4) {
    	InitMutex(&M1, Event1);
    }
    else if (c == 0) {
    	ActivateTask(TaskL);
    }
    else if (c == 5) {
    	ActivateTask(TaskH);
    }
}

TASK(TaskH)
{
	printfSerial("<TaskH begins.> ");

	mdelay(1000);

	printfSerial("TaskH : Try Lock(M1). ");
	GetMutex(&M1);
	printfSerial("TaskH : Get Lock(M1). ");

	mdelay(3000);

	printfSerial("TaskH : Release Lock(M1). ");
	ReleaseMutex(&M1);

	mdelay(1000);

	printfSerial("<TaskH ends.> ");
    TerminateTask();
}

TASK(TaskL)
{
	printfSerial("<TaskL begins.> ");
	mdelay(2000);

	printfSerial("TaskL : Try Lock(M1). ");
	GetMutex(&M1);
	printfSerial("TaskL : Get Lock(M1). ");

	mdelay(4000);

	printfSerial("TaskL : Release Lock(M1). ");
	ReleaseMutex(&M1);

	mdelay(1000);
	printfSerial("<TaskL ends.> ");
	TerminateTask();
}
