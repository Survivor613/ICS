#pragma once

#include <stddef.h>

#define MININT -2147483648

// cache parameters (command-line arguments)
int sBits;          // number of set index bits (s)
int bBits;          // number of block offset bits (b)
int mBits;          // address width in bits (m), default 64
int numSets;        // S = 2^s
int associativity;  // E
int blockSize;      // B = 2^b
char filePath[100];
int verbose;

// final results
int hits;
int misses;
int evictions;

#define ACCESS_RESULT_HIT 0x1
#define ACCESS_RESULT_MISS 0x2
#define ACCESS_RESULT_EVICT 0x4

typedef struct
{
    int valid;
    unsigned long long tag;
    unsigned long long lruStamp;
} CacheLine;

typedef struct
{
    CacheLine *lines;
} CacheSet;

typedef struct
{
    CacheSet *sets;
    size_t setCount;
    size_t linesPerSet;
} CacheSim;

// will be set in getopt() function
extern char *optarg;

// helper function declarations
void usage(void);
void parseline(int argc, char **argv);
void initCache(void);
void freeCache(void);
int accessCache(unsigned long long address);
void simulateTrace(void);
void printVerboseResult(int result);
