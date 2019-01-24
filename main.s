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
	.global	goToStart1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart1, %function
goToStart1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #256
	mov	r4, #67108864
	mov	r5, #0
	ldr	r6, .L4
	strh	r5, [r4, #16]	@ movhi
	strh	r3, [r4]	@ movhi
	strh	r5, [r4, #18]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L4+4
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r3, #2544
	mov	r2, #100663296
	ldr	r1, .L4+8
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r3, #1024
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r2, #7936
	ldr	r3, .L4+20
	strh	r2, [r4, #8]	@ movhi
	str	r5, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	bgStart1Pal
	.word	bgStart1Tiles
	.word	100726784
	.word	bgStart1Map
	.word	state
	.size	goToStart1, .-goToStart1
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
	push	{r4, lr}
	mov	r3, #16384
	ldr	r4, .L8
	ldr	r2, .L8+4
	ldr	r1, .L8+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L8+12
	ldr	r1, .L8+16
	mov	r0, #3
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+28
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r1, #4352
	ldr	r4, .L8+32
	strh	r1, [r2]	@ movhi
	mov	r3, #1
	ldr	r2, .L8+36
	ldr	r1, .L8+40
	ldr	r0, .L8+44
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	goToStart1
.L9:
	.align	2
.L8:
	.word	DMANow
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	setupSounds
	.word	setupInterrupts
	.word	playSoundA
	.word	11025
	.word	628416
	.word	startBGM
	.size	initialize, .-initialize
	.align	2
	.global	goToStart2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart2, %function
goToStart2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L12
	mov	r2, #83886080
	ldr	r1, .L12+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2608
	mov	r2, #100663296
	ldr	r1, .L12+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L12+12
	ldr	r1, .L12+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	mov	r0, #7936
	mov	r2, #1
	ldr	r3, .L12+20
	strh	r0, [r1, #8]	@ movhi
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	bgStart2Pal
	.word	bgStart2Tiles
	.word	100726784
	.word	bgStart2Map
	.word	state
	.size	goToStart2, .-goToStart2
	.align	2
	.global	goToInst
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInst, %function
goToInst:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	mov	r3, #256
	mov	r2, #67108864
	ldr	r0, .L16
	push	{r4, lr}
	ldr	lr, .L16+4
	strh	r3, [r2]	@ movhi
	ldr	r4, .L16+8
	str	ip, [r0]
	mov	r2, #83886080
	ldr	r1, .L16+12
	mov	r0, #3
	str	ip, [lr]
	mov	lr, pc
	bx	r4
	ldr	r3, .L16+16
	mov	r2, #100663296
	ldr	r1, .L16+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L16+24
	ldr	r1, .L16+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L16+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	hOff
	.word	vOff
	.word	DMANow
	.word	bgInstPal
	.word	6224
	.word	bgInstTiles
	.word	100726784
	.word	bgInstMap
	.word	state
	.size	goToInst, .-goToInst
	.align	2
	.global	start2
	.syntax unified
	.arm
	.fpu softvfp
	.type	start2, %function
start2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L30
	ldrh	r3, [r4]
	tst	r3, #64
	beq	.L19
	ldr	r2, .L30+4
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L28
.L19:
	tst	r3, #1
	beq	.L18
	ldr	r3, .L30+4
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L29
.L18:
	pop	{r4, lr}
	bx	lr
.L29:
	pop	{r4, lr}
	b	goToInst
.L28:
	bl	goToStart1
	ldrh	r3, [r4]
	b	.L19
.L31:
	.align	2
.L30:
	.word	oldButtons
	.word	buttons
	.size	start2, .-start2
	.align	2
	.global	inst
	.syntax unified
	.arm
	.fpu softvfp
	.type	inst, %function
inst:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L37
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L37+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart1
.L38:
	.align	2
.L37:
	.word	oldButtons
	.word	buttons
	.size	inst, .-inst
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
	push	{r4, r5, r6, lr}
	mov	r2, #5632
	mov	r5, #67108864
	ldr	r3, .L41
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r4, .L41+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L41+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L41+12
	ldr	r2, .L41+16
	ldr	r1, .L41+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L41+24
	ldr	r1, .L41+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L41+32
	mov	r3, #1264
	strh	r2, [r5, #12]	@ movhi
	ldr	r1, .L41+36
	ldr	r2, .L41+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L41+44
	ldr	r1, .L41+48
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r1, .L41+52
	ldr	r3, .L41+56
	strh	r1, [r5, #10]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	unpauseSound
	.word	DMANow
	.word	bgGame2Pal
	.word	7520
	.word	100696064
	.word	bgGame2Tiles
	.word	100724736
	.word	bgGame2Map
	.word	24072
	.word	bgGameTiles
	.word	100712448
	.word	100720640
	.word	bgGameMap
	.word	23564
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start1
	.syntax unified
	.arm
	.fpu softvfp
	.type	start1, %function
start1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L62
	ldrh	r3, [r4]
	tst	r3, #1
	beq	.L44
	ldr	r2, .L62+4
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L60
.L44:
	tst	r3, #128
	beq	.L47
	ldr	r2, .L62+4
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L61
.L47:
	ldr	r2, .L62+8
	tst	r3, #64
	ldr	r3, [r2]
	beq	.L48
	ldr	r1, .L62+4
	ldrh	r1, [r1]
	tst	r1, #64
	addeq	r3, r3, #1
	streq	r3, [r2]
.L48:
	cmp	r3, #4
	movgt	r2, #1
	ldrgt	r3, .L62+12
	pop	{r4, r5, r6, lr}
	strgt	r2, [r3]
	bx	lr
.L60:
	ldr	r3, .L62+12
	ldr	r3, [r3]
	cmp	r3, #0
	ldr	r2, .L62+16
	ldreq	r1, .L62+20
	ldreq	r0, .L62+24
	ldrne	r1, .L62+28
	ldrne	r0, .L62+32
	mov	r3, #1
	ldr	r5, .L62+36
	mov	lr, pc
	bx	r5
	ldr	r3, .L62+40
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L44
.L61:
	bl	goToStart2
	ldrh	r3, [r4]
	b	.L47
.L63:
	.align	2
.L62:
	.word	oldButtons
	.word	buttons
	.word	cheatCount
	.word	cheat
	.word	11025
	.word	1630329
	.word	thriller8bit
	.word	2537280
	.word	cheatBGM
	.word	playSoundA
	.word	initGame
	.size	start1, .-start1
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
	ldr	r3, .L66
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r3, #256
	ldr	r4, .L66+4
	strh	r3, [r5]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L66+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #3328
	mov	r2, #100663296
	ldr	r1, .L66+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L66+16
	ldr	r1, .L66+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #7936
	ldr	r3, .L66+24
	strh	r2, [r5, #8]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L66+28
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L67:
	.align	2
.L66:
	.word	hideSprites
	.word	DMANow
	.word	bgPausePal
	.word	bgPauseTiles
	.word	100726784
	.word	bgPauseMap
	.word	pauseSound
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
	@ link register save eliminated.
	ldr	r3, .L78
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L69
	ldr	r2, .L78+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L77
.L69:
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L78+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToStart1
.L77:
	b	goToGame
.L79:
	.align	2
.L78:
	.word	oldButtons
	.word	buttons
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
	push	{r4, lr}
	ldr	r3, .L85
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	ldr	r1, .L85+4
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L85+8
	ldr	r4, .L85+12
	mov	lr, pc
	bx	r4
	ldr	r0, .L85+16
	ldr	r3, .L85+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L85+24
	mov	r3, #255
	ldr	r2, .L85+28
	mov	r1, #178
	mov	r0, #50
	mov	lr, pc
	bx	r4
	mov	r1, #150
	mov	r3, #255
	ldr	r2, .L85+32
	mov	r0, #80
	mov	lr, pc
	bx	r4
	ldr	r3, .L85+36
	ldr	r2, [r3]
	cmp	r2, #0
	movlt	r1, #0
	ldr	r0, .L85+40
	movlt	r2, r1
	strlt	r1, [r3]
	ldr	r1, .L85+44
	ldr	r3, .L85+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L85+52
	ldr	r3, [r3]
	cmp	r3, #0
	ldrne	r2, .L85+56
	ldreq	r2, .L85+40
	mov	r3, #255
	mov	r1, #192
	mov	r0, #80
	mov	lr, pc
	bx	r4
	mov	r3, #255
	ldr	r2, .L85+60
	mov	r1, #80
	mov	r0, #120
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L85+64
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L86:
	.align	2
.L85:
	.word	hideSprites
	.word	1028
	.word	MJWinPal
	.word	DMANow
	.word	MJWinBitmap
	.word	drawFullscreenImage4
	.word	drawString4
	.word	.LC0
	.word	.LC1
	.word	score
	.word	scoreBuffer
	.word	.LC2
	.word	sprintf
	.word	cheat
	.word	.LC3
	.word	.LC4
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
	ldr	r3, .L95
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L95+4
	ldrh	r3, [r3]
	ands	r3, r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r2, .L95+8
	ldr	r4, .L95+12
	ldr	r1, .L95+16
	ldr	r0, .L95+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	goToStart1
.L96:
	.align	2
.L95:
	.word	oldButtons
	.word	buttons
	.word	11025
	.word	playSoundA
	.word	628416
	.word	startBGM
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
	ldr	r3, .L99
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r3, #256
	ldr	r4, .L99+4
	strh	r3, [r5]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L99+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1728
	mov	r2, #100663296
	ldr	r1, .L99+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L99+16
	ldr	r1, .L99+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #7936
	mov	r2, #6
	ldr	r3, .L99+24
	strh	r1, [r5, #8]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L100:
	.align	2
.L99:
	.word	hideSprites
	.word	DMANow
	.word	bgLosePal
	.word	bgLoseTiles
	.word	100726784
	.word	bgLoseMap
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
	ldr	r3, .L112
	mov	lr, pc
	bx	r3
	ldr	r3, .L112+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L112+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L102
	ldr	r3, .L112+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L109
.L102:
	ldr	r4, .L112+16
	ldr	r3, [r4, #20]
	ldr	r2, [r4, #12]
	rsb	r3, r3, #512
	cmp	r2, r3
	bge	.L110
.L103:
	ldr	r3, [r4, #40]
	cmp	r3, #0
	bne	.L111
	pop	{r4, lr}
	bx	lr
.L111:
	ldr	r3, .L112+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L112+24
	mov	r3, #0
	ldr	r2, .L112+28
	ldr	r1, .L112+32
	ldr	r0, .L112+36
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	goToLose
.L110:
	bl	goToWin
	b	.L103
.L109:
	bl	goToPause
	b	.L102
.L113:
	.align	2
.L112:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	player
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	85248
	.word	loseBGM
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
	ldr	r3, .L128
	mov	lr, pc
	bx	r3
	ldr	r7, .L128+4
	ldr	r5, .L128+8
	ldr	fp, .L128+12
	ldr	r10, .L128+16
	ldr	r9, .L128+20
	ldr	r8, .L128+24
	ldr	r6, .L128+28
	ldr	r4, .L128+32
.L115:
	ldrh	ip, [r7]
	strh	ip, [r5]	@ movhi
	ldr	r0, [fp]
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r0, #6
	ldrls	pc, [pc, r0, asl #2]
	b	.L115
.L118:
	.word	.L117
	.word	.L119
	.word	.L120
	.word	.L121
	.word	.L122
	.word	.L123
	.word	.L123
.L123:
	mov	lr, pc
	bx	r6
	b	.L115
.L122:
	ldr	r3, .L128+36
	mov	lr, pc
	bx	r3
	b	.L115
.L121:
	mov	lr, pc
	bx	r8
	b	.L115
.L120:
	tst	ip, #8
	beq	.L115
	tst	r3, #8
	bne	.L115
	ldr	r3, .L128+40
	mov	lr, pc
	bx	r3
	b	.L115
.L119:
	mov	lr, pc
	bx	r9
	b	.L115
.L117:
	mov	lr, pc
	bx	r10
	b	.L115
.L129:
	.align	2
.L128:
	.word	initialize
	.word	buttons
	.word	oldButtons
	.word	state
	.word	start1
	.word	start2
	.word	game
	.word	win
	.word	67109120
	.word	pause
	.word	goToStart1
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
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	scoreBuffer,30,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"WIN\000"
.LC1:
	.ascii	"SCORE: \000"
.LC2:
	.ascii	"%d\000"
	.space	1
.LC3:
	.ascii	"0\000"
	.space	2
.LC4:
	.ascii	"PRESS START TO GO TO MENU\000"
	.ident	"GCC: (devkitARM release 47) 7.1.0"
