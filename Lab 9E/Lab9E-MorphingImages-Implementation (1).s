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

// uint32_t BlendPixels(float percent, uint32_t pxl1rgb, uint32_t pxl2rgb)

    .global        BlendPixels
    .thumb_func

    .align
BlendPixels:

    // S0 = percent (0.0 to 1.0)
    // R0 = pxl1rgb
    // R1 = pxl2rgb
    // R2 = rgb
    // R3 = shift
    // R12 = temp

    VMOV            S3,1.0              // S3 = 1.0
    VSUB.F32        S3,S3,S0            // S3 = 1.0 - percent
    LDR             R2,=0xFF000000      // rgb = 0xFF000000
    LDR             R3,=0               // shift = 0
L1: CMP             R3, 16              // shift <= 16 ?
    BGT             L2                  // if not, we''re done
    AND             R12,R0,0xFF         // R12 = pxl1rgb & 0xFF
    VMOV            S1,R12
    VCVT.F32.U32    S1,S1               // convert (pxl2rgb & 0xFF) to a float in S1
    VMUL.F32        S1,S0,S1            // S1 = percent * (pxl1rgb & 0xFF)
    AND             R12,R1,0xFF         // R12 = pxl2rgb & 0xFF
    VMOV            S2,R12
    VCVT.F32.U32    S2,S2               // convert (pxl2rgb & 0xFF) to a float in S2
    VMLA.F32        S1,S3,S2            // S1 = percent * (pxl1rgb & 0xFF) + (1.0 - percent) * (pxl2rgb & 0xFF)            
    VCVT.U32.F32    S1,S1               // convert float to an unsigned int in R12
    VMOV            R12,S1
    LSL             R12,R12,R3          // R12 = byte << shift
    ORR             R2,R12,R2           // rgb |= byte << shift
    LSR             R0,R0,8             // pxl1rgb >>= 8
    LSR             R1,R1,8             // pxl2rgb >>= 8
    ADD             R3,R3,8             // shift += 8
    B               L1
L2:
    MOV             R0,R2               // return rgb
    BX              LR

    .end


