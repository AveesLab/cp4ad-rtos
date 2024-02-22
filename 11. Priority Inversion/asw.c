#include "bsw.h"
#include "mutex.h"

MutexType M1;

ISR2(TimerISR)
{
    static long c = -5;
    printfSerial("\n%4ld: ", ++c);
    if(c == -4) {
    //Write the code below.
		InitMutex(&M1, Event1);
    }
    //Write the code below.
    else if (c == 0) {
    	ActivateTask(TaskL);
    }
    else if (c == 5) {
    	ActivateTask(TaskH);
    }
    else if (c == 7) {
    	ActivateTask(TaskM);
    }

}

TASK(TaskH)
{
	printfSerial("<TaskH begins.> ");
	//Write the code below.
	mdelay(1000);
	printfSerial("TaskH : Try Lock(M1). ");
	//Write the code below.
	GetMutex(&M1);
	printfSerial("TaskH : Get Lock(M1). ");
	//Write the code below.
	mdelay(3000);
	printfSerial("TaskH : Release Lock(M1). ");
	//Write the code below.
	ReleaseMutex(&M1);
	mdelay(1000);
	printfSerial("<TaskH ends.> ");
    TerminateTask();
}

TASK(TaskM)
{
	printfSerial("<TaskM begins.> ");
	//Write the code below.
	mdelay(3000);
	printfSerial("<TaskM ends.> ");
	TerminateTask();
}

TASK(TaskL)
{
	printfSerial("<TaskL begins.> ");
	//Write the code below.
	mdelay(3000);
	printfSerial("TaskL : Try Lock(M1). ");
	//Write the code below.
	GetMutex(&M1);
	printfSerial("TaskL : Get Lock(M1). ");
	//Write the code below.
	mdelay(9000);
	printfSerial("TaskL : Release Lock(M1). ");
	//Write the code below.
	ReleaseMutex(&M1);
	mdelay(1000);
	printfSerial("<TaskL ends.> ");
	TerminateTask();
}
