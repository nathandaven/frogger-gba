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
	.file	"game.c"
	.text
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	mov	ip, #16
	mov	r4, #30
	mov	lr, #140
	mov	r0, #1
	mov	r1, #3
	ldr	r3, .L4
	str	r4, [r3, #4]
	str	lr, [r3]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #12]
	str	r0, [r3, #8]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #28]
	str	r1, [r3, #40]
	str	r1, [r3, #44]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initCars
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCars, %function
initCars:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r1, #1
	mov	r4, #32
	mov	lr, r2
	mvn	r8, #0
	mov	r7, #85
	mov	r6, #240
	mov	r5, #110
	mov	ip, #16
	ldr	r3, .L12
.L9:
	ands	r0, r2, #1
	add	r2, r2, #1
	streq	r1, [r3, #24]
	streq	r5, [r3]
	streq	r0, [r3, #4]
	strne	r8, [r3, #24]
	strne	r7, [r3]
	strne	r6, [r3, #4]
	cmp	r2, #16
	str	r4, [r3, #12]
	str	r1, [r3, #8]
	str	ip, [r3, #16]
	str	lr, [r3, #20]
	add	r3, r3, #28
	bne	.L9
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	cars
	.size	initCars, .-initCars
	.align	2
	.global	initLogs
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLogs, %function
initLogs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, lr}
	mov	r0, r2
	mov	lr, #32
	mvn	r7, #0
	mov	r6, #39
	mov	r5, #240
	mov	r1, #1
	mov	r4, #22
	mov	ip, #16
	ldr	r3, .L20
.L17:
	tst	r2, #1
	add	r2, r2, #1
	strne	r1, [r3, #24]
	strne	r4, [r3]
	strne	r0, [r3, #4]
	streq	r7, [r3, #24]
	streq	r6, [r3]
	streq	r5, [r3, #4]
	cmp	r2, #16
	str	lr, [r3, #12]
	str	r1, [r3, #8]
	str	ip, [r3, #16]
	str	r0, [r3, #20]
	add	r3, r3, #28
	bne	.L17
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	logs
	.size	initLogs, .-initLogs
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #4352
	push	{r4, lr}
	mov	r3, #944
	ldr	r4, .L34
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	ldr	r2, .L34+4
	ldr	r1, .L34+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L34+12
	ldr	r1, .L34+16
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L34+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L34+24
	ldr	r1, .L34+28
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L34+32
	ldr	r1, .L34+36
	mov	lr, pc
	bx	r4
	mov	r0, #16
	mov	r2, #3
	mov	r4, #0
	mov	r1, #1
	mov	lr, #30
	mov	ip, #140
	ldr	r3, .L34+40
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r2, [r3, #40]
	str	r2, [r3, #44]
	stm	r3, {ip, lr}
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	r4, [r3, #24]
	str	r4, [r3, #36]
	str	r4, [r3, #28]
	bl	initCars
	bl	initLogs
	ldr	r0, .L34+44
	mov	r3, r4
	mov	r2, r0
.L25:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	beq	.L32
	add	r3, r3, #1
	cmp	r3, #16
	add	r2, r2, #28
	bne	.L25
.L24:
	ldr	r0, .L34+48
	mov	r3, #0
	mov	r2, r0
.L28:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	beq	.L33
	add	r3, r3, #1
	cmp	r3, #16
	add	r2, r2, #28
	bne	.L28
	pop	{r4, lr}
	bx	lr
.L32:
	mov	r2, #1
	rsb	r3, r3, r3, lsl #3
	add	r3, r0, r3, lsl #2
	str	r2, [r3, #20]
	b	.L24
.L33:
	mov	r2, #1
	rsb	r3, r3, r3, lsl #3
	add	r3, r0, r3, lsl #2
	str	r2, [r3, #20]
	pop	{r4, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	DMANow
	.word	100679680
	.word	backgroundTiles
	.word	100722688
	.word	backgroundMap
	.word	backgroundPal
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	player
	.word	cars
	.word	logs
	.size	initGame, .-initGame
	.align	2
	.global	addLog
	.syntax unified
	.arm
	.fpu softvfp
	.type	addLog, %function
addLog:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L41
	mov	r3, #0
	mov	r2, r0
	b	.L39
.L37:
	add	r3, r3, #1
	cmp	r3, #16
	add	r2, r2, #28
	bxeq	lr
.L39:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	bne	.L37
	mov	r2, #1
	rsb	r3, r3, r3, lsl #3
	add	r3, r0, r3, lsl #2
	str	r2, [r3, #20]
	bx	lr
.L42:
	.align	2
.L41:
	.word	logs
	.size	addLog, .-addLog
	.align	2
	.global	addCar
	.syntax unified
	.arm
	.fpu softvfp
	.type	addCar, %function
addCar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L48
	mov	r3, #0
	mov	r2, r0
	b	.L46
.L44:
	add	r3, r3, #1
	cmp	r3, #16
	add	r2, r2, #28
	bxeq	lr
.L46:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	bne	.L44
	mov	r2, #1
	rsb	r3, r3, r3, lsl #3
	add	r3, r0, r3, lsl #2
	str	r2, [r3, #20]
	bx	lr
.L49:
	.align	2
.L48:
	.word	cars
	.size	addCar, .-addCar
	.align	2
	.global	resetLog
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetLog, %function
resetLog:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	tst	r0, #1
	movne	ip, #0
	moveq	ip, #240
	str	lr, [sp, #-4]!
	ldr	r3, .L55
	movne	lr, #21
	moveq	lr, #40
	rsb	r2, r0, r0, lsl #3
	add	r1, r3, r2, lsl #2
	str	ip, [r1, #4]
	mov	r1, #0
	str	lr, [r3, r2, lsl #2]
	lsl	r2, r0, #3
	sub	r0, r2, r0
	add	r3, r3, r0, lsl #2
	str	r1, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L56:
	.align	2
.L55:
	.word	logs
	.size	resetLog, .-resetLog
	.align	2
	.global	resetCar
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetCar, %function
resetCar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	and	r3, r0, #1
	rsblt	r3, r3, #0
	cmp	r3, #1
	movne	ip, #0
	moveq	ip, #240
	str	lr, [sp, #-4]!
	ldr	r3, .L62
	movne	lr, #110
	moveq	lr, #85
	rsb	r2, r0, r0, lsl #3
	add	r1, r3, r2, lsl #2
	str	ip, [r1, #4]
	mov	r1, #0
	str	lr, [r3, r2, lsl #2]
	lsl	r2, r0, #3
	sub	r0, r2, r0
	add	r3, r3, r0, lsl #2
	str	r1, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L63:
	.align	2
.L62:
	.word	cars
	.size	resetCar, .-resetCar
	.align	2
	.global	playerHit
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerHit, %function
playerHit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #30
	mov	r1, #140
	ldr	r3, .L65
	ldr	r2, [r3, #44]
	sub	r2, r2, #1
	str	r2, [r3, #44]
	str	r0, [r3, #4]
	str	r1, [r3]
	bx	lr
.L66:
	.align	2
.L65:
	.word	player
	.size	playerHit, .-playerHit
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #4
	ldr	r3, .L81
	ldr	r1, [r3, #24]
	add	r2, r1, r1, lsl lr
	ldr	r0, .L81+4
	add	r2, r2, r2, lsl #8
	add	r2, r2, r2, lsl #16
	sub	r0, r0, r2
	ldr	r2, .L81+8
	ldr	ip, [r3, #28]
	cmp	r0, r2
	str	ip, [r3, #32]
	str	lr, [r3, #28]
	bcs	.L69
	ldr	r2, [r3, #36]
	ldr	r0, [r3, #40]
	add	r2, r2, #1
	cmp	r2, r0
	str	r2, [r3, #36]
	movge	r2, #0
	strge	r2, [r3, #36]
.L69:
	ldr	r2, .L81+12
	ldrh	r2, [r2, #48]
	tst	r2, #64
	bne	.L71
	ldr	r2, [r3]
	cmp	r2, #0
	movgt	r0, #1
	subgt	r2, r2, #1
	strgt	r2, [r3]
	strgt	r0, [r3, #28]
.L71:
	ldr	r2, .L81+12
	ldrh	r2, [r2, #48]
	ands	r2, r2, #128
	bne	.L72
	ldr	r0, [r3, #20]
	ldr	lr, [r3]
	rsb	r0, r0, #160
	cmp	lr, r0
	addlt	lr, lr, #1
	strlt	lr, [r3]
	strlt	r2, [r3, #28]
.L72:
	ldr	r0, .L81+12
	ldrh	r2, [r0, #48]
	tst	r2, #32
	bne	.L73
	ldr	r2, [r3, #4]
	cmp	r2, #0
	ble	.L73
	mov	ip, #3
	ldrh	r0, [r0, #48]
	sub	r2, r2, #1
	tst	r0, #16
	str	r2, [r3, #4]
	str	ip, [r3, #28]
	beq	.L74
.L77:
	add	r1, r1, #1
	str	r1, [r3, #24]
	ldr	lr, [sp], #4
	bx	lr
.L73:
	ldr	r2, .L81+12
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L76
	ldr	r0, [r3, #16]
	ldr	r2, [r3, #4]
	rsb	r0, r0, #240
	cmp	r0, r2
	ble	.L76
.L79:
	mov	r0, #2
	add	r2, r2, #1
	str	r2, [r3, #4]
	str	r0, [r3, #28]
	b	.L77
.L76:
	ldr	r2, [r3, #28]
	cmp	r2, #4
	bne	.L77
	mov	r2, #0
	str	ip, [r3, #28]
	str	r2, [r3, #36]
	ldr	lr, [sp], #4
	bx	lr
.L74:
	ldr	r0, [r3, #16]
	rsb	r0, r0, #240
	cmp	r2, r0
	blt	.L79
	b	.L77
.L82:
	.align	2
.L81:
	.word	player
	.word	143165576
	.word	286331153
	.word	67109120
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateCars
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCars, %function
updateCars:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #0
	mov	r8, #30
	ldr	r4, .L102
	ldr	r6, .L102+4
	ldr	r7, .L102+8
	sub	sp, sp, #16
	b	.L93
.L101:
	cmp	r3, #0
	ble	.L99
.L89:
	ldr	r0, [r4, #16]
	ldr	r1, [r4, #12]
	ldr	r2, [r4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r6, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r6]
	ldr	r0, [r6, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L85
	mov	r2, #140
	ldr	r3, [r6, #44]
	sub	r3, r3, #1
	str	r8, [r6, #4]
	str	r3, [r6, #44]
	str	r2, [r6]
.L85:
	add	r5, r5, #1
	cmp	r5, #16
	add	r4, r4, #28
	beq	.L100
.L93:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L85
	ldr	r2, [r4, #24]
	ldr	r3, [r4, #4]
	cmp	r2, #1
	addeq	r3, r3, #1
	subne	r3, r3, #1
	cmp	r3, #240
	str	r3, [r4, #4]
	ble	.L101
.L88:
	ands	r3, r5, #1
	moveq	r2, #110
	movne	r2, #85
	movne	r3, #240
	stm	r4, {r2, r3}
	mov	r2, #0
	ldr	r3, [r4, #4]
	str	r2, [r4, #20]
	b	.L89
.L99:
	cmn	r2, #1
	bne	.L89
	b	.L88
.L100:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L103:
	.align	2
.L102:
	.word	cars
	.word	player
	.word	collision
	.size	updateCars, .-updateCars
	.align	2
	.global	updateLogs
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLogs, %function
updateLogs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #0
	ldr	r4, .L128
	mov	r7, r5
	ldr	r6, .L128+4
	ldr	r8, .L128+8
	sub	sp, sp, #16
	b	.L113
.L127:
	cmp	r0, #0
	ble	.L124
.L109:
	add	r1, r6, #16
	ldm	r1, {r1, ip}
	ldm	r6, {r2, r3}
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r3, [sp]
	add	r2, r4, #12
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L105
	ldr	r7, [r4, #24]
	cmp	r7, #1
	ldr	r3, [r6, #4]
	beq	.L125
	mov	r7, #1
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r6, #4]
.L105:
	add	r5, r5, #1
	cmp	r5, #16
	add	r4, r4, #28
	beq	.L126
.L113:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L105
	ldr	r3, [r4, #24]
	ldr	r0, [r4, #4]
	cmp	r3, #1
	addeq	r0, r0, #1
	subne	r0, r0, #1
	cmp	r0, #240
	str	r0, [r4, #4]
	ble	.L127
.L108:
	tst	r5, #1
	movne	r3, #0
	moveq	r3, #240
	movne	r2, #21
	moveq	r2, #40
	stm	r4, {r2, r3}
	mov	r3, #0
	ldr	r0, [r4, #4]
	str	r3, [r4, #20]
	b	.L109
.L124:
	cmn	r3, #1
	bne	.L109
	b	.L108
.L125:
	ldr	r2, [r6, #16]
	add	r2, r3, r2
	cmp	r2, #239
	addle	r3, r3, #1
	add	r5, r5, #1
	strle	r3, [r6, #4]
	cmp	r5, #16
	add	r4, r4, #28
	bne	.L113
.L126:
	cmp	r7, #0
	bne	.L104
	ldr	r2, .L128+4
	ldr	r3, [r2]
	sub	r3, r3, #15
	cmp	r3, #33
	bhi	.L104
	mov	r0, #30
	mov	r1, #140
	ldr	r3, [r2, #44]
	sub	r3, r3, #1
	str	r3, [r2, #44]
	str	r0, [r2, #4]
	str	r1, [r2]
.L104:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L129:
	.align	2
.L128:
	.word	logs
	.word	player
	.word	collision
	.size	updateLogs, .-updateLogs
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L142
	ldr	r0, [r1]
	ldr	r3, .L142+4
	add	r0, r0, #1
	smull	r2, r3, r0, r3
	asr	r2, r0, #31
	add	r3, r3, r0
	rsb	r3, r2, r3, asr #5
	add	ip, r3, r3, lsl #1
	rsb	r3, r3, ip, lsl #3
	subs	r3, r0, r3, lsl #1
	push	{r4, lr}
	str	r0, [r1]
	bne	.L131
	ldr	lr, .L142+8
	mov	r1, lr
.L133:
	ldr	ip, [r1, #20]
	cmp	ip, #0
	beq	.L140
	add	r3, r3, #1
	cmp	r3, #16
	add	r1, r1, #28
	bne	.L133
.L131:
	ldr	r3, .L142+12
	smull	r1, r3, r0, r3
	rsb	r3, r2, r3, asr #4
	add	r2, r3, r3, lsl #1
	add	r3, r3, r2, lsl #2
	subs	r3, r0, r3, lsl #2
	bne	.L134
	ldr	r0, .L142+16
	mov	r2, r0
.L136:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	beq	.L141
	add	r3, r3, #1
	cmp	r3, #16
	add	r2, r2, #28
	bne	.L136
.L134:
	bl	updatePlayer
	bl	updateCars
	pop	{r4, lr}
	b	updateLogs
.L140:
	mov	r1, #1
	rsb	r3, r3, r3, lsl #3
	add	r3, lr, r3, lsl #2
	str	r1, [r3, #20]
	b	.L131
.L141:
	mov	r2, #1
	rsb	r3, r3, r3, lsl #3
	add	r3, r0, r3, lsl #2
	str	r2, [r3, #20]
	bl	updatePlayer
	bl	updateCars
	pop	{r4, lr}
	b	updateLogs
.L143:
	.align	2
.L142:
	.word	counter
	.word	-1307163959
	.word	cars
	.word	1321528399
	.word	logs
	.size	updateGame, .-updateGame
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L145
	ldr	r1, [r2, #36]
	ldr	r3, [r2, #28]
	ldr	r0, [r2, #4]
	ldr	ip, [r2]
	add	r3, r3, r1, lsl #5
	ldr	r1, .L145+4
	lsl	r3, r3, #1
	orr	r2, r0, #16384
	strh	r3, [r1, #4]	@ movhi
	strh	ip, [r1]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	bx	lr
.L146:
	.align	2
.L145:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawCars
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCars, %function
drawCars:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r6, #260
	mov	r5, #256
	ldr	r3, .L156
	ldr	r2, .L156+4
	ldr	r4, .L156+8
	add	lr, r3, #448
.L150:
	ldr	r1, [r3, #20]
	cmp	r1, #0
	beq	.L148
	ldr	r1, [r3, #24]
	cmp	r1, #1
	movne	ip, r6
	moveq	ip, r5
	ldm	r3, {r0, r1}
	orr	r0, r0, #16384
	orr	r1, r1, r4
	strh	ip, [r2, #12]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	strh	r1, [r2, #10]	@ movhi
.L148:
	add	r3, r3, #28
	cmp	r3, lr
	add	r2, r2, #8
	bne	.L150
	pop	{r4, r5, r6, lr}
	bx	lr
.L157:
	.align	2
.L156:
	.word	cars
	.word	shadowOAM
	.word	-32768
	.size	drawCars, .-drawCars
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L169
	mov	lr, pc
	bx	r3
	ldr	r5, .L169+4
	mov	r3, #944
	mov	r0, #3
	ldr	r2, .L169+8
	ldr	r1, .L169+12
	mov	lr, pc
	bx	r5
	ldr	r6, .L169+16
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L169+20
	ldr	r1, .L169+24
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L169+28
	mov	lr, pc
	bx	r5
	ldr	r1, [r6, #36]
	ldr	r3, [r6, #28]
	ldr	r2, [r6, #4]
	ldr	r4, .L169+32
	add	r3, r3, r1, lsl #5
	ldr	r1, [r6]
	lsl	r3, r3, #1
	orr	r2, r2, #16384
	strh	r3, [r4, #4]	@ movhi
	strh	r2, [r4, #2]	@ movhi
	strh	r1, [r4]	@ movhi
	bl	drawCars
	mov	r2, r4
	mov	r4, #192
	ldr	r3, .L169+36
	ldr	lr, .L169+40
	add	ip, r3, #448
.L160:
	ldr	r1, [r3, #20]
	cmp	r1, #0
	beq	.L159
	ldm	r3, {r0, r1}
	orr	r0, r0, #16384
	orr	r1, r1, lr
	strh	r4, [r2, #140]	@ movhi
	strh	r0, [r2, #136]	@ movhi
	strh	r1, [r2, #138]	@ movhi
.L159:
	add	r3, r3, #28
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L160
	ldr	ip, [r6, #44]
	cmp	ip, #0
	ble	.L161
	mov	r1, #0
	mov	r2, #198
	mov	r4, r1
	mov	lr, #320
	ldr	r3, .L169+44
.L162:
	add	r0, r2, #12
	add	r1, r1, #1
	strh	r2, [r3, #2]	@ movhi
	cmp	r1, ip
	lsl	r2, r0, #16
	strh	r4, [r3]	@ movhi
	strh	lr, [r3, #4]	@ movhi
	lsr	r2, r2, #16
	add	r3, r3, #8
	bne	.L162
.L161:
	ldr	r3, .L169+48
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L169+32
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L170:
	.align	2
.L169:
	.word	hideSprites
	.word	DMANow
	.word	100679680
	.word	backgroundTiles
	.word	player
	.word	100722688
	.word	backgroundMap
	.word	backgroundPal
	.word	shadowOAM
	.word	logs
	.word	-32768
	.word	shadowOAM+400
	.word	waitForVBlank
	.size	drawGame, .-drawGame
	.align	2
	.global	drawLogs
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLogs, %function
drawLogs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #192
	ldr	r3, .L179
	ldr	r2, .L179+4
	ldr	lr, .L179+8
	add	ip, r3, #448
.L173:
	ldr	r1, [r3, #20]
	cmp	r1, #0
	beq	.L172
	ldm	r3, {r0, r1}
	orr	r0, r0, #16384
	orr	r1, r1, lr
	strh	r4, [r2, #140]	@ movhi
	strh	r0, [r2, #136]	@ movhi
	strh	r1, [r2, #138]	@ movhi
.L172:
	add	r3, r3, #28
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L173
	pop	{r4, lr}
	bx	lr
.L180:
	.align	2
.L179:
	.word	logs
	.word	shadowOAM
	.word	-32768
	.size	drawLogs, .-drawLogs
	.comm	counter,4,4
	.comm	logs,448,4
	.comm	cars,448,4
	.comm	player,48,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
