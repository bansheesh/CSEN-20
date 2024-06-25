/*
    This code was written to support the book, "ARM Assembly for Embedded Applications",
    by Daniel W. Lewis. Permission is granted to freely share this software provided
    that this notice is not removed. This software is intended to be used with a run-time
    library adapted by the author from the STM Cube Library for the 32F429IDISCOVERY 
    board and available for download from http://www.engr.scu.edu/~dlewis/book3.
*/
        .syntax         unified
        .cpu            cortex-m4
        .text

// int Between(int min, int value, int max) ;

        .global         Between
        .thumb_func

        .align
Between:    // R0 = min, R1 = val, R2 = max
        	// R2 = max - min
        	// R1 = val - min
        	// (val - min) <= (max - min)?
        
        SUB         R2, R2, R0
        SUB         R1, R1, R0   
        CMP         R1,R2
        ITE         LS          
        LDRLS       R0,= 1      //if R1<=R2 return 1
        LDRHI       R0,= 0      // if R1>R2 return 0
        BX          LR

// int Count(int cells[], int numb, int value) ;

        .global        Count
        .thumb_func

        .align
Count:              // R0 = cells, R1 = numb, R2 = value
        	 		// count (R3) <-- 0
            
                 
            LDR         R3,=0
            ADD         R1, R0, R1, LSL 2       // R1 <-- &cells[numb]
Loop:
            // Yes: return
        	
        	// if (cells[numb] == value) count++

       	    CMP         R1, R0
            BEQ         Done                //if R1 = 0 end go to Done else increment R12
            LDR         R12, [R0], 4        // R12 = *cells++
            CMP         R2, R12             //compare R12, R2 
            IT          EQ
            ADDEQ       R3, R3, 1           //if equal add 1 to count                         
            B           Loop
Done:
            MOV         R0, R3              //Move Count to R0 and Return
        	BX          LR

        .end

