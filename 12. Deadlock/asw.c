#include "bsw.h"
#include "mutex.h"

MutexType M1;
MutexType M2;

ISR2(TimerISR)
{
    static long c = -5;
    printfSerial("\n%4ld: ", ++c);
    if(c == -4) {
    	//Write the code below.
		InitMutex(&M1, Event1);
		InitMutex(&M2, Event1);
    }
    //Write the code below.
    else if (c == 4) {
    	ActivateTask(TaskL);
    }
    else if (c == 6) {
    	ActivateTask(TaskH);
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
	printfSerial("TaskH : Try Lock(M2). ");
	//Write the code below.
	GetMutex(&M2);
	printfSerial("TaskH : Get Lock(M2). ");
	//Write the code below.
	mdelay(2000);
	printfSerial("TaskH : Release Lock(M2). ");
	//Write the code below.
	ReleaseMutex(&M2);
	mdelay(1000);
	printfSerial("TaskH : Release Lock(M1). ");
	//Write the code below.
	ReleaseMutex(&M1);
	mdelay(2000);
	printfSerial("<TaskH ends.> ");
    TerminateTask();
}

TASK(TaskL)
{
	printfSerial("<TaskL begins.> ");
	//Write the code below.
	mdelay(1000);
	printfSerial("TaskL : Try Lock(M2). ");
	//Write the code below.
	GetMutex(&M2);
	printfSerial("TaskL : Get Lock(M2). ");
	//Write the code below.
	mdelay(2000);
	printfSerial("TaskL : Try Lock(M1). ");
	//Write the code below.
	GetMutex(&M1);
	printfSerial("TaskL : Get Lock(M1). ");
	//Write the code below.
	mdelay(2000);
	printfSerial("TaskL : Release Lock(M1). ");
	//Write the code below.
	ReleaseMutex(&M1);
	mdelay(1000);
	printfSerial("TaskL : Release Lock(M2). ");
	//Write the code below.
	ReleaseMutex(&M2);
	mdelay(1000);
	printfSerial("<TaskL ends.> ");
	TerminateTask();
}
