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

// uint8_t *BitmapAddress(char ascii, uint8_t *fontTable, int charHeight, int charWidth) ;

        .global     BitmapAddress
        .thumb_func
        .align

BitmapAddress:
        // R3 <-- charWidth + 7
        // R3 <-- (charWidth + 7) / 8
        // R0 <-- ascii - ' '
        // R0 <-- (ascii - ' ')((charWidth + 7)/8)
        // R0 <-- (ascii - ' ')((charWidth + 7)/8)(charHeight)
        // R0 <-- address of character bitmap
        PUSH        {R4,R5}
        LDR         R4, = 7
        LDR         R5, = 8
        ADD         R3, R3, R4          
        UDIV        R3, R3, R5          // R3 <-- (charWidth + 7) / 8
        SUB         R0, R0, ' '         
        MUL         R0, R0, R3
        MUL         R0, R0, R2          //R0 <-- (ascii - ' ')((charWidth + 7)/8)(charHeight) 
        ADD         R0, R0, R1          //R0 <-- fontTable + R0
        POP         {R4,R5}
        BX          LR

// uint32_t GetBitmapRow(uint8_t *rowAdrs) ;

        .global     GetBitmapRow
        .thumb_func
        .align

GetBitmapRow:
        // R0 <-- *rowAdrs
        // R0 <-- ReverseBits(R0)
        LDR         R0, [R0]            //Load R0
        REV         R0,R0               //Reverse byte order
        BX          LR

// void WritePixel(int x, int y, uint8_t colorIndex, uint8_t frameBuffer[256][240]) ;

        .global     WritePixel
        .thumb_func
        .align

WritePixel:
        // R3 <-- &frameBuffer + x
        // R0 <-- 240
        // R1 <-- 240*y
        // colorIndex --> frameBuffer[240*y+x]
        PUSH        {R4,R5}
        LDR         R4, = 240
        MUL         R4, R1, R4          //y * 240
        ADD         R5, R4, R0          //R4 + x
        STRB        R2, [R3,R5]         //store color index in framebuffer and R5
        POP         {R4,R5}
        BX          LR
        .end

