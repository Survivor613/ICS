#include "cachelab.h"
#include <errno.h>
#include <getopt.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "csim.h"

#include <limits.h>  // 新增

// cache state and LRU clock (students will use them in their implementation)
static CacheSim cacheSim = {0};
static unsigned long long accessClock = 0;
static int sProvided = 0, eProvided = 0, bProvided = 0, tProvided = 0;

// print usage info
void usage(void)
{
    printf("Usage: ./csim [-hv] -s <num> -E <num> -b <num> -t <file> [-m <num>]\n");
    printf("Options:\n");
    printf("  -h         Print this help message.\n");
    printf("  -v         Optional verbose flag.\n");
    printf("  -s <num>   Number of set index bits (s), so S = 2^s sets.\n");
    printf("  -E <num>   Number of lines per set (E).\n");
    printf("  -b <num>   Number of block offset bits (b), so B = 2^b bytes per line.\n");
    printf("  -t <file>  Trace file.\n");
    printf("  -m <num>   Address width in bits (m), defaults to 64; must satisfy m > s + b.\n");
    printf("\n");
    printf("Examples:\n");
    printf("  linux>  ./csim -s 4 -E 1 -b 4 -t traces/yi.trace\n");
    printf("  linux>  ./csim -v -s 8 -E 2 -b 4 -t traces/yi.trace\n");
    exit(1);
}

// parse command line and get the parameters
void parseline(int argc, char **argv)
{
    int opt;
    int num = 0;
    mBits = 64; // default address width
    while ((opt = getopt(argc, argv, "hvs:E:b:t:m:")) != -1)
    {
        switch (opt)
        {
        case 'h':
            usage();
            break;
        case 'v':
            verbose = 1;
            break;
        case 's':
            num = atoi(optarg);
            if (optarg[0] == '\0' || num < 0)
            {
                printf("./csim: Missing required command line argument\n");
                usage();
            }
            sBits = num;
            sProvided = 1;
            break;
        case 'E':
            num = atoi(optarg);
            if (optarg[0] == '\0' || num <= 0)
            {
                printf("./csim: Missing required command line argument\n");
                usage();
            }
            associativity = num;
            eProvided = 1;
            break;
        case 'b':
            num = atoi(optarg);
            if (optarg[0] == '\0' || num < 0)
            {
                printf("./csim: Missing required command line argument\n");
                usage();
            }
            bBits = num;
            bProvided = 1;
            break;
        case 't':
            strncpy(filePath, optarg, sizeof(filePath) - 1);
            filePath[sizeof(filePath) - 1] = '\0';
            tProvided = 1;
            break;
        case 'm':
            num = atoi(optarg);
            if (optarg[0] == '\0' || num <= 0)
            {
                printf("./csim: Missing required command line argument\n");
                usage();
            }
            mBits = num;
            break;
        case ':':
            printf("./csim: Missing required command line argument\n");
            usage();
            break;
        case '?':
            usage();
            break;
        default:
            printf("getopt error");
            exit(1);
            break;
        }
    }

    if (!(sProvided && eProvided && bProvided && tProvided))
    {
        printf("./csim: Missing required command line argument\n");
        usage();
    }
    // TODO: Student implementation — compute S=2^s and B=2^b, and handle corner cases as needed
    numSets = 1 << sBits; // 2**x 的简便实现形式
    blockSize = 1 << bBits;

    // 特殊情况处理
    if (sBits + bBits >= mBits) usage();
}

void initCache(void){
    // TODO: Student implementation — allocate the cache structure and initialize valid bits and timestamps
    // (void)cacheSim;
    cacheSim.setCount = numSets;
    cacheSim.linesPerSet = associativity;
    // 分配 CacheSet
    cacheSim.sets = (CacheSet*)malloc(cacheSim.setCount * sizeof(CacheSet));
    if (cacheSim.sets == NULL) {
        // 内存分配失败，打印错误并退出
        fprintf(stderr, "FATAL: Failed to allocate memory for %zu Sets.\n", cacheSim.setCount);
        exit(1);
    }
    
    // 分配每个 CacheSet 中的 CacheLine
    for (int i=0; i<cacheSim.setCount; i++){
        cacheSim.sets[i].lines = (CacheLine*)malloc(cacheSim.linesPerSet * sizeof(CacheLine));
        if (cacheSim.sets[i].lines == NULL) {
        // 内存分配失败，打印错误并退出
        fprintf(stderr, "FATAL: Failed to allocate memory for for Lines in Set %u.\n", i);
        freeCache();  // 关键!!! 要清空已分配的内存空间
        exit(1);
        }
    }

    // 设置每个 CacheLine 中的初始状态
    for (size_t i=0; i<cacheSim.setCount; i++){
        for (size_t j=0; j<cacheSim.linesPerSet; j++){
            cacheSim.sets[i].lines[j].valid = 0;
            cacheSim.sets[i].lines[j].tag = 0;
            cacheSim.sets[i].lines[j].lruStamp = 0;
        }
    }

    // 初始化 hits/ misses/ evictions
}

void freeCache(void){
    // TODO: Student implementation — free any allocated memory
    if (cacheSim.sets == NULL) {
        return;
    }

    // 先 free 内层内存空间
    for (size_t i=0; i<cacheSim.setCount; i++){
        if (cacheSim.sets[i].lines != NULL){
            free(cacheSim.sets[i].lines);
            cacheSim.sets[i].lines = NULL;
        }
    }

    // 再 free 外层内存空间
    free(cacheSim.sets);   // 不可以直接 free(cacheSim), 因为只有 cacheSim.sets 是 malloc 在堆上的
    cacheSim.sets = NULL;
}

int accessCache(unsigned long long address){
    // TODO: Student implementation — perform one access using (S, E, B) with LRU and return hit/miss/evict flags
    // (void)address;
    // (void)accessClock;

    // 全局计时器推进
    accessClock++;

    // 得到 S, B;  
    // // S 用于定位 Set;
    size_t S = (address >> bBits) & ((1ULL << sBits) - 1);
    // ~(1 >> (31 - sBits) 掩码安全性差, 使用 ((1ULL << sBits) - 1)

    // E 不需要, 直接遍历查找;

    // B 用于确定偏移量, PartA 中简化暂不做考虑
    // size_t B = address & ((1ULL << bBits) - 1);

    unsigned long long tag = (address >> (bBits + sBits));

    // 初始化局部变量
    int empty_pos = -1;
    unsigned long long lru = ULLONG_MAX;
    int lru_pos = -1;

    // 判断 address 是否在 Cache 中
    for (size_t i=0; i<cacheSim.linesPerSet; i++){
        CacheLine* cache_line = &cacheSim.sets[S].lines[i];
        if (cache_line -> valid){
            // 找到
            if (cache_line -> tag == tag){
                ++hits;
                cache_line -> lruStamp = accessClock;

                return ACCESS_RESULT_HIT;
            }
            else{
                if (cache_line -> lruStamp < lru){
                    lru = cache_line -> lruStamp;
                    lru_pos = i;
                }
            }
        }
        // 存在未使用过的位置(valid = 0)
        else {
            if (empty_pos == -1) empty_pos = i;
        }
    }

    // 未找到, 需进一步判断是否存在空位
    ++misses;

    // 存在空位, 则在空位执行插入
    if (empty_pos != -1){
        cacheSim.sets[S].lines[empty_pos].valid = 1;
        cacheSim.sets[S].lines[empty_pos].tag = tag;
        cacheSim.sets[S].lines[empty_pos].lruStamp = accessClock;

        return ACCESS_RESULT_MISS;
    }
    // 不存在空位, 则执行替换
    else{
        if (lru_pos != -1){
            ++evictions;
            cacheSim.sets[S].lines[lru_pos].tag = tag;
            cacheSim.sets[S].lines[lru_pos].lruStamp = accessClock;

            return ACCESS_RESULT_EVICT | ACCESS_RESULT_MISS;
        }
        else{
            fprintf(stderr, "accessCache 中遇到未定义情况");
            exit(0);
        }
    }
}

void printVerboseResult(int result){
    if (result & ACCESS_RESULT_HIT){
        printf(" hit");
    }
    if (result & ACCESS_RESULT_MISS){
        printf(" miss");
    }
    if (result & ACCESS_RESULT_EVICT){
        printf(" eviction");
    }
}

void simulateTrace(void)
{
    FILE *trace = fopen(filePath, "r");
    if (!trace){
        fprintf(stderr, "Error opening trace file %s: %s\n", filePath, strerror(errno));
        exit(1);
    }

    char buffer[256];
    while (fgets(buffer, sizeof(buffer), trace)){
        char op = '\0';
        unsigned long long address = 0;
        int size = 0;

        if (sscanf(buffer, " %c %llx,%d", &op, &address, &size) != 3){
            continue;
        }

        if (op == 'I'){
            continue;
        }

        if (verbose){
            printf("%c %llx,%d", op, address, size);
        }

        int outcome = accessCache(address);

        if (op == 'M'){
            int secondOutcome = accessCache(address);
            if (verbose){
                printVerboseResult(outcome);
                printVerboseResult(secondOutcome);
                printf("\n");
            }
        }
        else{
            if (verbose){
                printVerboseResult(outcome);
                printf("\n");
            }
        }
    }

    fclose(trace);
}

int main(int argc, char *argv[]){
    parseline(argc, argv);
    initCache();
    simulateTrace();
    freeCache();
    printSummary(hits, misses, evictions);
    return 0;
}
