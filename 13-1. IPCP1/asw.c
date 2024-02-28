#include "bsw.h"
#include "mutex.h"

MutexType M1;
MutexType M2;

ISR2(TimerISR)
{
    static long c = -5;
    printfSerial("\n%4ld: ", ++c);
    if(c == -4) {
    	InitMutex(&M1, Event1);
    	InitMutex(&M2, Event2);
    }
    // Write the code below.
    else if (     ) {
    	
    }
    else if (     ) {
    	
    }
    else if (     ) {
    	
    }
}

// Write the code below.
TASK(TaskH)
{
	printfSerial("<TaskH begins.> ");               // 5s

	printfSerial("TaskH : Try Lock(S2). ");         // 6s
	
	printfSerial("TaskH : Get Lock(S2). ");

	printfSerial("TaskH : Try Lock(S1). ");         // 9s
	
	printfSerial("TaskH : Get Lock(S1). ");
	
	printfSerial("TaskH : Release Lock(S1). ");     // 12s
	

	printfSerial("TaskH : Release Lock(S2). ");     // 13s
	

	printfSerial("<TaskH ends.> ");                 // 14s
    TerminateTask();
}

// Write the code below.
TASK(TaskM)
{
	printfSerial("<TaskM begins.> ");               // 3s
	
	printfSerial("TaskM : Try Lock(S2). ");         // 4s
	
	printfSerial("TaskM : Get Lock(S2). ");

	printfSerial("TaskM : Release Lock(S2). ");     // 6s
	
	
	printfSerial("<TaskM ends.> ");                 // 7s
	TerminateTask();
}

TASK(TaskL)
{
	printfSerial("<TaskL begins.> ");               // 0s
	
	printfSerial("TaskL : Try Lock(S1). ");         // 2s
	
	printfSerial("TaskL : Get Lock(S1). ");

	printfSerial("TaskL : Release Lock(S1). ");     // 6s
	

	printfSerial("<TaskL ends.> ");                 // 7s
	TerminateTask();
}
