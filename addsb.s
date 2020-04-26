  .text
        .globl  addsb
        .type   addsb, @function

addsb:
	movq	%rdi, %r8
	movq	%rsi, %r9
	movq   	$0x00FF00FF00FF00FF, %r10
	shr	$8,	%r8
	shr	$8,	%r9
	andq	%r10, %r8
	andq	%r10, %r9

	movq	%r8,%r11
	addq	%r9,%r11 
	movq	%r8,%r12
	xorq 	%r9,%r12
	notq 	%r12		
	movq	%r8,%r13
	movq	$0x8080808080808080,%rdx
	andq	%rdx,%r13
	movq	%r13,	%r15
	addq	%r11,%r13
	andq	%r12,%r13		
	andq	%rdx,%r13
	andq	%r13, %r15
	movq	%r13,	%r14	
	shr	$7,	%r13
	
	movq	%r13,	%rax
	movq	$127, %r13
	mulq	  %r13
	movq	%rax,%r13
	addq	%r13,  %r14
	andq 	%r15, %r13
	notq	%r14
	andq 	%r14,%r11
	addq	%r13,%r11

	movq	%r11, %rcx
	andq	%r10,%rcx
	shl	$8, %rcx


movq	%rdi, %r8
	movq	%rsi, %r9
	movq   	$0x00FF00FF00FF00FF, %r10
	andq	%r10, %r8
	andq	%r10, %r9

	movq	%r8,%r11
	addq	%r9,%r11  
	movq	%r8,%r12
	xorq 	%r9,%r12
	notq 	%r12	
	movq	%r8,%r13
	andq	%rdx,%r13
	movq	%r13,	%r15
	addq	%r11,%r13
	andq	%r12,%r13		
	andq	%rdx,%r13
	andq	%r13, %r15
	movq	%r13,	%r14	
	shr	$7,	%r13	
	movq	%r13,	%rax
	movq	$127, %r13
	mulq	  %r13
	movq	%rax,%r13
	addq	%r13,  %r14
	andq 	%r15, %r13
	notq	%r14
	andq 	%r14,%r11
	addq	%r13,%r11

	
	andq	%r10,%r11
	addq	%r11,%rcx

	movq	%rcx,%rax

        ret

        .size   addsb, .-addsb
