#include "bsw.h"
#include "mutex.h"

// Write the code below.

ISR2(TimerISR)
{
    static long c = -5;
    printfSerial("\n%4ld: ", ++c);
    if(c == -4) {
    	// Write the code below.
		
    }
    // Write the code below.
    else if (      ) {
    	
    }
    else if (      ) {
    	
    }
}

// Write the code below.
TASK(TaskH)
{
	printfSerial("<TaskH begins.> ");               // 6s
	
	printfSerial("TaskH : Try Lock(M1). ");         // 7s
	
	printfSerial("TaskH : Get Lock(M1). ");
	
	printfSerial("TaskH : Try Lock(M2). ");         // 10s
	
	printfSerial("TaskH : Get Lock(M2). ");
	mdelay(2000);	
	printfSerial("TaskH : Release Lock(M2). ");     // 12s
	ReleaseMutex(&M2);
	mdelay(1000);
	printfSerial("TaskH : Release Lock(M1). ");     // 13s
	ReleaseMutex(&M1);
	mdelay(2000);
	printfSerial("<TaskH ends.> ");                 // 15s
    TerminateTask();
}

// Write the code below.
TASK(TaskL)
{
	printfSerial("<TaskL begins.> ");               // 4s
	
	printfSerial("TaskL : Try Lock(M2). ");         // 5s
	
	printfSerial("TaskL : Get Lock(M2). ");
	
	printfSerial("TaskL : Try Lock(M1). ");         // 7s
	
	printfSerial("TaskL : Get Lock(M1). ");
	mdelay(2000);
	printfSerial("TaskL : Release Lock(M1). ");     // 9s
	ReleaseMutex(&M1);
	mdelay(1000);
	printfSerial("TaskL : Release Lock(M2). ");     // 10s
	ReleaseMutex(&M2);
	mdelay(1000);
	printfSerial("<TaskL ends.> ");                 // 11s
	TerminateTask();
}
