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
	printfSerial("<TaskH begins.> ");
	
	printfSerial("TaskH : Try Lock(M1). ");
	
	printfSerial("TaskH : Get Lock(M1). ");
	
	printfSerial("TaskH : Release Lock(M1). ");	
	

	printfSerial("<TaskH ends.> ");
    TerminateTask();
}

// Write the code below.
TASK(TaskM)
{
	printfSerial("<TaskM begins.> ");
	
	printfSerial("<TaskM ends.> ");
	TerminateTask();
}

// Write the code below.
TASK(TaskL)
{
	printfSerial("<TaskL begins.> ");
	
	printfSerial("TaskL : Try Lock(M1). ");
	
	printfSerial("TaskL : Get Lock(M1). ");
	
	printfSerial("TaskL : Release Lock(M1). ");	
	
	
	printfSerial("<TaskL ends.> ");
	TerminateTask();
}
