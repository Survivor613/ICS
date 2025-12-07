/*
 * mul.c - Matrix multiply C = A * B
 *
 * Each multiply function must have a prototype of the form:
 * void mul(int M, int N, int A[N][M], int B[M][N], int C[N][N]);
 *
 * A multiply function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */
#include <stdio.h>
#include "cachelab.h"

int is_mul(int M, int N, int A[N][M], int B[M][N], int C[N][N]);

/*
 * multiply_submit - This is the solution multiply function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "multiply submission", as the driver
 *     searches for that string to identify the multiply function to
 *     be graded.
 */

char mul_submit_desc[] = "multiply submission";;
void mul_submit(int M, int N, int A[N][M], int B[M][N], int C[N][N]){   
    // k = 8: misses = 2551
    // k = 4: misses = 3783
    // k = 16: misses = 5108


    // 定义变量
    // i, j, k: 外层分块循环
    // x, y: 内层计算循环
    // a_val: 缓存 A 的值
    // c0-c7: 缓存 C 的一行 (8个int)
    int i, j, k, x, y;
    int a_val;
    int c0, c1, c2, c3, c4, c5, c6, c7;

    // 分块策略：
    // j: 步长 8 (对应 C 和 B 的列，正好一个 Cache Line)
    // k: 步长 8 (限制 A 和 B 的活跃区域，防止驱逐 C)
    // i: 步长 4 (处理 C 的 4 行)
    for (j = 0; j < N; j += 8) {
        for (k = 0; k < N; k += 8) {
            for (i = 0; i < N; i += 4) {
                
                // 逐行处理 C 的 4 行
                for (x = i; x < i + 4; x++) {
                    
                    // 1. 将 C 的一行 (8个int) 加载到寄存器 c0-c7
                    // 优化：如果是 k=0 (第一次计算)，直接置 0，省去一次从内存读 C 的 Miss
                    if (k == 0) {
                        c0 = 0; c1 = 0; c2 = 0; c3 = 0;
                        c4 = 0; c5 = 0; c6 = 0; c7 = 0;
                    } else {
                        c0 = C[x][j];   c1 = C[x][j+1];
                        c2 = C[x][j+2]; c3 = C[x][j+3];
                        c4 = C[x][j+4]; c5 = C[x][j+5];
                        c6 = C[x][j+6]; c7 = C[x][j+7];
                    }

                    // 2. 累加 k 维度的 8 个元素
                    // 在这个小循环里，C 始终驻留在寄存器中，没有内存读写
                    for (y = k; y < k + 8; y++) {
                        a_val = A[x][y]; // 读取一次 A

                        // 连续读取 B 的 8 个元素并累加
                        // B 是按行读取的，空间局部性极好
                        c0 += a_val * B[y][j];
                        c1 += a_val * B[y][j+1];
                        c2 += a_val * B[y][j+2];
                        c3 += a_val * B[y][j+3];
                        c4 += a_val * B[y][j+4];
                        c5 += a_val * B[y][j+5];
                        c6 += a_val * B[y][j+6];
                        c7 += a_val * B[y][j+7];
                    }

                    // 3. 将计算结果写回 C
                    // 对于每个 k 块 (4步)，我们只读写一次 C，大幅减少 C 的 Miss
                    C[x][j]   = c0;
                    C[x][j+1] = c1;
                    C[x][j+2] = c2;
                    C[x][j+3] = c3;
                    C[x][j+4] = c4;
                    C[x][j+5] = c5;
                    C[x][j+6] = c6;
                    C[x][j+7] = c7;
                }
            }
        }
    }
}

/*
 * mul - A simple multiply function, not optimized for the cache.
 */
char mul_desc[] = "simple multiply";
void mul(int M, int N, int A[N][M], int B[M][N], int C[N][N]){
    int i, j, k, tmp;
    for (i = 0; i < N; i++)
    {
        for (j = 0; j < N; j++)
        {
            tmp = 0;
            for (k = 0; k < M; k++)
            {
                tmp += A[i][k] * B[k][j];
            }
            C[i][j] = tmp;
        }
    }
}

/*
 * registerFunctions - This function registers your multiply
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     multiply strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    // registerMulFunction(mul_submit, mul_submit_desc);
    registerMulFunction(mul_test, mul_test_desc);

    /* Register any additional multiply functions */
    // registerMulFunction(mul, mul_desc);
}

/*
 * is_multiply - This helper function checks if C is the multiply of
 *     A and B. You can check the correctness of your multiply by calling
 *     it before returning from the multiply function.
 */
int is_mul(int M, int N, int A[N][M], int B[M][N], int C[N][N])
{
    int i, j, k;
    int num = 0;
    for (i = 0; i < N; i++)
    {
        for (j = 0; j < N; j++)
        {
            num = 0;
            for (k = 0; k < M; k++)
            {
                num += A[i][k] * B[k][j];
            }
            if (num != C[i][j])
            {
                return 0;
            }
        }
    }
    return 1;
}
