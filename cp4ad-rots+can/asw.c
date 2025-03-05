#include "bsw.h"

int rpm = 0;
bool state = true; 

TASK(Task1)
{
	lcd_clear();
	lcd_print("RPM : %d", rpm);
	rpm += 20; 
	TerminateTask();
}


TASK(Task2)
{
	lcd_clear();
	lcd_print("Emergency");
	printfSerial("[Emergency]");
	state = false;
	rpm = 0;
	mdelay(3000);
	state = true;
	rpm = 1000;
	TerminateTask();
}

ISR2(TimerISR)
{
	static long c = -4;
	char *out = "NA";
	IncrementCounter(counter1);
   	if (state == true)
    	out = "NORM";
    else if (state == false)
    	out = "EMRG";
	
	if(c==0) rpm = 1000;
	
	if (c<0) printfSerial("\n%4ld: ", ++c);
	else printfSerial("\n%4ld: [%s] RPM = %d", ++c, out, rpm);
}

ISR2(ButtonISR)
{
	int a0;
	DisableAllInterrupts();
	// Write the code below.
	if ((PINC & 0x01) != 0) return;
	printfSerial("<BUTTON ISR>");
	a0 = analogRead(A0); // read ADC value
	if (a0 < 50) { // UP
		ActivateTask(Task2);
	} else if (a0 < 200) { // DOWN
		ActivateTask(Task2);
	} else if (a0 < 380) { // LEFT
	;
	} else if (a0 < 520) { // RIGHT
	;
	}
	EnableAllInterrupts();
}