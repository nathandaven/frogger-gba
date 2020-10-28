	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #67108864
	mov	r5, #256
	ldr	r4, .L4
	strh	r5, [r2]	@ movhi
	mov	r3, #2176
	mov	r0, #3
	ldr	r2, .L4+4
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L4+28
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	100679680
	.word	titleTiles
	.word	100722688
	.word	titleMap
	.word	titlePal
	.word	waitForVBlank
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	mov	r3, #4352
	mov	r2, #7168
	ldr	r0, .L8
	push	{r4, lr}
	strh	r3, [r1]	@ movhi
	ldr	r4, .L8+4
	strh	r2, [r1, #10]	@ movhi
	mov	r3, #2176
	strh	r0, [r1, #8]	@ movhi
	ldr	r2, .L8+8
	mov	r0, #3
	ldr	r1, .L8+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L8+16
	ldr	r1, .L8+20
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L8+24
	ldr	r1, .L8+28
	ldrh	r0, [r3, #48]
	ldr	r3, .L8+32
	pop	{r4, lr}
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L9:
	.align	2
.L8:
	.word	7428
	.word	DMANow
	.word	100679680
	.word	titleTiles
	.word	100722688
	.word	titleMap
	.word	67109120
	.word	buttons
	.word	oldButtons
	.size	initialize, .-initialize
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L17
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L17+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L10
	ldr	r3, .L17+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L16
.L10:
	pop	{r4, lr}
	bx	lr
.L16:
	ldr	r3, .L17+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L17+16
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	mov	r0, #4352
	mov	r2, #1
	ldr	r3, .L17+20
	strh	r0, [r1]	@ movhi
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L18:
	.align	2
.L17:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	hideSprites
	.word	initGame
	.word	state
	.size	start, .-start
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	mov	r0, #4352
	mov	r2, #1
	ldr	r3, .L20
	strh	r0, [r1]	@ movhi
	str	r2, [r3]
	bx	lr
.L21:
	.align	2
.L20:
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #67108864
	mov	r5, #256
	ldr	r4, .L24
	strh	r5, [r2]	@ movhi
	mov	r3, #1104
	mov	r0, #3
	ldr	r2, .L24+4
	ldr	r1, .L24+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L24+12
	ldr	r1, .L24+16
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r3, r5
	mov	r0, #3
	ldr	r1, .L24+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L24+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L24+28
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L24+32
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L25:
	.align	2
.L24:
	.word	DMANow
	.word	100679680
	.word	pauseTiles
	.word	100722688
	.word	pauseMap
	.word	pausePal
	.word	waitForVBlank
	.word	hideSprites
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L36
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L36+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L27
	ldr	r2, .L36+8
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L27
	mov	r3, #67108864
	mov	r2, #4352
	mov	r0, #1
	ldr	r1, .L36+12
	strh	r2, [r3]	@ movhi
	strh	r2, [r3]	@ movhi
	str	r0, [r1]
.L26:
	pop	{r4, lr}
	bx	lr
.L27:
	tst	r3, #4
	beq	.L26
	ldr	r3, .L36+8
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L26
	pop	{r4, lr}
	b	goToStart
.L37:
	.align	2
.L36:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #67108864
	mov	r5, #256
	ldr	r4, .L40
	strh	r5, [r2]	@ movhi
	mov	r3, #1632
	mov	r0, #3
	ldr	r2, .L40+4
	ldr	r1, .L40+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L40+12
	ldr	r1, .L40+16
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L40+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L40+24
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L40+28
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L41:
	.align	2
.L40:
	.word	DMANow
	.word	100679680
	.word	winTiles
	.word	100722688
	.word	winMap
	.word	winPal
	.word	waitForVBlank
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L49
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L49+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L42
	ldr	r3, .L49+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L48
.L42:
	pop	{r4, lr}
	bx	lr
.L48:
	pop	{r4, lr}
	b	goToStart
.L50:
	.align	2
.L49:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #67108864
	mov	r5, #256
	ldr	r4, .L53
	strh	r5, [r2]	@ movhi
	mov	r3, #1008
	mov	r0, #3
	ldr	r2, .L53+4
	ldr	r1, .L53+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L53+12
	ldr	r1, .L53+16
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L53+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L53+24
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L53+28
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L54:
	.align	2
.L53:
	.word	DMANow
	.word	100679680
	.word	loseTiles
	.word	100722688
	.word	loseMap
	.word	losePal
	.word	waitForVBlank
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L66
	mov	lr, pc
	bx	r3
	ldr	r3, .L66+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L66+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L56
	ldr	r3, .L66+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L63
.L56:
	ldr	r4, .L66+16
	ldr	r3, [r4, #44]
	cmp	r3, #0
	ble	.L64
.L57:
	ldr	r3, [r4]
	cmp	r3, #3
	ble	.L65
	pop	{r4, lr}
	bx	lr
.L65:
	pop	{r4, lr}
	b	goToWin
.L64:
	bl	goToLose
	b	.L57
.L63:
	bl	goToPause
	b	.L56
.L67:
	.align	2
.L66:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	player
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L79
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+4
	mov	lr, pc
	bx	r3
	ldr	r6, .L79+8
	ldr	fp, .L79+12
	ldr	r5, .L79+16
	ldr	r10, .L79+20
	ldr	r9, .L79+24
	ldr	r8, .L79+28
	ldr	r7, .L79+32
	ldr	r4, .L79+36
.L69:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L70:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L70
.L72:
	.word	.L75
	.word	.L74
	.word	.L73
	.word	.L71
	.word	.L71
.L71:
	mov	lr, pc
	bx	r7
	b	.L69
.L73:
	mov	lr, pc
	bx	r8
	b	.L69
.L74:
	mov	lr, pc
	bx	r9
	b	.L69
.L75:
	mov	lr, pc
	bx	r10
	b	.L69
.L80:
	.align	2
.L79:
	.word	hideSprites
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
