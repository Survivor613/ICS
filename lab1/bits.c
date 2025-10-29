/* 
 * CS:APP Data Lab 
 * 
 * <Please put your name and userid here>
 * 
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, although you might get a compiler warning. In general,
 * it's not good practice to ignore compiler warnings, but in this
 * case it's OK.  
 */

#if 0
/*
 * Instructions to Students:
 *
 * STEP 1: Read the following instructions carefully.
 */

You will provide your solution to the Data Lab by
editing the collection of functions in this source file.

INTEGER CODING RULES:

  Replace the "return" statement in each function with one
  or more lines of C code that implements the function. Your code 
  must conform to the following style:
 
  int Funct(arg1, arg2, ...) {
      /* brief description of how your implementation works */
      int var1 = Expr1;
      ...
      int varM = ExprM;

      varJ = ExprJ;
      ...
      varN = ExprN;
      return ExprR;
  }

  Each "Expr" is an expression using ONLY the following:
  1. Integer constants 0 through 255 (0xFF), inclusive. You are
      not allowed to use big constants such as 0xffffffff.
  2. Function arguments and local variables (no global variables).
  3. Unary integer operations ! ~
  4. Binary integer operations & ^ | + << >>
    
  Some of the problems restrict the set of allowed operators even further.
  Each "Expr" may consist of multiple operators. You are not restricted to
  one operator per line.

  You are expressly forbidden to:
  1. Use any control constructs such as if, do, while, for, switch, etc.
  2. Define or use any macros.
  3. Define any additional functions in this file.
  4. Call any functions.
  5. Use any other operations, such as &&, ||, -, or ?:
  6. Use any form of casting.
  7. Use any data type other than int.  This implies that you
     cannot use arrays, structs, or unions.

 
  You may assume that your machine:
  1. Uses 2s complement, 32-bit representations of integers.
  2. Performs right shifts arithmetically.
  3. Has unpredictable behavior when shifting if the shift amount
     is less than 0 or greater than 31.


EXAMPLES OF ACCEPTABLE CODING STYLE:
  /*
   * pow2plus1 - returns 2^x + 1, where 0 <= x <= 31
   */
  int pow2plus1(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     return (1 << x) + 1;
  }

  /*
   * pow2plus4 - returns 2^x + 4, where 0 <= x <= 31
   */
  int pow2plus4(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     int result = (1 << x);
     result += 4;
     return result;
  }

FLOATING POINT CODING RULES

For the problems that require you to implement floating-point operations,
the coding rules are less strict.  You are allowed to use looping and
conditional control.  You are allowed to use both ints and unsigneds.
You can use arbitrary integer and unsigned constants. You can use any arithmetic,
logical, or comparison operations on int or unsigned data.

You are expressly forbidden to:
  1. Define or use any macros.
  2. Define any additional functions in this file.
  3. Call any functions.
  4. Use any form of casting.
  5. Use any data type other than int or unsigned.  This means that you
     cannot use arrays, structs, or unions.
  6. Use any floating point data types, operations, or constants.


NOTES:
  1. Use the dlc (data lab checker) compiler (described in the handout) to 
     check the legality of your solutions.
  2. Each function has a maximum number of operations (integer, logical,
     or comparison) that you are allowed to use for your implementation
     of the function.  The max operator count is checked by dlc.
     Note that assignment ('=') is not counted; you may use as many of
     these as you want without penalty.
  3. Use the btest test harness to check your functions for correctness.
  4. Use the BDD checker to formally verify your functions
  5. The maximum number of ops for each function is given in the
     header comment for each function. If there are any inconsistencies 
     between the maximum ops in the writeup and in this file, consider
     this file the authoritative source.

/*
 * STEP 2: Modify the following functions according the coding rules.
 * 
 *   IMPORTANT. TO AVOID GRADING SURPRISES:
 *   1. Use the dlc compiler to check that your solutions conform
 *      to the coding rules.
 *   2. Use the BDD checker to formally verify that your solutions produce 
 *      the correct answers.
 */


#endif
#include "bits.h"

// P1
/* 
 * signMask - return a mask with only the most significant bit set (0x80000000)
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 2
 *   Rating: 1
 */
int signMask(void) {
  return 1 << 31;
}

// P2
/* 
 * bitXor - x^y using only ~ and & 
 *   Example: bitXor(4, 5) = 1, bitXor(7, 7) = 0
 *   Legal ops: ~ &
 *   Max ops: 8
 *   Rating: 2
 */
int bitXor(int x, int y) {
	return ~(~(~x & y) & ~(x & ~y));
}

// P3
/*
 * negativePart - return -x if x < 0, otherwise return 0
 *   Examples: negativePart(-10) = 10, negativePart(5) = 0
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 6
 *   Rating: 3
 */
int negativePart(int x){
  return (~x + 1) & (x >> 31);
}


// P4
/*
 * clearByte - return x with the nth byte cleared to 0
 *   You can assume 0 <= n <= 3
 *   Example: clearByte(0x01020304, 2) = 0x01000304
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 6
 *   Rating: 4
 */
int clearByte(int x,int n) {
  return (x & ~(255 << (n << 3)));
}

// P5
/* 
 * roundUp - round up x to the nearest multiple of 256 that is bigger than x
 *   Example: roundUp(0x117f) = 0x1200
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 8
 *   Rating: 4
 */
int roundUp(int x) {
  return ((x >> 8) + !!(x & 0x000000FF)) << 8;
}

// P6
/* 
 * isLargerOrEqual - return 1 if x >= y, else return 0 
 *   Example: isLargerOrEqual(5,4) = 1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 4
 */
int isLargerOrEqual(int x, int y) {
  return !!((~((x >> 31) ^ (y >> 31)) & !((x + ~y + 1) >> 31)) | (((x >> 31) ^ (y >> 31)) & ~(x >> 31))); // 巧妙之处：如果y是最小负数0x80000000，如果x异号没问题，如果x同号，x-y符号位1+1=0也表现出等价于x>y
}

// P7
/* 
 * logicalShift - shift x to the right by n bits, using a logical shift
 *   Can assume that 0 <= n <= 31
 *   Examples: logicalShift(0x87654321,4) = 0x08765432
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 4
 */
int logicalShift(int x, int n) {
  return ((x >> n) & ~(((1 << 31) >> n) << 1));  // << 1 是点睛之笔
}

// P8
/*
 * swapNibblePairs - swap the low and high 4 bits within each byte of x
 *   Examples: swapNibblePairs(0xAB) = 0xBA
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 5
 */
int swapNibblePairs(int x) {
  int low = x & ((0x0F << 24) + (0x0F << 16) + (0x0F << 8) + 0x0F);
  int high = x & ((0xF0 << 24) + (0xF0 << 16) + (0xF0 << 8) + 0xF0);
  return ((low << 4) + ((high >> 4) & ~((1 << 31) >> 3)));
}

// int swapNibblePairs(int x) {                            // 帮助大宝教主debug
//   int four_bits = 0xF;  // 00001111
//   int low_mask = (four_bits << 24) | (four_bits << 16) | (four_bits << 8) | four_bits;
//   int high_mask = low_mask << 4;
//   int low_bits = x & low_mask;
//   int high_bits = x & high_mask;
//   int clear_mask = ~(0xF0 << 24);
//   low_bits = low_bits << 4;
//   high_bits = high_bits >> 4;
//   high_bits = high_bits & clear_mask;
//   return low_bits | high_bits;
// }


// P9

//  * secondLowestZeroBit - return a mask that marks the position of the second least significant 0 bit
//  *   Examples: secondLowestZeroBit(0xFFFFFFFA) = 0x4, secondLowestZeroBit(0x7FFFFFFF) = 0
//  *             secondLowestZeroBit(-1) = 0
//  *   Legal ops: ! ~ & ^ | + << >>
//  *   Max ops: 8
//  *   Rating: 5
//  */
int secondLowestZeroBit(int x) {    // 最低的0： ~x & (x + 1)
  int first_zero_mask = ~x & (x + 1);
  int padded_num = x | first_zero_mask;
  int second_zero_mask = ~padded_num & (padded_num + 1);
  return second_zero_mask;
}

// P10
/* 
 * rotateRightBits - rotate x to right by n bits
 *   you can assume n >= 0
 *   Examples: rotateRightBits(0x12345678, 8) = 0x78123456
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 16
 *   Rating: 5
 */
int rotateRightBits(int x, int n) {    
  // ~(1 << 31 >> n << 1)是不好的，n=0时候会导致未定义行为, ((1 << (32 + ~n + 1)) + ~0)则是个更好的mask
  // 纠正：((1 << (32 + ~n + 1)) + ~0)不如原来的mask好,原来的mask不会导致n=0时的未定义行为
  int higher_bits_shifted = (x >> n) & ~(1 << 31 >> n << 1);
  int lower_bits = x & ((1 << n) + ~0);
  int lower_bits_shifted = lower_bits << (32 + ~n + 1);
  return lower_bits_shifted | higher_bits_shifted;
}

// P11
/* 
 * fractions - return floor((x*5 + 8)/16) for 0 <= x <= (1 << 28), x is an integer 
 *   Example: fractions(20) = 6
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 8
 *   Rating: 5
 */
int fractions(int x) {
  return (x + (x << 2) + 8) >> 4;
}


// P12
/* 
 * overflowCalc - given binary representations of three 32-bit positive numbers and add them together, 
 *      return the binary representation of the part where bits are higher than 32.
 *   Examples: overflowCalc(0xffffffff, 0xffffffff, 0xffffffff) = 2
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 30
 *   Rating: 7 
 */
int overflowCalc(int x, int y, int z) {
  int sum_xy = x + y;
  int carry_xy = (x & y) | ((x | y) & ~sum_xy);
  int carry_xy_top = (carry_xy >> 31) & 1;
  int sum_xyz = sum_xy + z;
  int carry_xyz = (z & sum_xy) | ((z | sum_xy) & ~sum_xyz);
  int carry_xyz_top = (carry_xyz >> 31) & 1;
  return carry_xy_top + carry_xyz_top;
}

// P13
/* 
 * mul5Sat - return x*5, and if x*5 overflow, change the result to 
 * INT_MAX(0x7fffffff) or INT_MIN(0x80000000) correspondingly
 *   Examples: mul5Sat(1) = 0x5, mul5Sat(0x40000000) = 0x7fffffff
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 36
 *   Rating: 7
 */
int mul5Sat(int x) {
  int sign_x = (x >> 31);
  int mul1 = x << 1;
  int mul2 = mul1 << 1;
  int mul_final = mul2 + x;
  int shift_over = (sign_x ^ (mul1 >> 31)) | (sign_x ^ (mul2 >> 31));
  int add_over = (~sign_x & ~(mul2 >> 31) & (mul_final >> 31)) | (sign_x & (mul2 >> 31) & ~(mul_final >> 31));
  int overflow = shift_over | add_over;
  int up_overflow = ~sign_x & overflow; // 总上溢出
  int down_overflow = sign_x & overflow; // 总下溢出
  int no_overflow = ~overflow;
  int INT_MAX = ~(1 << 31);
  int INT_MIN = 1 << 31;
  return (up_overflow & INT_MAX) | (down_overflow & INT_MIN) | (no_overflow & mul_final);
}

// P14
/* 
 * float_half - Return bit-level equivalent of expression f/2 for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representation of
 *   single-precision floating point values.
 *   When argument is NaN, return argument
 *   Legal ops: Any integer / unsigned operations incl. ||, &&. also if, while
 *   Max ops: 32
 *   Rating: 7
 */
unsigned float_half(unsigned f) {
  int sign = f & (1 << 31);
  int exp = (f >> 23) & 0xFF;
  int frac = f & ~((1 << 31) >> 8);
  if (exp == 0xFF) 
    return f;
  else if (!exp)
  {
    int add = (frac & 3) == 3;
    frac = (frac >> 1) + add;
    return sign | exp << 23 | frac;
  }
  else if (exp==1)
  {
    int add = (frac & 3) == 3;
    frac = frac | (1 << 23);
    frac = (frac >> 1) + add;
    return sign | frac;  // exp = 0
  }
  else
  {
    exp -= 1;
    return sign | exp << 23 | frac;
  }
}

// P15
/* 
 * float_i2f - Return bit-level equivalent of expression (float) x.
 *   Result is returned as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point values.
 *   Legal ops: Any integer / unsigned operations incl. ||, &&. also if, while
 *   Max ops: 40
 *   Rating: 7
 */
unsigned float_i2f(int x) {
  if (!x)
    return 0;
  else if (x == (1 << 31))
    return (1 << 31) | (158 << 23); // frac = 0, (158 << 23) 即为 (31+127) << 23
  else
  {
    int sign = x >> 31; // 这里sign为0/-1,最后返回时通过 sign << 31
    // 得到最高位1,进而计算exp
    int abs_x = (x ^ sign) - sign; // sign=0时,abs_x=x; sign=1时,abs_x=~x+1=-x
    int shift = 0;
    unsigned temp = abs_x; // unsigned很重要,后续 temp >> 1 执行逻辑右移
    int exp;
    int frac;
    while (temp >> 1)
    {
      shift += 1;
      temp = temp >> 1;
    }  // shift即为最高位1的序号
    exp = 127 + shift;
    // 得到frac
    frac = abs_x ^ (1 << shift); // 去掉最高位1
    if (shift <= 23)
      frac = frac << (23 - shift);
    else
    {
      int add = 0;
      int guard = 0;
      int sticky = 0;
      temp = frac << (55-shift);  // (55-shift) 即为 (32-shift)+23
      frac = frac >> (shift-23); 
      guard = temp >> 31;  // 舍去部分最高位是否为1, 标准形式为guard = (temp >> 31) & 1, 这里为了节省op, guard为-1也能达到同样效果
      sticky = temp << 1; // 舍去部分除最高位是否还有1(即判断舍去部分是否超过0.5), 标准形式为sticky = temp & ~(1 << 31), 这里为了节省op, 采取左移1位
      add = guard && (sticky || (frac & 1)); // 进位条件：1.舍去部分最高位必须为1(舍去部分是否>=0.5); 2.舍去部分>0.5或[舍去部分=0.5且frac末位为1]
      frac += add;
      if (frac >> 23)
      {
        frac = frac & ~(1 << 31 >> 9);
        exp ++;
      }
    }
    return (sign << 31) | (exp << 23) | frac;
  }
}


#ifdef NOT_SUPPOSED_TO_BE_DEFINED
#   __          __  _                          
#   \ \        / / | |                         
#    \ \  /\  / /__| | ___ ___  _ __ ___   ___ 
#     \ \/  \/ / _ \ |/ __/ _ \| '_ ' _ \ / _ \
#      \  /\  /  __/ | (_| (_) | | | | | |  __/       
#       \/  \/ \___|_|\___\___/|_| |_| |_|\___|
#                                              

#  ██╗  ██╗ ██████╗ ███╗   ██╗ ██████╗ ██████╗     ██████╗  █████╗ ██████╗ ████████╗
#  ██║  ██║██╔═══██╗████╗  ██║██╔═══██╗██╔══██╗    ██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝
#  ███████║██║   ██║██╔██╗ ██║██║   ██║██████╔╝    ██████╔╝███████║██████╔╝   ██║   
#  ██╔══██║██║   ██║██║╚██╗██║██║   ██║██╔══██╗    ██╔═══╝ ██╔══██║██╔══██╗   ██║   
#  ██║  ██║╚██████╔╝██║ ╚████║╚██████╔╝██║  ██║    ██║     ██║  ██║██║  ██║   ██║   
#  ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝    ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   
#                                                                                   
#endif

// P16
/* 
 * float_inv - Return bit-level equivalent of expression 1/x (x is an integer) for
 *   Result is returned as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point values.
 *   When x is 0, return NaN.
 *   Legal ops: Any integer / unsigned operations incl. ||, &&. also if, while
 *   Max ops: 120
 *   Rating: 10
 *   For mercy, x is between -16777216 and 16777216, meaning that you don't have
 *   to handle denormalized numbers.
 */
unsigned float_inv(int x) {
  unsigned sign, a, t, N, rem, S, twoRem, frac;
  int n, E, i, s;

  if (x == 0) return 0x7F800000u;          /* 正无穷 */

  /* 符号与绝对值（纯位运算，不用强转/负号） */
  s    = x >> 31;                 /* x<0 → s=0xFFFFFFFF，否则 0 */
  sign = s & 0x80000000u;         /* 符号位 */
  a    = (x ^ s) - s;             /* |x| = (x^s) - s */

  /* 找最高位 n = floor(log2(a)) */
  t = a; n = 0;
  if (t >> 16) { n += 16; t >>= 16; }
  if (t >> 8)  { n += 8;  t >>= 8; }
  if (t >> 4)  { n += 4;  t >>= 4; }
  if (t >> 2)  { n += 2;  t >>= 2; }
  if (t >> 1)  { n += 1; }

  /* 指数与初始余数/尾数 */
  E = 126 - n;                    /* E ∈ [102,126]，非负且 <<23 不会溢出 int */
  N = 1u << (n + 1);              /* 2^(n+1) */
  rem = N - a;                    /* 已放入整数部分 1 后的余数 */
  S = 1u << 23;                   /* 隐藏位 1，下面生成 23 位小数 */

  /* 逐位长除法，生成 23 位小数 */
  for (i = 22; i >= 0; --i) {
    rem <<= 1;
    if (rem >= a) {
      rem -= a;
      S |= (1u << i);
    }
  }

  /* round-to-nearest, ties-to-even */
  twoRem = rem << 1;
  if (twoRem > a || (twoRem == a && (S & 1u))) {
    S += 1;
    if (S >> 24) {                /* 溢到 2.0 → 规格化并指数 +1 */
      S >>= 1;
      E += 1;
    }
  }

  frac = S - (1u << 23);
  /* 这里不再用 (unsigned)E，直接用 E<<23；由于 sign/frac 是 unsigned，
     按 usual arithmetic conversions，整个表达式会提升为 unsigned。 */
  return sign | (E << 23) | frac;
}

// P17
/*
 * oddParity - return the odd parity bit of x, that is, 
 *      when the number of 1s in the binary representation of x is even, then the return 1, otherwise return 0.
 *   Examples: oddParity(5) = 1, oddParity(7) = 0
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 56
 *   Rating: 10
 */
int oddParity(int x) {                          // 巧妙地通过XoR实现奇偶性的运算
  int p = (x ^ (x >> 16)) & ~(1 << 31 >> 15);  // 异或结果为1:奇数个1; 异或结果为0:偶数个1
  p = (p ^ (p >> 8)) & ~(1 << 31 >> 23);        // 不断重复，最后得到总共有奇数还是偶数个1
  p = (p ^ (p >> 4)) & ~(1 << 31 >> 27);
  p = (p ^ (p >> 2)) & ~(1 << 31 >> 29);
  p = (p ^ (p >> 1)) & ~(1 << 31 >> 30);
  return !p;
}

// P18
/*
 * bitCount - return count of number of 1's in the binary representation of x
 *   Examples: bitCount(5) = 2, bitCount(7) = 3
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 40
 *   Rating: 10
 */
int bitCount(int x) {                          // 巧妙地通过分治和加法实现'1'的个数统计
  int mask_1 = (0x55 << 24) + (0x55 << 16) + (0x55 << 8) + 0x55;   // mask_1 = 0b01010101.....
  int mask_2 = (0x33 << 24) + (0x33 << 16) + (0x33 << 8) + 0x33;   // mask_2 = 0b00110011.....
  int mask_4 = (0xF << 24) + (0xF << 16) + (0xF << 8) + 0xF;       // mask_4 = 0b0000111100001111.....
  int mask_8 = (0xFF << 16) + 0xFF;                                // mask_8 = 0b0000000011111111.....
  int mask_16 = 0xFF;                                  // mask_16 = 0x0000FFFF, 标准形式应该为int mask_16 = (0xFF << 8) + 0xFF,为了节省op,去除(0xFF << 8),因为每一边不会有超过16个1
  int count = x;
  count = (count & mask_1) + ((count >> 1) & mask_1);
  count = (count & mask_2) + ((count >> 2) & mask_2);
  count = (count & mask_4) + ((count >> 4) & mask_4);
  count = (count & mask_8) + ((count >> 8) & mask_8);
  count = (count & mask_16) + ((count >> 16) & mask_16);
  return count;
}

// P19
/*
 * bitReverse - Reverse bits in an 32-bit integer
 *   Examples: bitReverse(0x80000004) = 0x20000001
 *             bitReverse(0x7FFFFFFF) = 0xFFFFFFFE
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 34
 *   Rating: 10
 */

// int bitReverse(int x) {              // m16 版本
//   int m16, m8, m4, m2, m1;

//   /* --- 递推式掩码构造 --- */
//   m16 = (0xFF << 8) | 0xFF;       // 0x0000FFFF
//   m8  = m16 ^ (m16 << 8);         // 0x00FF00FF
//   m4  = m8  ^ (m8  << 4);         // 0x0F0F0F0F
//   m2  = m4  ^ (m4  << 2);         // 0x33333333
//   m1  = m2  ^ (m2  << 1);         // 0x55555555

//   /* --- 五层分治反转 --- */
//   x = ((x >> 1)  & m1)  | ((x & m1)  << 1);   // 奇偶位对调
//   x = ((x >> 2)  & m2)  | ((x & m2)  << 2);   // 每 2 位对调
//   x = ((x >> 4)  & m4)  | ((x & m4)  << 4);   // 每 4 位对调
//   x = ((x >> 8)  & m8)  | ((x & m8)  << 8);   // 每字节对调
//   x = ((x >> 16) & m16) | ((x & m16) << 16);  // 半字对调

//   return x;
// }

// int bitReverse(int x) {              // m4 版本, 最优版本之一
//   int m4, m2, m1, m_second_byte;
//   // 构造掩码：先 m4，再推导 m2、m1，最后准备 m_second_byte
//   m4  = 0x0F | (0x0F << 8);
//   m4  = m4 | (m4 << 16);
//   m2 = m4 ^ (m4 << 2);
//   m1 = m2 ^ (m2 << 1);
//   m_second_byte = 0xFF << 8;            // 获取第2低的字节, 用于后续翻转4个字节

//   // 把每个字节内部的 bit 反转
//   x = ((x >> 1) & m1) | ((x & m1) << 1);
//   x = ((x >> 2) & m2) | ((x & m2) << 2);
//   x = ((x >> 4) & m4) | ((x & m4) << 4);

//   // 把 4 个字节的顺序反转
//   x = (x << 24) | ((x & m_second_byte) << 8) | ((x >> 8) & m_second_byte) | ((x >> 24) & 0xFF);
//   return x;
// }


int bitReverse(int x) {              // 改良m8 版本, 也是最优版本
  int m16, m8, m4, m2, m1;

  /* --- 构造掩码 --- */
  m16 = (0xFF << 8) | 0xFF;       // 0x0000FFFF
  m8  = m16 ^ (m16 << 8);
  m4 = m8 ^ (m8 << 4);              // 0x0F0F0F0F
  m2 = m4 ^ (m4 << 2);              // 0x33333333
  m1 = m2 ^ (m2 << 1);              // 0x55555555

  /* --- 局部反转：从奇偶到字节 --- */
  x = ((x >> 1) & m1) | ((x & m1) << 1);
  x = ((x >> 2) & m2) | ((x & m2) << 2);
  x = ((x >> 4) & m4) | ((x & m4) << 4);
  x = ((x >> 8) & m8) | ((x & m8) << 8);

  /* --- 整体半字交换 --- */
  x = ((x >> 16) & m16) | (x << 16);

  return x;
}