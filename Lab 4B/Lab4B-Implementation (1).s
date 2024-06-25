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

// void OffBy0(void *dst, const void *src) ;

        .global     OffBy0
        .thumb_func
        .align
OffBy0:
        .rept       1000/4
        // Needs Implementation
        LDR        R2,[R1],4           //load R1 into R2, increment 4
        STR        R2,[R0],4            //store R2 in R0, increment 4 

        .endr
        BX          LR

// void OffBy1(void *dst, const void *src) ;

        .global     OffBy1
        .thumb_func
        .align
OffBy1:
        .rept       3
        // Needs Implementation
        LDRB        R2, [R1], 1             //load R1 into R2, increment 1
        STRB        R2, [R0], 1             //store R2 in R0, increment 1
        .endr
        
        .rept       (1000/4)-1
        // Needs Implementation
        LDR         R2, [R1],4             //load R1 into R2, increment 4
        STR         R2, [R0], 4             //store R2 in R0, increment 4
        .endr
        
        // Needs Implementation
        LDRB        R2, [R1], 1             //load R1 into R2, increment 1
        STRB        R2, [R0], 1             //store R2 in R0, increment 1
        BX          LR

// void OffBy2(void *dst, const void *src) ;

        .global     OffBy2
        .thumb_func
        .align
OffBy2:

        .rept       2
        // Needs Implementation
        LDRB         R2, [R1], 1            //load R1 into R2, increment 1
        STRB         R2, [R0], 1            //store R2 in R0, increment 1
        .endr

        .rept       (1000/4)-1
        // Needs Implementation
        LDR         R2, [R1], 4            //load R1 into R2, increment 4
        STR         R2, [R0], 4            //store R2 in R0, increment 4
        .endr

        .rept       2
        // Needs Implementation
        LDRB         R2, [R1], 1            //load R1 into R2, increment 1
        STRB         R2, [R0], 1            //store R2 in R0, increment 1
        .endr

        BX          LR

// void OffBy3(void *dst, const void *src) ;

        .global     OffBy3
        .thumb_func
        .align
OffBy3:

        // Needs Implementation
        LDRB         R2, [R1],1            //load R1 into R2, increment 1
        STRB         R2, [R0],1            //store R2 in R0, increment 1
        
        .rept       (1000/4)-1
        // Needs Implementation
        LDR         R2, [R1], 4            //load R1 into R2, increment 4
        STR         R2, [R0], 4            //store R2 in R0, increment 4
        .endr
     
        .rept       3
        // Needs Implementation
        LDRB         R2, [R1], 1            //load R1 into R2, increment 1       
        STRB         R2, [R0], 1            //store R2 in R0, increment 1
        .endr
        
        BX          LR
        .end


