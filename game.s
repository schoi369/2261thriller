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
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r2, #0
	mov	r1, #10
	mov	r8, #100
	mov	r7, #196
	mov	r6, #16
	mov	r5, #32
	mov	r4, #8
	mov	lr, #3
	mov	r0, #1
	mov	ip, #5
	ldr	r3, .L4
	str	r8, [r3]
	str	r7, [r3, #8]
	str	r6, [r3, #20]
	str	r5, [r3, #24]
	str	r4, [r3, #60]
	str	lr, [r3, #64]
	str	ip, [r3, #48]
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	r1, [r3, #68]
	str	r0, [r3, #16]
	str	r0, [r3, #36]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #40]
	str	r2, [r3, #44]
	str	r2, [r3, #56]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.size	initPlayer, .-initPlayer
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
	ldr	r2, .L50
	ldr	r3, [r2, #48]
	cmp	r3, #5
	movne	r1, #5
	push	{r4, r5, lr}
	strne	r3, [r2, #52]
	strne	r1, [r2, #48]
	ldr	r3, .L50+4
	ldr	r1, [r2, #44]
	smull	r4, r5, r1, r3
	asr	r3, r1, #31
	rsb	r3, r3, r5, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r1, r3, lsl #1
	bne	.L9
	add	r1, r2, #52
	ldm	r1, {r1, r3}
	add	r3, r3, #1
	cmp	r1, #1
	str	r3, [r2, #56]
	bls	.L46
	cmp	r1, #4
	beq	.L47
	ldr	r1, [r2, #64]
	cmp	r3, r1
	beq	.L13
.L9:
	ldr	r1, .L50+8
	ldrh	r3, [r1, #48]
	ldr	r0, .L50+12
	tst	r3, #32
	ldr	ip, [r2, #12]
	ldr	r3, [r0]
	bne	.L14
	ldr	lr, [r2, #28]
	cmp	lr, #0
	bne	.L15
	ldr	lr, [r2, #32]
	cmp	lr, #0
	bne	.L15
	cmp	ip, #0
	ble	.L17
	ldr	r4, [r2, #16]
	ldr	r1, [r2, #20]
	sub	ip, ip, r4
	add	r1, r1, r1, lsr #31
	add	r1, ip, r1, asr #1
	ldr	r5, .L50+16
	sub	r1, r1, #121
	cmp	r1, r5
	subls	r3, r3, r4
	str	lr, [r2, #36]
	str	ip, [r2, #12]
	strls	r3, [r0]
.L17:
	mov	r1, #1
	ldr	lr, .L50+8
	ldrh	lr, [lr, #48]
	tst	lr, #16
	str	r1, [r2, #48]
	beq	.L18
.L19:
	ldr	r1, .L50+8
	ldrh	r1, [r1, #48]
	tst	r1, #2
	sub	r3, ip, r3
	moveq	r1, #1
	str	r3, [r2, #4]
	movne	r3, #0
	moveq	r3, #4
	mov	lr, #0
	streq	r1, [r2, #28]
	ldr	r1, .L50+20
	strne	r3, [r2, #28]
	streq	r3, [r2, #48]
	ldr	r3, .L50+24
	ldr	r5, [r1]
	ldr	r4, [r2, #40]
	add	r0, r3, #300
.L22:
	ldr	r1, [r3, #32]
	cmp	r1, #1
	beq	.L48
.L24:
	add	r3, r3, #60
	cmp	r3, r0
	bne	.L22
	ldr	r3, .L50+8
	ldrh	r3, [r3, #48]
	cmp	lr, #0
	strne	r4, [r2, #40]
	ands	r3, r3, #1
	bne	.L28
	mov	r1, #1
	ldr	r0, [r2, #36]
	cmp	r0, r1
	str	r3, [r2, #56]
	moveq	r3, #2
	movne	r3, #3
	str	r1, [r2, #32]
	str	r3, [r2, #48]
.L30:
	ldr	r3, [r2, #44]
	add	r3, r3, #1
	str	r3, [r2, #44]
	pop	{r4, r5, lr}
	bx	lr
.L14:
	ldrh	r1, [r1, #48]
	tst	r1, #16
	bne	.L19
	ldr	r1, [r2, #28]
	cmp	r1, #0
	bne	.L19
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L19
.L18:
	ldr	r1, [r2, #20]
	add	lr, r1, ip
	cmp	lr, #512
	bge	.L20
	mov	r4, #1
	ldr	lr, [r2, #16]
	add	r1, r1, r1, lsr #31
	add	ip, ip, lr
	add	r1, ip, r1, asr r4
	ldr	r5, .L50+16
	sub	r1, r1, #121
	cmp	r1, r5
	addls	r3, r3, lr
	str	ip, [r2, #12]
	str	r4, [r2, #36]
	strls	r3, [r0]
.L20:
	mov	r1, #0
	str	r1, [r2, #48]
	b	.L19
.L48:
	ldr	r1, [r3, #28]
	cmp	r1, #1
	beq	.L49
	cmp	r1, #0
	bne	.L24
	ldr	r1, [r3, #12]
	sub	r1, r1, ip
	cmp	r1, #7
	bgt	.L24
	cmp	r5, #0
	moveq	r4, #1
	moveq	lr, r4
	b	.L24
.L49:
	ldr	r1, [r3, #12]
	sub	r1, ip, r1
	cmp	r1, #7
	bgt	.L24
	cmp	r5, #0
	moveq	r4, #1
	moveq	lr, r4
	b	.L24
.L28:
	mov	r3, #0
	ldr	r1, [r2, #48]
	cmp	r1, #5
	str	r3, [r2, #32]
	streq	r3, [r2, #56]
	bne	.L30
	pop	{r4, r5, lr}
	bx	lr
.L15:
	ldrh	r1, [r1, #48]
	b	.L19
.L46:
	ldr	r1, [r2, #60]
	cmp	r3, r1
	bne	.L9
.L13:
	mov	r3, #0
	str	r3, [r2, #56]
	b	.L9
.L47:
	ldr	r1, [r2, #68]
	cmp	r3, r1
	bne	.L9
	b	.L13
.L51:
	.align	2
.L50:
	.word	player
	.word	1717986919
	.word	67109120
	.word	hOff
	.word	270
	.word	cheat
	.word	zombies
	.size	updatePlayer, .-updatePlayer
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
	ldr	r1, .L54
	ldr	r3, [r1, #4]
	str	lr, [sp, #-4]!
	ldr	r2, [r1, #56]
	ldr	lr, [r1, #48]
	ldrb	r0, [r1]	@ zero_extendqisi2
	ldr	ip, .L54+4
	lsl	r3, r3, #23
	ldr	r1, .L54+8
	add	r2, r2, lr, lsl #6
	lsr	r3, r3, #23
	orr	r3, r3, ip
	orr	r0, r0, ip
	lsl	r2, r2, #1
	strh	r3, [r1, #2]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L55:
	.align	2
.L54:
	.word	player
	.word	-32768
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initZombies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initZombies, %function
initZombies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #120
	mov	r6, #100
	mov	r5, #196
	mov	r0, #1
	mov	r4, #16
	mov	lr, #32
	mov	r2, #0
	mov	ip, #10
	ldr	r3, .L60
.L57:
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	add	r1, r1, #80
	cmp	r1, #520
	str	r6, [r3]
	str	r5, [r3, #8]
	str	r0, [r3, #16]
	str	r4, [r3, #20]
	str	lr, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r2, [r3, #44]
	str	r2, [r3, #52]
	str	r2, [r3, #48]
	str	ip, [r3, #56]
	add	r3, r3, #60
	bne	.L57
	pop	{r4, r5, r6, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	zombies
	.size	initZombies, .-initZombies
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
	mov	r3, #0
	mov	r2, #96
	push	{r4, lr}
	mov	lr, #67108864
	ldr	r1, .L64
	ldr	r0, .L64+4
	str	r3, [r1]
	str	r2, [r0]
	ldr	ip, .L64+8
	ldr	r1, .L64+12
	ldr	r0, .L64+16
	strh	r2, [lr, #22]	@ movhi
	str	r3, [ip]
	str	r0, [r1]
	bl	initPlayer
	pop	{r4, lr}
	b	initZombies
.L65:
	.align	2
.L64:
	.word	hOff
	.word	vOff
	.word	kills
	.word	score
	.word	100000
	.size	initGame, .-initGame
	.align	2
	.global	updateZombie
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateZombie, %function
updateZombie:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #48]
	ldr	r3, .L123
	push	{r4, r5, r6, r7, r8, lr}
	smull	r4, r5, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r5, asr #2
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl #1
	bne	.L68
	add	r1, r0, #52
	ldm	r1, {r1, ip}
	add	r1, r1, #1
	cmp	r1, ip
	str	r1, [r0, #52]
	streq	r3, [r0, #52]
.L68:
	ldr	lr, [r0, #36]
	add	r2, r2, #1
	cmp	lr, #0
	str	r2, [r0, #48]
	bne	.L115
	ldr	ip, .L123+4
	ldr	r3, [ip, #36]
	cmp	r3, #1
	beq	.L118
.L83:
	cmp	r3, #0
	bne	.L66
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bne	.L66
	ldr	r1, [ip, #12]
	ldr	r2, [r0, #12]
	ldr	r3, [r0, #20]
	sub	ip, r1, r2
	add	r3, r3, #14
	cmp	r3, ip
	cmpge	r1, r2
	bgt	.L85
.L66:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L115:
	ldr	r1, [r0, #28]
	cmp	r1, #0
	ldr	r6, [r0, #12]
	bne	.L71
	ldr	ip, .L123+4
	ldr	r3, [ip, #12]
	cmp	r3, r6
	blt	.L119
.L72:
	mov	r7, #0
	ldr	r3, [r0, #40]
	ldr	r2, .L123+8
	smull	r4, r5, r3, r2
	sub	r2, r5, r3, asr #31
	add	r2, r2, r2, lsl #1
	cmp	r3, r2
	str	r7, [r0, #32]
	beq	.L86
.L88:
	tst	r3, #1
	bne	.L75
	ldr	r2, [r0, #32]
	cmp	r2, #1
	beq	.L74
.L75:
	ldr	r2, .L123+12
	add	r3, r3, #1
	ldr	r2, [r2]
	str	r3, [r0, #40]
	ldr	r3, [ip, #36]
	sub	r2, r6, r2
	cmp	r3, #1
	str	r2, [r0, #4]
	bne	.L83
.L118:
	ldr	r3, [r0, #28]
	cmp	r3, #1
	bne	.L66
	ldr	r1, [r0, #12]
	ldr	r2, [ip, #12]
	ldr	r3, [ip, #20]
	sub	ip, r1, r2
	add	r3, r3, #14
	cmp	r3, ip
	cmpge	r1, r2
	ble	.L66
.L85:
	ldr	r3, .L123+16
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L66
	sub	r3, lr, #1
	rsbs	lr, r3, #0
	adc	lr, lr, r3
	ldr	r3, .L123+20
	ldrh	r3, [r3]
	bics	r3, lr, r3
	beq	.L66
	mov	r4, r0
	mov	r3, #0
	ldr	r2, .L123+24
	ldr	r1, .L123+28
	ldr	r0, .L123+32
	ldr	r5, .L123+36
	mov	lr, pc
	bx	r5
	mov	ip, #0
	ldr	r0, .L123+40
	ldr	r1, .L123+44
	ldr	r3, [r0]
	ldr	r2, [r1]
	sub	r3, r3, #4992
	sub	r3, r3, #8
	add	r2, r2, #1
	str	r3, [r0]
	str	r2, [r1]
	str	ip, [r4, #36]
	b	.L66
.L71:
	cmp	r1, #1
	bne	.L76
	ldr	ip, .L123+4
	ldr	r3, [ip, #12]
	cmp	r3, r6
	ble	.L77
	sub	r3, r3, r6
	cmp	r3, #79
	ble	.L78
.L77:
	mov	r7, #0
	ldr	r3, [r0, #40]
	ldr	r2, .L123+8
	smull	r4, r5, r3, r2
	sub	r2, r5, r3, asr #31
	add	r2, r2, r2, lsl #1
	cmp	r3, r2
	str	r7, [r0, #32]
	bne	.L88
.L89:
	ldr	r2, [r0, #44]
	ldr	r1, [r0, #16]
	add	r2, r2, #1
	add	r6, r6, r1
	cmp	r2, #50
	str	r2, [r0, #44]
	str	r6, [r0, #12]
	moveq	r2, #0
	streq	r2, [r0, #28]
	streq	r2, [r0, #44]
	b	.L75
.L119:
	sub	r3, r6, r3
	cmp	r3, #79
	bgt	.L72
.L78:
	ldr	r3, [ip, #28]
	cmp	r3, #0
	beq	.L120
	mov	r7, #0
	ldr	r3, [r0, #40]
	ldr	r2, .L123+8
	smull	r4, r5, r3, r2
	sub	r2, r5, r3, asr #31
	add	r2, r2, r2, lsl #1
	cmp	r3, r2
	str	r7, [r0, #32]
	movne	r2, r6
	beq	.L121
.L80:
	mov	r6, r2
	b	.L75
.L76:
	mov	ip, #0
	ldr	r3, [r0, #40]
	ldr	r2, .L123+8
	smull	r4, r5, r3, r2
	sub	r2, r5, r3, asr #31
	add	r2, r2, r2, lsl #1
	cmp	r3, r2
	str	ip, [r0, #32]
	ldr	ip, .L123+4
	bne	.L88
	b	.L75
.L120:
	mov	r2, #1
	ldr	r3, [r0, #40]
	tst	r3, #1
	str	r2, [r0, #32]
	bne	.L75
.L74:
	cmp	r1, #1
	beq	.L122
	cmp	r1, #0
	ldreq	r2, [r0, #16]
	subeq	r6, r6, r2
	streq	r6, [r0, #12]
	b	.L75
.L86:
	ldr	r1, [r0, #44]
	ldr	r2, [r0, #16]
	add	r1, r1, #1
	sub	r2, r6, r2
	cmp	r1, #50
	str	r1, [r0, #44]
	str	r2, [r0, #12]
	bne	.L80
	mov	r2, #1
	str	r6, [r0, #12]
	str	r2, [r0, #28]
	str	r2, [r0, #44]
	b	.L75
.L121:
	cmp	r1, #0
	beq	.L86
	cmp	r1, #1
	bne	.L75
	b	.L89
.L122:
	ldr	r2, [r0, #16]
	add	r6, r6, r2
	str	r6, [r0, #12]
	b	.L75
.L124:
	.align	2
.L123:
	.word	1717986919
	.word	player
	.word	1431655766
	.word	hOff
	.word	oldButtons
	.word	buttons
	.word	11025
	.word	7805
	.word	zombiedeath
	.word	playSoundB
	.word	score
	.word	kills
	.size	updateZombie, .-updateZombie
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
	push	{r4, lr}
	ldr	r4, .L127
	bl	updatePlayer
	mov	r0, r4
	bl	updateZombie
	add	r0, r4, #60
	bl	updateZombie
	add	r0, r4, #120
	bl	updateZombie
	add	r0, r4, #180
	bl	updateZombie
	add	r0, r4, #240
	bl	updateZombie
	ldr	r2, .L127+4
	ldr	r3, [r2]
	sub	r3, r3, #10
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L128:
	.align	2
.L127:
	.word	zombies
	.word	score
	.size	updateGame, .-updateGame
	.align	2
	.global	drawZombies
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawZombies, %function
drawZombies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L137
	push	{r4, r5, r6, lr}
	ldr	r1, .L137+4
	ldr	ip, .L137+8
	ldr	r4, .L137+12
	ldr	r5, .L137+16
	add	lr, r3, #300
.L133:
	ldr	r2, [r3, #4]
	ldrb	r0, [r3]	@ zero_extendqisi2
	ldr	r6, [r3, #36]
	and	r2, r2, r4
	orr	r2, r2, ip
	orr	r0, r0, ip
	cmp	r6, #0
	strh	r2, [r1, #10]	@ movhi
	strh	r0, [r1, #8]	@ movhi
	strheq	r5, [r1, #12]	@ movhi
	beq	.L132
	ldr	r2, [r3, #32]
	cmp	r2, #0
	ldr	r2, [r3, #52]
	add	r0, r2, #384
	lsl	r0, r0, #1
	add	r2, r2, #448
	lsl	r2, r2, #1
	strheq	r0, [r1, #12]	@ movhi
	strhne	r2, [r1, #12]	@ movhi
.L132:
	add	r3, r3, #60
	cmp	r3, lr
	add	r1, r1, #8
	bne	.L133
	pop	{r4, r5, r6, lr}
	bx	lr
.L138:
	.align	2
.L137:
	.word	zombies
	.word	shadowOAM
	.word	-32768
	.word	511
	.word	790
	.size	drawZombies, .-drawZombies
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
	ldr	r1, .L141
	ldr	r3, [r1, #4]
	ldr	ip, [r1, #48]
	ldr	r2, [r1, #56]
	ldr	r0, .L141+4
	ldrb	r1, [r1]	@ zero_extendqisi2
	lsl	r3, r3, #23
	push	{r4, lr}
	add	r2, r2, ip, lsl #6
	ldr	r4, .L141+8
	lsr	r3, r3, #23
	orr	r3, r3, r0
	orr	r1, r1, r0
	lsl	r2, r2, #1
	strh	r3, [r4, #2]	@ movhi
	strh	r1, [r4]	@ movhi
	strh	r2, [r4, #4]	@ movhi
	bl	drawZombies
	mov	ip, #10
	mov	r0, #40
	mov	r1, #18
	ldr	r3, .L141+12
	ldr	r3, [r3]
	ldr	r2, .L141+16
	lsl	r3, r3, #5
	add	r3, r3, #17
	strh	r1, [r4, #68]	@ movhi
	strh	ip, [r4, #56]	@ movhi
	strh	r0, [r4, #58]	@ movhi
	strh	r3, [r4, #60]	@ movhi
	strh	r2, [r4, #64]	@ movhi
	strh	r2, [r4, #66]	@ movhi
	ldr	r1, .L141+20
	mov	lr, pc
	bx	r1
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r4, .L141+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	ldr	r3, .L141+28
	ldr	r2, [r3]
	add	r3, r2, r2, lsr #31
	asr	r3, r3, #1
	lsl	r3, r3, #16
	lsl	r2, r2, #16
	lsr	r3, r3, #16
	lsr	r2, r2, #16
	strh	r2, [r1, #20]	@ movhi
	pop	{r4, lr}
	strh	r3, [r1, #24]	@ movhi
	bx	lr
.L142:
	.align	2
.L141:
	.word	player
	.word	-32768
	.word	shadowOAM
	.word	kills
	.word	16394
	.word	waitForVBlank
	.word	DMANow
	.word	hOff
	.size	drawGame, .-drawGame
	.comm	score,4,4
	.comm	zombieTimeCount,4,4
	.comm	steps,4,4
	.comm	cheat,4,4
	.comm	cheatCount,4,4
	.comm	kills,4,4
	.comm	zombies,300,4
	.comm	player,72,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
