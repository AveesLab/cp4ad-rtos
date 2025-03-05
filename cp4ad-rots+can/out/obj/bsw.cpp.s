	.file	"bsw.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.section	.text.lcd_init,"ax",@progbits
.global	lcd_init
	.type	lcd_init, @function
lcd_init:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r18,0
	ldi r20,lo8(2)
	ldi r22,lo8(16)
	ldi r24,lo8(lcd)
	ldi r25,hi8(lcd)
	call _ZN13LiquidCrystal5beginEhhh
	ldi r24,lo8(lcd)
	ldi r25,hi8(lcd)
	jmp _ZN13LiquidCrystal5clearEv
	.size	lcd_init, .-lcd_init
	.section	.text.lcd_print,"ax",@progbits
.global	lcd_print
	.type	lcd_print, @function
lcd_print:
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	subi r28,-128
	sbc r29,__zero_reg__
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 128 */
/* stack size = 130 */
.L__stack_usage = 130
	movw r18,r28
	subi r18,123
	sbci r19,-1
	movw r30,r18
	ld r20,Z+
	ld r21,Z+
	movw r18,r30
	ldi r22,lo8(-128)
	ldi r23,0
	movw r24,r28
	adiw r24,1
	call vsnprintf
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	ldi r24,lo8(lcd)
	ldi r25,hi8(lcd)
	call _ZN5Print5printEPKc
/* epilogue start */
	subi r28,-128
	sbci r29,-1
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	ret
	.size	lcd_print, .-lcd_print
	.section	.text.lcd_clear,"ax",@progbits
.global	lcd_clear
	.type	lcd_clear, @function
lcd_clear:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(lcd)
	ldi r25,hi8(lcd)
	jmp _ZN13LiquidCrystal5clearEv
	.size	lcd_clear, .-lcd_clear
	.section	.text.mdelay,"ax",@progbits
.global	mdelay
	.type	mdelay, @function
mdelay:
	push r4
	push r5
	push r6
	push r7
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
/* prologue: function */
/* frame size = 0 */
/* stack size = 12 */
.L__stack_usage = 12
	movw r12,r22
	movw r14,r24
	call millis
	movw r8,r22
	movw r10,r24
	call millis
	movw r24,r14
	movw r22,r12
	ldi r18,lo8(20)
	ldi r19,0
	ldi r20,0
	ldi r21,0
	call __udivmodsi4
	movw r4,r18
	movw r6,r20
	mov r12,__zero_reg__
	mov r13,__zero_reg__
	movw r14,r12
.L6:
	cp r4,r12
	cpc r5,r13
	cpc r6,r14
	cpc r7,r15
	breq .L4
	call millis
	sub r22,r8
	sbc r23,r9
	sbc r24,r10
	sbc r25,r11
	cpi r22,20
	cpc r23,__zero_reg__
	cpc r24,__zero_reg__
	cpc r25,__zero_reg__
	brlo .L6
	ldi r24,-1
	sub r12,r24
	sbc r13,r24
	sbc r14,r24
	sbc r15,r24
	call millis
	movw r8,r22
	movw r10,r24
	rjmp .L6
.L4:
/* epilogue start */
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	ret
	.size	mdelay, .-mdelay
	.section	.text.printfSerial,"ax",@progbits
.global	printfSerial
	.type	printfSerial, @function
printfSerial:
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	subi r28,-128
	sbc r29,__zero_reg__
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 128 */
/* stack size = 130 */
.L__stack_usage = 130
	movw r18,r28
	subi r18,123
	sbci r19,-1
	movw r30,r18
	ld r20,Z+
	ld r21,Z+
	movw r18,r30
	ldi r22,lo8(-128)
	ldi r23,0
	movw r24,r28
	adiw r24,1
	call vsnprintf
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	ldi r24,lo8(Serial)
	ldi r25,hi8(Serial)
	call _ZN5Print5printEPKc
/* epilogue start */
	subi r28,-128
	sbci r29,-1
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	ret
	.size	printfSerial, .-printfSerial
	.section	.text.loop,"ax",@progbits
.global	loop
	.type	loop, @function
loop:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	ret
	.size	loop, .-loop
	.section	.text.setup,"ax",@progbits
.global	setup
	.type	setup, @function
setup:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r18,lo8(6)
	ldi r20,lo8(-128)
	ldi r21,lo8(37)
	ldi r22,0
	ldi r23,0
	ldi r24,lo8(Serial)
	ldi r25,hi8(Serial)
	call _ZN14HardwareSerial5beginEmh
	call lcd_init
	ldi r22,lo8(64)
	ldi r23,lo8(66)
	ldi r24,lo8(15)
	ldi r25,0
	jmp OsEE_atmega_startTimer1
	.size	setup, .-setup
	.section	.rodata.main.str1.1,"aMS",@progbits,1
.LC0:
	.string	"\n...............\n"
.LC1:
	.string	"...OS Starts...\n"
.LC2:
	.string	"...............\n"
	.section	.text.startup.main,"ax",@progbits
.global	main
	.type	main, @function
main:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
	out 0x8,r24
	ldi r25,lo8(2)
	sts 104,r25
	sts 108,r24
	ldi r24,lo8(-1)
	out 0x1c,r24
/* #APP */
 ;  82 "C:\Users\anhamin\Desktop\CP4AD-~4\bsw.cpp" 1
	sei
 ;  0 "" 2
/* #NOAPP */
	call init
	call setup
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	push r25
	push r24
	call printfSerial
	ldi r24,lo8(.LC1)
	ldi r25,hi8(.LC1)
	push r25
	push r24
	call printfSerial
	ldi r24,lo8(.LC2)
	ldi r25,hi8(.LC2)
	push r25
	push r24
	call printfSerial
	ldi r24,0
	call StartOS
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	ldi r25,0
	ldi r24,0
/* epilogue start */
	ret
	.size	main, .-main
	.section	.text.startup._GLOBAL__sub_I_lcd,"ax",@progbits
	.type	_GLOBAL__sub_I_lcd, @function
_GLOBAL__sub_I_lcd:
	push r12
	push r14
	push r16
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	ldi r24,lo8(7)
	mov r12,r24
	ldi r25,lo8(6)
	mov r14,r25
	ldi r16,lo8(5)
	ldi r18,lo8(4)
	ldi r20,lo8(9)
	ldi r22,lo8(8)
	ldi r24,lo8(lcd)
	ldi r25,hi8(lcd)
	call _ZN13LiquidCrystalC1Ehhhhhh
/* epilogue start */
	pop r16
	pop r14
	pop r12
	ret
	.size	_GLOBAL__sub_I_lcd, .-_GLOBAL__sub_I_lcd
	.global __do_global_ctors
	.section .ctors,"a",@progbits
	.p2align	1
	.word	gs(_GLOBAL__sub_I_lcd)
.global	lcd
	.section	.bss.lcd,"aw",@nobits
	.type	lcd, @object
	.size	lcd, 24
lcd:
	.zero	24
	.ident	"GCC: (GNU) 7.3.0"
.global __do_copy_data
.global __do_clear_bss
