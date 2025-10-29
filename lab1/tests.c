/* Testing Code */

#include <limits.h>
#include <math.h>

/* Routines used by floation point test code */

/* Convert from bit level representation to floating point number */
float u2f(unsigned u) {
  union {
    unsigned u;
    float f;
  } a;
  a.u = u;
  return a.f;
}

/* Convert from floating point number to bit-level representation */
unsigned f2u(float f) {
  union {
    unsigned u;
    float f;
  } a;
  a.f = f;
  return a.u;
}

int test_bitNand(int x, int y){
  return ~(x&y);
}

int test_clearByte(int x,int y){
  union tests
  {
    int a;
    unsigned char b[4];
  }t;
  t.a = x;
  t.b[y] = 0;
  return t.a;
}

int test_roundUp(int x){
  if(x < 0){
    return x - x%256;
  }else{
    if(x%256 == 0)
      return x;
    else 
      return x - x%256 + 256;
  }
}

int test_swapNibblePairs(int x){
    int result = 0;
    for (int i = 0; i < 32; i += 8) {
        int byte = (x >> i) & 0xFF;
        int lowNibble = byte & 0x0F;
        int highNibble = (byte >> 4) & 0x0F;
        int swapped = (lowNibble << 4) | highNibble;
        result |= (swapped << i);
    }
    return result;
}

int test_rotateRightBits(int x, int n){
  unsigned int ux = (unsigned int)x;
  unsigned int shift = (unsigned int)n & 31;
  unsigned int rightPart = ux >> shift;
  unsigned int leftPart = ux << ((32 - shift) & 31);
  return (int)(rightPart | leftPart);
}

int test_fractions(int x){
  return (x*5 + 8)/16;
}
int test_secondLowestZeroBit(int x){
  int count = 0;
  for (int i = 0; i < 32; i++) {
    if (!((x >> i) & 1)) {
      count++;
      if (count == 2)
        return 1 << i;
    }
  }
  return 0;
}
int test_hdOverflow(int x,int y){
  long long res=(long long)x+(long long)y;
  return res>2147483647||res<-2147483648;
}

int test_overflowCalc(int x, int y, int z){
  union tests
  {
    int a;
    unsigned b;
  }u,v,w;
  u.a=x;
  v.a=y;
  w.a=z;
  long long res=(long long)u.b+(long long)v.b+(long long)w.b;
  return res>>32;
}

unsigned test_float_inv(int x) {
  return f2u(1.0/x);
}

unsigned test_float_i2f(int x) {
  float f = (float) x;
  return f2u(f);
}

int test_oddParity(int x){
  int answer=0;
  for(int i=1;i<=32;++i){
    answer+=x%2;
    x>>=1;
  }
  return answer%2?0:1;
}

int test_bitXor(int x, int y){
  return x ^ y;
}

int test_signMask(void) {
  return 0x80000000;
}

int test_negativePart(int x){
  return x < 0 ? -x : 0;
}

int test_isLargerOrEqual(int x, int y){
  return x >= y;
}

int test_bitCount(int x) {
  int result = 0;
  int i;
  for (i = 0; i < 32; i++)
    result += (x >> i) & 0x1;
  return result;
}

int test_bitReverse(int x){
  int ans=0;
  for(int i=0;i<32;i++){
    ans<<=1;
    ans|=(x&1);
    x>>=1;
  }
  return ans;
}

int test_mul5Sat(int x){
  if(x > 0x7fffffff/5)
    return 0x7fffffff;
  else if(x < (int)0x80000000/5)
    return 0x80000000;
  else 
    return x*5;
}

int test_logicalShift(int x, int n) {
  unsigned u = (unsigned) x;
  unsigned shifted = u >> n;
  return (int) shifted;
}

unsigned test_float_half(unsigned uf) {
  float f = u2f(uf);
  float tf = f/2;
  if (isnan(f))
    return uf;
  else
    return f2u(tf);
}
