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
		InitMutex(&M2, Event1);
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
	printfSerial("<TaskH begins.> ");               // 4s				
	
	printfSerial("TaskH : Try Lock(S1). ");         // 5s
	
	printfSerial("TaskH : Get Lock(S1). ");
	
	printfSerial("TaskH : Try Lock(S2). ");         // 8s
	
	printfSerial("TaskH : Get Lock(S2). ");
	
	printfSerial("TaskH : Release Lock(S2). ");     // 9s
	

	printfSerial("TaskH : Release Lock(S1). ");     // 10s
	

	printfSerial("<TaskH ends.> ");                 // 11s
    TerminateTask();
}

// Write the code below.
TASK(TaskM)
{
	printfSerial("<TaskM Begins.> ");               // 2s
	
	printfSerial("TaskM : Try Lock(S2), ");         // 5s
	
	printfSerial("TaskM : Get Lock(S2). ");
	
	printfSerial("TaskL : Release Lock(S2). ");     // 6s
	

	printfSerial("<TaskM ends.> ");                 // 7s
	TerminateTask();
}

// Write the code below.
TASK(TaskL)
{
	printfSerial("<TaskL begins.> ");               // 0s
	
	printfSerial("TaskL : Try Lock(S2). ");         // 1s
	
	printfSerial("TaskL : Get Lock(S2). ");
	
	printfSerial("TaskL : Try Lock(S1). ");         // 3s
	
	printfSerial("TaskL : Get Lock(S1). ");
	
	printfSerial("TaskL : Release Lock(S1). ");     // 5s
	

	printfSerial("TaskL : Release Lock(S2). ");     // 6s
	

	printfSerial("<TaskL ends.> ");                 // 8s
	TerminateTask();
}
