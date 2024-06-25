        .syntax         unified
        .cpu            cortex-m4
        .text


// int32_t Return32Bits(void) ;
        .global         Return32Bits
        .thumb_func
        .align
Return32Bits:
	//Implementation
    LDR R0, = 10 		//load 10 in R0
    BX              LR

    
// int64_t Return64Bits(void) ;
        .global         Return64Bits
        .thumb_func
        .align
Return64Bits:
	//Implementation
    LDR R0, =-10 		//Load 10 into R0
	LDR R1, =-1 		//Load -1 into R1 
    BX              LR


// uint8_t Add8Bits(uint8_t x, uint8_t y) ;
        .global         Add8Bits
        .thumb_func
        .align
Add8Bits:
	//Implementation
    ADD R0,R0,R1	//Add x+y, then store into R0
	UXTB R0,R0		//Make R0 8-bit
    BX             LR


// uint32_t FactSum32(uint32_t x, uint32_t y) ;
        .global         FactSum32
        .thumb_func
        .align
FactSum32:
	//Implementation
    PUSH {R4, LR}    	//Preserve LR to the stack
	ADD R0, R0, R1    	//Add x+y, then store into R0
	BL Factorial	  	//Call Factorial function -> R0 = factorial(x+y)
	POP {R4, LR}     	//Pop from stack
    BX             LR


// uint32_t XPlusGCD(uint32_t x, uint32_t y, uint32_t z) ;
        .global         XPlusGCD
        .thumb_func
        .align
XPlusGCD:
	//Implementation
    PUSH {R4, LR}   	//Preserve R4 and LR to stack
	MOV R4, R0	 	//Move X value to R4
	MOV R0, R1	 	//Move Y value to R0
	MOV R1, R2	 	//Move Z value to R1
	BL gcd		 	//R0 = gcd(y, z)

	ADD R0, R0,R4    	// Add x + gcd(y,z)    
	
	POP {R4, LR}     	//pop R4 and LR from stack
    BX             LR

        .end


