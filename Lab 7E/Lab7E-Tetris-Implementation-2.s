/*
    This code was written to support the book, "ARM Assembly for Embedded Applications",
    by Daniel W. Lewis. Permission is granted to freely share this software provided
    that this notice is not removed. This software is intended to be used with a run-time
    library adapted by the author from the STM Cube Library for the 32F429IDISCOVERY 
    board and available for download from http://www.engr.scu.edu/~dlewis/book3.
*/
        .syntax     unified
        .cpu        cortex-m4
        .text


// BOOL GetBit(uint16_t *bits, uint32_t row, uint32_t col) ;

        .global     GetBit
        .thumb_func
        .align

        .set        BITBANDING,1        // Comment out if not using bit-banding

        .ifdef      BITBANDING

GetBit: 
        // R1 = bit number = 4*row + col

        SUB         R0,R0,0x20000000           // R0 = BitBand region offset
        LSLS.N      R0,R0,5                     // Move offset into position
        ADD         R0,R0, 0x22000000           // Add base of BitBand alias
        ADD         R1, R2, R1, LSL 2           //calculate the bit number 
        LDR         R0, [R0, R1, LSL 2]         // Add offset and retrieve bit
        BX          LR

        .else

GetBit:      
        ADD         R1, R2, R1, LSL 2           // R1 = bit number = 4*row + col
        LDR         R2, [R0]                    // R2 = bit collection             
        LSR         R0, R2, R1                  // Shift bit of interest to far right
        AND         R0,R0,1                     // isolate LSB
        BX          LR

        .endif

// void PutBit(BOOL value, uint16_t *bits, uint32_t row, uint32_t col)

        .global     PutBit
        .thumb_func
        .align

        .ifdef      BITBANDING

PutBit: SUBS        R1,R1,0x20000000        // R1 = BitBand region offset
        LSLS.N      R1,R1,5                 // Move offset into position
        ADD         R1,R1, 0x22000000       // Add base of BitBand alias
        ADD         R2, R3, R2, LSL 2       // R2 = 4*row + col
        STR         R0, [R1, R2, LSL 2]     // Add offset and store bit
        BX          LR

        .else

PutBit: 
        // A BIT DIFFERENT FROM C CODE
        ADD         R2,R3, R2, LSL 2        // R2 = bit number = 4*row + col
        LDR         R3,=1
        LSL         R3, R3, R2              // R3 = bit mask
        LSL         R0, R0, R2              // R0 = new bit in position  
        LDR         R2,[R1]                 // R2 = old bits 
        BIC         R2,R2,R3                // clear bit of interest         
        ORR         R2, R2, R0              // insert new bit into bits
        STRH        R2, [R1]                // store back into bits
        
        BX          LR

        .endif

        .end
