#include "bsw.h"

#define UP 		1
#define DOWN 	-1

#define OUT(in)	(in == UP ? "UP" : (in == DOWN ? "DOWN" : "NA"))

int R1_in;
int R2_in;
int R3_in;
int R4_in;
int R5_in;
int R6_in;
int R7_in_1;
int R7_in_2;
int R7_in_3;
int R7_out;

void Runnable_1(void)
{
	
}

void Runnable_2(void)
{
	

void Runnable_3(void)
{
	
}

void Runnable_4(void)
{
	
}

void Runnable_5(void)
{
	
}

void Runnable_6(void)
{
	
}

void Runnable_7(void)
{
	if (R7_in_1 == UP && R7_in_2 == UP && R7_in_3 == UP)
	{
		R7_out = UP;
	}
	else if (R7_in_1 == DOWN && R7_in_2 == DOWN && R7_in_3 == DOWN)
	{
		R7_out = DOWN;
	}
}

ISR2(TimerISR)
{
    static long c = -5;
    IncrementCounter(counter1);
    printfSerial("\n%4ld: [%s] ", ++c, OUT(R7_out));
}

ISR2(ButtonISR)
{
    int a0;
	DisableAllInterrupts();
	if ((PINC & 0x01) != 0) return;

    a0 = analogRead(A0); // read ADC value
    if (a0 < 50) {	// UP
    	R1_in = UP;
    	printfSerial("<BUTTON UP>");
    } else if (a0 < 200) { // DOWN
    	R1_in = DOWN;
    	printfSerial("<BUTTON DOWN>");
    } else if (a0 < 380) { // LEFT
        ;
    } else if (a0 < 520) { // RIGHT
        ;
    }
	EnableAllInterrupts();
}

TASK(Task_2s)
{
	printfSerial("Task_2s begins... ");

	printfSerial("Task_2s finishes... ");
    TerminateTask();
}

TASK(Task_4s)
{
	printfSerial("Task_4s begins... ");

	printfSerial("Task_4s finishes... ");
	TerminateTask();
}

TASK(Task_8s)
{
	printfSerial("Task_8s begins... ");
	Runnable_1();
	Runnable_2();
	Runnable_3();
	Runnable_4();
	Runnable_5();
	Runnable_6();
	Runnable_7();
	printfSerial("Task_8s finishes... ");
	TerminateTask();
}
