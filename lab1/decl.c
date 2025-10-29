#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

#define TMin INT_MIN
#define TMax INT_MAX

#include "btest.h"
#include "bits.h"

test_rec test_set[] = {

    {"signMask", (funct_t)signMask, (funct_t)test_signMask, 0, "! ~ & ^ | + << >>", 2, 1, {{TMin, TMax}, {TMin, TMax}, {TMin, TMax}}},
    {"bitXor", (funct_t)bitXor, (funct_t)test_bitXor, 2, "& ~", 8, 2, {{TMin, TMax}, {TMin, TMax}, {TMin, TMax}}},
    {"negativePart", (funct_t)negativePart, (funct_t)test_negativePart, 1, "! ~ & ^ | + << >>", 6, 3, {{TMin, TMax}, {TMin, TMax}, {TMin, TMax}}},
    {"logicalShift", (funct_t)logicalShift, (funct_t)test_logicalShift, 2, "! ~ & ^ | + << >>", 20, 4, {{TMin, TMax}, {0, 31}, {TMin, TMax}}},
    {"isLargerOrEqual", (funct_t)isLargerOrEqual, (funct_t)test_isLargerOrEqual, 2, "! ~ & ^ | + << >>", 24, 4, {{TMin, TMax}, {TMin, TMax}, {TMin, TMax}}},
    {"clearByte", (funct_t)clearByte, (funct_t)test_clearByte, 2, "! ~ & ^ | + << >>", 6, 4, {{TMin, TMax}, {0, 3}, {TMin, TMax}}},
    {"roundUp", (funct_t)roundUp, (funct_t)test_roundUp, 1, "! ~ & ^ | + << >>", 8, 4, {{TMin, TMax}, {TMin, TMax}, {TMin, TMax}}},
    {"swapNibblePairs", (funct_t)swapNibblePairs, (funct_t)test_swapNibblePairs, 1, "! ~ & ^ | + << >>", 18, 5, {{TMin, TMax}, {TMin, TMax}, {TMin, TMax}}},
    {"secondLowestZeroBit", (funct_t)secondLowestZeroBit, (funct_t)test_secondLowestZeroBit, 1, "! ~ & ^ | + << >>", 8, 5, {{TMin, TMax}, {TMin, TMax}, {TMin, TMax}}},
    {"rotateRightBits", (funct_t)rotateRightBits, (funct_t)test_rotateRightBits, 2, "! ~ & ^ | + << >>", 10, 5, {{TMin, TMax}, {0, TMax}, {TMin, TMax}}},
    {"fractions", (funct_t)fractions, (funct_t)test_fractions, 1, "! ~ & ^ | + << >>", 8, 5, {{0, 268435456}, {TMin, TMax}, {TMin, TMax}}},
    {"overflowCalc", (funct_t)overflowCalc, (funct_t)test_overflowCalc, 3, "! ~ & ^ | + << >>", 30, 7, {{TMin, TMax}, {TMin, TMax}, {TMin, TMax}}},
    {"mul5Sat", (funct_t)mul5Sat, (funct_t)test_mul5Sat, 1, "! ~ & ^ | + << >>", 30, 7, {{TMin, TMax}, {TMin, TMax}, {TMin, TMax}}},

    // float
    {"float_i2f", (funct_t)float_i2f, (funct_t)test_float_i2f, 1, "$", 40, 7, {{1, 1}, {1, 1}, {1, 1}}},
    {"float_half", (funct_t)float_half, (funct_t)test_float_half, 1, "$", 32, 7, {{1, 1}, {1, 1}, {1, 1}}},

    // honor part
    {"float_inv", (funct_t)float_inv, (funct_t)test_float_inv, 1, "$", 120, 10, {{-16777216, 16777216}, {1, 1}, {1, 1}}},
    {"oddParity", (funct_t)oddParity, (funct_t)test_oddParity, 1, "! ~ & ^ | + << >>", 56, 10, {{TMin, TMax}, {TMin, TMax}, {TMin, TMax}}},
    {"bitCount", (funct_t)bitCount, (funct_t)test_bitCount, 1, "! ~ & ^ | + << >>", 40, 10, {{TMin, TMax}, {TMin, TMax}, {TMin, TMax}}},
    {"bitReverse", (funct_t)bitReverse, (funct_t)test_bitReverse, 1, "! ~ & ^ | + << >>", 34, 10, {{1, TMax}, {TMin, TMax}, {TMin, TMax}}},

    {"", NULL, NULL, 0, "", 0, 0, {{0, 0}, {0, 0}, {0, 0}}}};
