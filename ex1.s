@ ARM Assembly - exercise 1


	.text 	@ instruction memory

	
@ Write YOUR CODE HERE	

@ ---------------------	
@ mypow:
@ implement using loops to calculate (arg1 ^ arg2)
mypow:
sub sp,sp,#12
str r9,[sp,#8]
str r8,[sp,#4]
str r7,[sp,#0]
mov r7,r0
mov r8,r1
mov r9,#0
loop:cmp r8,#1
beq exitloop
mul r9,r7,r0
mov r7,r9
sub r8,r8,#1
b loop
exitloop:
mov r0,r7
ldr r7,[sp,#0]
ldr r8,[sp,#4]
ldr r9,[sp,#8]
add sp,sp,#12
mov pc,lr






@ ---------------------	

	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #8 	@the value x
	mov r5, #3 	@the value n
	

	@ calling the mypow function
	mov r0, r4 	@the arg1 load
	mov r1, r5 	@the arg2 load
	bl mypow
	mov r6,r0
	

	@ load aguments and print
	ldr r0, =format
	mov r1, r4
	mov r2, r5
	mov r3, r6
	bl printf

	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	.data	@ data memory
format: .asciz "%d^%d is %d\n"

