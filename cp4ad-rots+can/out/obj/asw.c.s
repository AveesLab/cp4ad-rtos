	.file	"asw.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.section	.rodata.FuncTask1.str1.1,"aMS",@progbits,1
.LC0:
	.string	"RPM : %d"
	.section	.text.FuncTask1,"ax",@progbits
.global	FuncTask1
	.type	FuncTask1, @function
FuncTask1:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	call lcd_clear
	lds r24,rpm+1
	push r24
	lds r24,rpm
	push r24
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	push r25
	push r24
	call lcd_print
	lds r24,rpm
	lds r25,rpm+1
	adiw r24,20
	sts rpm+1,r25
	sts rpm,r24
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	jmp TerminateTask
	.size	FuncTask1, .-FuncTask1
	.section	.rodata.FuncTask2.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Emergency"
.LC2:
	.string	"[Emergency]"
	.section	.text.FuncTask2,"ax",@progbits
.global	FuncTask2
	.type	FuncTask2, @function
FuncTask2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	call lcd_clear
	ldi r24,lo8(.LC1)
	ldi r25,hi8(.LC1)
	push r25
	push r24
	call lcd_print
	ldi r24,lo8(.LC2)
	ldi r25,hi8(.LC2)
	push r25
	push r24
	call printfSerial
	sts state,__zero_reg__
	sts rpm+1,__zero_reg__
	sts rpm,__zero_reg__
	ldi r22,lo8(-72)
	ldi r23,lo8(11)
	ldi r24,0
	ldi r25,0
	call mdelay
	ldi r24,lo8(1)
	sts state,r24
	ldi r24,lo8(-24)
	ldi r25,lo8(3)
	sts rpm+1,r25
	sts rpm,r24
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	jmp TerminateTask
	.size	FuncTask2, .-FuncTask2
	.section	.rodata.TimerISR.str1.1,"aMS",@progbits,1
.LC3:
	.string	"NORM"
.LC4:
	.string	"EMRG"
.LC5:
	.string	"\n%4ld: "
.LC6:
	.string	"\n%4ld: [%s] RPM = %d"
	.section	.text.TimerISR,"ax",@progbits
.global	TimerISR
	.type	TimerISR, @function
TimerISR:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,0
	call IncrementCounter
	lds r24,state
	ldi r18,lo8(.LC3)
	ldi r19,hi8(.LC3)
	cpse r24,__zero_reg__
	rjmp .L4
	ldi r18,lo8(.LC4)
	ldi r19,hi8(.LC4)
.L4:
	lds r20,c.2391
	lds r21,c.2391+1
	lds r22,c.2391+2
	lds r23,c.2391+3
	movw r26,r22
	movw r24,r20
	adiw r24,1
	adc r26,__zero_reg__
	adc r27,__zero_reg__
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .L5
	ldi r20,lo8(-24)
	ldi r21,lo8(3)
	sts rpm+1,r21
	sts rpm,r20
.L6:
	lds r20,rpm
	lds r21,rpm+1
	sts c.2391,r24
	sts c.2391+1,r25
	sts c.2391+2,r26
	sts c.2391+3,r27
	push r21
	push r20
	push r19
	push r18
	push r27
	push r26
	push r25
	push r24
	ldi r24,lo8(.LC6)
	ldi r25,hi8(.LC6)
	push r25
	push r24
	call printfSerial
	in r24,__SP_L__
	in r25,__SP_H__
	adiw r24,10
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r25
	out __SREG__,__tmp_reg__
	out __SP_L__,r24
/* epilogue start */
	ret
.L5:
	sbrs r23,7
	rjmp .L6
	sts c.2391,r24
	sts c.2391+1,r25
	sts c.2391+2,r26
	sts c.2391+3,r27
	push r27
	push r26
	push r25
	push r24
	ldi r24,lo8(.LC5)
	ldi r25,hi8(.LC5)
	push r25
	push r24
	call printfSerial
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	ret
	.size	TimerISR, .-TimerISR
	.section	.rodata.ButtonISR.str1.1,"aMS",@progbits,1
.LC7:
	.string	"<BUTTON ISR>"
	.section	.text.ButtonISR,"ax",@progbits
.global	ButtonISR
	.type	ButtonISR, @function
ButtonISR:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	call DisableAllInterrupts
	sbic 0x6,0
	rjmp .L9
	ldi r24,lo8(.LC7)
	ldi r25,hi8(.LC7)
	push r25
	push r24
	call printfSerial
	ldi r24,lo8(14)
	call analogRead
	pop __tmp_reg__
	pop __tmp_reg__
	cpi r24,-56
	cpc r25,__zero_reg__
	brge .L11
	ldi r24,lo8(3)
	call ActivateTask
.L11:
	jmp EnableAllInterrupts
.L9:
/* epilogue start */
	ret
	.size	ButtonISR, .-ButtonISR
	.section	.data.c.2391,"aw",@progbits
	.type	c.2391, @object
	.size	c.2391, 4
c.2391:
	.byte	-4
	.byte	-1
	.byte	-1
	.byte	-1
.global	state
	.section	.data.state,"aw",@progbits
	.type	state, @object
	.size	state, 1
state:
	.byte	1
.global	rpm
	.section	.bss.rpm,"aw",@nobits
	.type	rpm, @object
	.size	rpm, 2
rpm:
	.zero	2
	.ident	"GCC: (GNU) 7.3.0"
.global __do_copy_data
.global __do_clear_bss
