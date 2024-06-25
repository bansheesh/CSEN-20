
#include <stdint.h>

static char* Magnitude2String(uint8_t magnitude, char* string, unsigned radix) {
    static const char digits[] = "0123456789ABCDEF";
    if (magnitude >= radix)
        string = Magnitude2String(magnitude / radix, string, radix);
    *string++ = digits[magnitude % radix];
    *string = '\0';
    return string;
}
/*
static void Magnitude2String(uint8_t magnitude, char* string, unsigned radix) {
    static const char table "0123456789ABCDEF";
    int digits[3], index, k;
    
    for (k = 2; k >= 0; k--) {
        digits[k] = magnitude % radix;
        magnitude /= radix;
    }

    index = 0;
    for (k = 0; k < 3; k++) {
        if (digits[k] != 0 || index > 0 || k == 2) {
            int digit = digits[k];
            string[index++] = table[digit];

        }
    }
    string[index] = '\0';
}
*/

//radix 8
void Bits2OctalString(uint8_t bits, char string[])
    {
    Magnitude2String(bits, string, 8);
    }

//radix 10
void Bits2UnsignedString(uint8_t bits, char string[])
    {
    Magnitude2String(bits, string, 10);
    }

//radix 16
void Bits2HexString(uint8_t bits, char string[])
    {
    Magnitude2String(bits, string, 16);
    }


void Bits2TwosCompString(uint8_t bits, char string[])
    {
    if (bits & 0x80) {
        bits = ~bits + 1; //invert and add 1
        char sign = '-';
        string[0] = sign;
        Bits2UnsignedString(bits, &string[1]);
    }
    else {
        char plussign = '+';
        string[0] = plussign;
        Bits2UnsignedString(bits, &string[1]);
    }
    

    }

void Bits2SignMagString(uint8_t bits, char string[])
    {
    char sign = (bits & (1 << 7)) != 0 ? '-' : '+';
    bits = bits & ~(1 << 7);
    string[0] = sign;
    Bits2UnsignedString(bits, &string[1]);
    }


//Alternative: create magnitude to string conversion function
//and use it in Bits2OctalString, Bits2UnsignedString and Bits2HexString