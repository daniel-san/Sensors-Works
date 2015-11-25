	.file	"uart.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
.global	__vector_11
	.type	__vector_11, @function
__vector_11:
.LFB1:
	.file 1 "uart.c"
	.loc 1 367 0
	.cfi_startproc
	push r1
.LCFI0:
	.cfi_def_cfa_offset 3
	.cfi_offset 1, -2
	push r0
.LCFI1:
	.cfi_def_cfa_offset 4
	.cfi_offset 0, -3
	in r0,__SREG__
	push r0
	clr __zero_reg__
	push r18
.LCFI2:
	.cfi_def_cfa_offset 5
	.cfi_offset 18, -4
	push r24
.LCFI3:
	.cfi_def_cfa_offset 6
	.cfi_offset 24, -5
	push r25
.LCFI4:
	.cfi_def_cfa_offset 7
	.cfi_offset 25, -6
	push r30
.LCFI5:
	.cfi_def_cfa_offset 8
	.cfi_offset 30, -7
	push r31
.LCFI6:
	.cfi_def_cfa_offset 9
	.cfi_offset 31, -8
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 8 */
.L__stack_usage = 8
	.loc 1 375 0
	in r24,0xb
.LVL0:
	.loc 1 376 0
	in r25,0xc
.LVL1:
	.loc 1 386 0
	andi r24,lo8(24)
.LVL2:
	.loc 1 390 0
	lds r30,UART_RxHead
	subi r30,lo8(-(1))
	andi r30,lo8(31)
.LVL3:
	.loc 1 392 0
	lds r18,UART_RxTail
	cp r30,r18
	breq .L3
	.loc 1 397 0
	sts UART_RxHead,r30
	.loc 1 399 0
	ldi r31,0
	subi r30,lo8(-(UART_RxBuf))
	sbci r31,hi8(-(UART_RxBuf))
.LVL4:
	st Z,r25
.LVL5:
	rjmp .L2
.LVL6:
.L3:
	.loc 1 394 0
	ldi r24,lo8(2)
.LVL7:
.L2:
	.loc 1 401 0
	lds r25,UART_LastRxError
.LVL8:
	or r24,r25
.LVL9:
	sts UART_LastRxError,r24
/* epilogue start */
	.loc 1 402 0
	pop r31
	pop r30
	pop r25
	pop r24
	pop r18
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
	.cfi_endproc
.LFE1:
	.size	__vector_11, .-__vector_11
.global	__vector_12
	.type	__vector_12, @function
__vector_12:
.LFB2:
	.loc 1 410 0
	.cfi_startproc
	push r1
.LCFI7:
	.cfi_def_cfa_offset 3
	.cfi_offset 1, -2
	push r0
.LCFI8:
	.cfi_def_cfa_offset 4
	.cfi_offset 0, -3
	in r0,__SREG__
	push r0
	clr __zero_reg__
	push r24
.LCFI9:
	.cfi_def_cfa_offset 5
	.cfi_offset 24, -4
	push r25
.LCFI10:
	.cfi_def_cfa_offset 6
	.cfi_offset 25, -5
	push r30
.LCFI11:
	.cfi_def_cfa_offset 7
	.cfi_offset 30, -6
	push r31
.LCFI12:
	.cfi_def_cfa_offset 8
	.cfi_offset 31, -7
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 7 */
.L__stack_usage = 7
	.loc 1 414 0
	lds r25,UART_TxHead
	lds r24,UART_TxTail
	cp r25,r24
	breq .L6
	.loc 1 416 0
	lds r30,UART_TxTail
	subi r30,lo8(-(1))
	andi r30,lo8(31)
.LVL10:
	.loc 1 417 0
	sts UART_TxTail,r30
	.loc 1 419 0
	ldi r31,0
	subi r30,lo8(-(UART_TxBuf))
	sbci r31,hi8(-(UART_TxBuf))
.LVL11:
	ld r24,Z
	out 0xc,r24
.LVL12:
	rjmp .L5
.L6:
	.loc 1 422 0
	cbi 0xa,5
.L5:
/* epilogue start */
	.loc 1 424 0
	pop r31
	pop r30
	pop r25
	pop r24
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
	.cfi_endproc
.LFE2:
	.size	__vector_12, .-__vector_12
.global	uart_init
	.type	uart_init, @function
uart_init:
.LFB3:
	.loc 1 434 0
	.cfi_startproc
.LVL13:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 435 0
	sts UART_TxHead,__zero_reg__
	.loc 1 436 0
	sts UART_TxTail,__zero_reg__
	.loc 1 437 0
	sts UART_RxHead,__zero_reg__
	.loc 1 438 0
	sts UART_RxTail,__zero_reg__
	.loc 1 458 0
	sbrs r25,7
	rjmp .L9
	.loc 1 461 0
	ldi r18,lo8(2)
	out 0xb,r18
.L9:
	.loc 1 465 0
	andi r25,lo8(-128)
	out 0x20,r25
	.loc 1 467 0
	out 0x9,r24
	.loc 1 470 0
	ldi r24,lo8(-104)
.LVL14:
	out 0xa,r24
	.loc 1 475 0
	ldi r24,lo8(-122)
	out 0x20,r24
	ret
	.cfi_endproc
.LFE3:
	.size	uart_init, .-uart_init
.global	uart_getc
	.type	uart_getc, @function
uart_getc:
.LFB4:
	.loc 1 491 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 497 0
	lds r25,UART_RxHead
	lds r24,UART_RxTail
	cp r25,r24
	breq .L12
	.loc 1 502 0
	lds r25,UART_RxTail
	subi r25,lo8(-(1))
	andi r25,lo8(31)
.LVL15:
	.loc 1 505 0
	mov r30,r25
	ldi r31,0
	subi r30,lo8(-(UART_RxBuf))
	sbci r31,hi8(-(UART_RxBuf))
	ld r18,Z
.LVL16:
	.loc 1 506 0
	lds r24,UART_LastRxError
.LVL17:
	.loc 1 509 0
	sts UART_RxTail,r25
	.loc 1 511 0
	sts UART_LastRxError,__zero_reg__
	.loc 1 512 0
	ldi r25,0
.LVL18:
	mov r25,r24
	clr r24
.LVL19:
	add r24,r18
	adc r25,__zero_reg__
	ret
.LVL20:
.L12:
	.loc 1 498 0
	ldi r24,0
	ldi r25,lo8(1)
	.loc 1 514 0
	ret
	.cfi_endproc
.LFE4:
	.size	uart_getc, .-uart_getc
.global	uart_putc
	.type	uart_putc, @function
uart_putc:
.LFB5:
	.loc 1 524 0
	.cfi_startproc
.LVL21:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 528 0
	lds r25,UART_TxHead
	subi r25,lo8(-(1))
	andi r25,lo8(31)
.LVL22:
.L14:
	.loc 1 530 0 discriminator 1
	lds r18,UART_TxTail
	cp r25,r18
	breq .L14
	.loc 1 534 0
	mov r30,r25
	ldi r31,0
	subi r30,lo8(-(UART_TxBuf))
	sbci r31,hi8(-(UART_TxBuf))
	st Z,r24
	.loc 1 535 0
	sts UART_TxHead,r25
	.loc 1 538 0
	sbi 0xa,5
	ret
	.cfi_endproc
.LFE5:
	.size	uart_putc, .-uart_putc
.global	uart_puts
	.type	uart_puts, @function
uart_puts:
.LFB6:
	.loc 1 550 0
	.cfi_startproc
.LVL23:
	push r28
.LCFI13:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
	push r29
.LCFI14:
	.cfi_def_cfa_offset 4
	.cfi_offset 29, -3
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
.LVL24:
.L17:
	.loc 1 551 0
	ld r24,Y+
.LVL25:
	tst r24
	breq .L19
.LVL26:
	.loc 1 552 0
	rcall uart_putc
.LVL27:
	rjmp .L17
.LVL28:
.L19:
/* epilogue start */
	.loc 1 554 0
	pop r29
	pop r28
.LVL29:
	ret
	.cfi_endproc
.LFE6:
	.size	uart_puts, .-uart_puts
.global	uart_puts_p
	.type	uart_puts_p, @function
uart_puts_p:
.LFB7:
	.loc 1 564 0
	.cfi_startproc
.LVL30:
	push r28
.LCFI15:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
	push r29
.LCFI16:
	.cfi_def_cfa_offset 4
	.cfi_offset 29, -3
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r30,r24
.LVL31:
.L21:
.LBB2:
	.loc 1 567 0
/* #APP */
 ;  567 "uart.c" 1
	lpm r24, Z
	
 ;  0 "" 2
.LVL32:
/* #NOAPP */
	movw r28,r30
	adiw r28,1
.LVL33:
.LBE2:
	.loc 1 567 0
	tst r24
	breq .L23
	.loc 1 568 0
	rcall uart_putc
.LVL34:
	movw r30,r28
	rjmp .L21
.LVL35:
.L23:
/* epilogue start */
	.loc 1 570 0
	pop r29
	pop r28
.LVL36:
	ret
	.cfi_endproc
.LFE7:
	.size	uart_puts_p, .-uart_puts_p
	.local	UART_LastRxError
	.comm	UART_LastRxError,1,1
	.local	UART_RxTail
	.comm	UART_RxTail,1,1
	.local	UART_RxHead
	.comm	UART_RxHead,1,1
	.local	UART_TxTail
	.comm	UART_TxTail,1,1
	.local	UART_TxHead
	.comm	UART_TxHead,1,1
	.local	UART_RxBuf
	.comm	UART_RxBuf,32,1
	.local	UART_TxBuf
	.comm	UART_TxBuf,32,1
.Letext0:
	.file 2 "/usr/avr/include/stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x306
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF32
	.byte	0xc
	.long	.LASF33
	.long	.LASF34
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x2
	.byte	0x7b
	.long	0x37
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF3
	.byte	0x2
	.byte	0x7d
	.long	0x50
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF5
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF8
	.uleb128 0x5
	.byte	0x1
	.long	.LASF12
	.byte	0x1
	.word	0x16a
	.byte	0x1
	.long	.LFB1
	.long	.LFE1
	.long	.LLST0
	.byte	0x1
	.long	0xcf
	.uleb128 0x6
	.long	.LASF9
	.byte	0x1
	.word	0x170
	.long	0x37
	.long	.LLST1
	.uleb128 0x6
	.long	.LASF10
	.byte	0x1
	.word	0x171
	.long	0x37
	.long	.LLST2
	.uleb128 0x7
	.string	"usr"
	.byte	0x1
	.word	0x172
	.long	0x37
	.long	.LLST3
	.uleb128 0x6
	.long	.LASF11
	.byte	0x1
	.word	0x173
	.long	0x37
	.long	.LLST4
	.byte	0
	.uleb128 0x5
	.byte	0x1
	.long	.LASF13
	.byte	0x1
	.word	0x195
	.byte	0x1
	.long	.LFB2
	.long	.LFE2
	.long	.LLST5
	.byte	0x1
	.long	0xfb
	.uleb128 0x6
	.long	.LASF14
	.byte	0x1
	.word	0x19b
	.long	0x37
	.long	.LLST6
	.byte	0
	.uleb128 0x8
	.byte	0x1
	.long	.LASF15
	.byte	0x1
	.word	0x1b1
	.byte	0x1
	.long	.LFB3
	.long	.LFE3
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x127
	.uleb128 0x9
	.long	.LASF17
	.byte	0x1
	.word	0x1b1
	.long	0x50
	.long	.LLST7
	.byte	0
	.uleb128 0xa
	.byte	0x1
	.long	.LASF35
	.byte	0x1
	.word	0x1ea
	.byte	0x1
	.long	0x50
	.long	.LFB4
	.long	.LFE4
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x177
	.uleb128 0x6
	.long	.LASF14
	.byte	0x1
	.word	0x1ec
	.long	0x37
	.long	.LLST8
	.uleb128 0x6
	.long	.LASF10
	.byte	0x1
	.word	0x1ed
	.long	0x37
	.long	.LLST9
	.uleb128 0x6
	.long	.LASF11
	.byte	0x1
	.word	0x1ee
	.long	0x37
	.long	.LLST10
	.byte	0
	.uleb128 0x8
	.byte	0x1
	.long	.LASF16
	.byte	0x1
	.word	0x20b
	.byte	0x1
	.long	.LFB5
	.long	.LFE5
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x1af
	.uleb128 0xb
	.long	.LASF10
	.byte	0x1
	.word	0x20b
	.long	0x37
	.byte	0x1
	.byte	0x68
	.uleb128 0xc
	.long	.LASF9
	.byte	0x1
	.word	0x20d
	.long	0x37
	.byte	0x1
	.byte	0x69
	.byte	0
	.uleb128 0x5
	.byte	0x1
	.long	.LASF18
	.byte	0x1
	.word	0x225
	.byte	0x1
	.long	.LFB6
	.long	.LFE6
	.long	.LLST11
	.byte	0x1
	.long	0x1e2
	.uleb128 0xd
	.string	"s"
	.byte	0x1
	.word	0x225
	.long	0x1e2
	.long	.LLST12
	.uleb128 0xe
	.long	.LVL27
	.long	0x177
	.byte	0
	.uleb128 0xf
	.byte	0x2
	.long	0x1ef
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF19
	.uleb128 0x10
	.long	0x1e8
	.uleb128 0x5
	.byte	0x1
	.long	.LASF20
	.byte	0x1
	.word	0x233
	.byte	0x1
	.long	.LFB7
	.long	.LFE7
	.long	.LLST13
	.byte	0x1
	.long	0x265
	.uleb128 0x9
	.long	.LASF21
	.byte	0x1
	.word	0x233
	.long	0x1e2
	.long	.LLST14
	.uleb128 0x7
	.string	"c"
	.byte	0x1
	.word	0x235
	.long	0x1e8
	.long	.LLST15
	.uleb128 0x11
	.long	.LBB2
	.long	.LBE2
	.long	0x25b
	.uleb128 0x6
	.long	.LASF22
	.byte	0x1
	.word	0x237
	.long	0x45
	.long	.LLST16
	.uleb128 0x6
	.long	.LASF23
	.byte	0x1
	.word	0x237
	.long	0x2c
	.long	.LLST15
	.byte	0
	.uleb128 0xe
	.long	.LVL34
	.long	0x177
	.byte	0
	.uleb128 0x12
	.long	0x37
	.long	0x275
	.uleb128 0x13
	.long	0x275
	.byte	0x1f
	.byte	0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF24
	.uleb128 0xc
	.long	.LASF25
	.byte	0x1
	.word	0x156
	.long	0x28e
	.byte	0x5
	.byte	0x3
	.long	UART_TxBuf
	.uleb128 0x14
	.long	0x265
	.uleb128 0xc
	.long	.LASF26
	.byte	0x1
	.word	0x157
	.long	0x2a5
	.byte	0x5
	.byte	0x3
	.long	UART_RxBuf
	.uleb128 0x14
	.long	0x265
	.uleb128 0xc
	.long	.LASF27
	.byte	0x1
	.word	0x158
	.long	0x2bc
	.byte	0x5
	.byte	0x3
	.long	UART_TxHead
	.uleb128 0x14
	.long	0x37
	.uleb128 0xc
	.long	.LASF28
	.byte	0x1
	.word	0x159
	.long	0x2bc
	.byte	0x5
	.byte	0x3
	.long	UART_TxTail
	.uleb128 0xc
	.long	.LASF29
	.byte	0x1
	.word	0x15a
	.long	0x2bc
	.byte	0x5
	.byte	0x3
	.long	UART_RxHead
	.uleb128 0xc
	.long	.LASF30
	.byte	0x1
	.word	0x15b
	.long	0x2bc
	.byte	0x5
	.byte	0x3
	.long	UART_RxTail
	.uleb128 0xc
	.long	.LASF31
	.byte	0x1
	.word	0x15c
	.long	0x2bc
	.byte	0x5
	.byte	0x3
	.long	UART_LastRxError
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB1-.Ltext0
	.long	.LCFI0-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI0-.Ltext0
	.long	.LCFI1-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI1-.Ltext0
	.long	.LCFI2-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI2-.Ltext0
	.long	.LCFI3-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI3-.Ltext0
	.long	.LCFI4-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI4-.Ltext0
	.long	.LCFI5-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	.LCFI5-.Ltext0
	.long	.LCFI6-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 8
	.long	.LCFI6-.Ltext0
	.long	.LFE1-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 9
	.long	0
	.long	0
.LLST1:
	.long	.LVL3-.Ltext0
	.long	.LVL4-.Ltext0
	.word	0x1
	.byte	0x6e
	.long	.LVL4-.Ltext0
	.long	.LVL5-.Ltext0
	.word	0x5
	.byte	0x3
	.long	UART_RxHead
	.long	.LVL6-.Ltext0
	.long	.LVL7-.Ltext0
	.word	0x1
	.byte	0x6e
	.long	0
	.long	0
.LLST2:
	.long	.LVL1-.Ltext0
	.long	.LVL8-.Ltext0
	.word	0x1
	.byte	0x69
	.long	0
	.long	0
.LLST3:
	.long	.LVL0-.Ltext0
	.long	.LVL2-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST4:
	.long	.LVL2-.Ltext0
	.long	.LVL9-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST5:
	.long	.LFB2-.Ltext0
	.long	.LCFI7-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI7-.Ltext0
	.long	.LCFI8-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI8-.Ltext0
	.long	.LCFI9-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI9-.Ltext0
	.long	.LCFI10-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI10-.Ltext0
	.long	.LCFI11-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI11-.Ltext0
	.long	.LCFI12-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	.LCFI12-.Ltext0
	.long	.LFE2-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 8
	.long	0
	.long	0
.LLST6:
	.long	.LVL10-.Ltext0
	.long	.LVL11-.Ltext0
	.word	0x1
	.byte	0x6e
	.long	.LVL11-.Ltext0
	.long	.LVL12-.Ltext0
	.word	0x5
	.byte	0x3
	.long	UART_TxTail
	.long	0
	.long	0
.LLST7:
	.long	.LVL13-.Ltext0
	.long	.LVL14-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL14-.Ltext0
	.long	.LFE3-.Ltext0
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST8:
	.long	.LVL15-.Ltext0
	.long	.LVL18-.Ltext0
	.word	0x1
	.byte	0x69
	.long	0
	.long	0
.LLST9:
	.long	.LVL16-.Ltext0
	.long	.LVL20-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0
	.long	0
.LLST10:
	.long	.LVL17-.Ltext0
	.long	.LVL19-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST11:
	.long	.LFB6-.Ltext0
	.long	.LCFI13-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI13-.Ltext0
	.long	.LCFI14-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI14-.Ltext0
	.long	.LFE6-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	0
	.long	0
.LLST12:
	.long	.LVL23-.Ltext0
	.long	.LVL24-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL24-.Ltext0
	.long	.LVL25-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL25-.Ltext0
	.long	.LVL26-.Ltext0
	.word	0x3
	.byte	0x8c
	.sleb128 -1
	.byte	0x9f
	.long	.LVL26-.Ltext0
	.long	.LVL28-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL28-.Ltext0
	.long	.LVL29-.Ltext0
	.word	0x3
	.byte	0x8c
	.sleb128 -1
	.byte	0x9f
	.long	0
	.long	0
.LLST13:
	.long	.LFB7-.Ltext0
	.long	.LCFI15-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI15-.Ltext0
	.long	.LCFI16-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI16-.Ltext0
	.long	.LFE7-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	0
	.long	0
.LLST14:
	.long	.LVL30-.Ltext0
	.long	.LVL31-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL31-.Ltext0
	.long	.LVL33-.Ltext0
	.word	0x3
	.byte	0x8e
	.sleb128 1
	.byte	0x9f
	.long	.LVL33-.Ltext0
	.long	.LVL36-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL36-.Ltext0
	.long	.LFE7-.Ltext0
	.word	0x3
	.byte	0x8e
	.sleb128 1
	.byte	0x9f
	.long	0
	.long	0
.LLST15:
	.long	.LVL32-.Ltext0
	.long	.LVL34-1-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL35-.Ltext0
	.long	.LFE7-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST16:
	.long	.LVL31-.Ltext0
	.long	.LVL34-1-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL34-1-.Ltext0
	.long	.LVL35-.Ltext0
	.word	0x3
	.byte	0x8c
	.sleb128 -1
	.byte	0x9f
	.long	.LVL35-.Ltext0
	.long	.LFE7-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF32:
	.string	"GNU C99 5.2.0 -mn-flash=1 -mno-skip-bug -mmcu=avr4 -gdwarf-2 -Os -std=gnu99 -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums"
.LASF22:
	.string	"__addr16"
.LASF34:
	.string	"/home/daniel/Dropbox/Faculdade/Est\303\241gio_iot/UART_test/uartlib"
.LASF31:
	.string	"UART_LastRxError"
.LASF33:
	.string	"uart.c"
.LASF26:
	.string	"UART_RxBuf"
.LASF25:
	.string	"UART_TxBuf"
.LASF12:
	.string	"__vector_11"
.LASF13:
	.string	"__vector_12"
.LASF9:
	.string	"tmphead"
.LASF15:
	.string	"uart_init"
.LASF10:
	.string	"data"
.LASF1:
	.string	"unsigned char"
.LASF30:
	.string	"UART_RxTail"
.LASF27:
	.string	"UART_TxHead"
.LASF6:
	.string	"long unsigned int"
.LASF35:
	.string	"uart_getc"
.LASF23:
	.string	"__result"
.LASF4:
	.string	"unsigned int"
.LASF8:
	.string	"long long unsigned int"
.LASF2:
	.string	"uint8_t"
.LASF24:
	.string	"sizetype"
.LASF14:
	.string	"tmptail"
.LASF7:
	.string	"long long int"
.LASF17:
	.string	"baudrate"
.LASF11:
	.string	"lastRxError"
.LASF20:
	.string	"uart_puts_p"
.LASF21:
	.string	"progmem_s"
.LASF3:
	.string	"uint16_t"
.LASF16:
	.string	"uart_putc"
.LASF5:
	.string	"long int"
.LASF19:
	.string	"char"
.LASF28:
	.string	"UART_TxTail"
.LASF0:
	.string	"signed char"
.LASF29:
	.string	"UART_RxHead"
.LASF18:
	.string	"uart_puts"
	.ident	"GCC: (GNU) 5.2.0"
.global __do_clear_bss
