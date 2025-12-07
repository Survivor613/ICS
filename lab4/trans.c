/*
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */
#include <stdio.h>
#include "cachelab.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/*
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded.
 */

char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, k, h;
    // 定义12个局部变量，正好对应 Cache Block Size (48 bytes / 4 = 12 ints)
    int v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11;

    // Case 1: 48x48 Matrix
    // miss = 432
    if (M == 48) {
        for (i = 0; i < N; i += 12) {
            for (j = 0; j < M; j += 12) {
                for (k = i; k < i + 12; k++) {
                    // 读取 A 的一行到寄存器
                    v0 = A[k][j];
                    v1 = A[k][j+1];
                    v2 = A[k][j+2];
                    v3 = A[k][j+3];
                    v4 = A[k][j+4];
                    v5 = A[k][j+5];
                    v6 = A[k][j+6];
                    v7 = A[k][j+7];
                    v8 = A[k][j+8];
                    v9 = A[k][j+9];
                    v10 = A[k][j+10];
                    v11 = A[k][j+11];

                    // 写入 B 的一列
                    B[j][k] = v0;
                    B[j+1][k] = v1;
                    B[j+2][k] = v2;
                    B[j+3][k] = v3;
                    B[j+4][k] = v4;
                    B[j+5][k] = v5;
                    B[j+6][k] = v6;
                    B[j+7][k] = v7;
                    B[j+8][k] = v8;
                    B[j+9][k] = v9;
                    B[j+10][k] = v10;
                    B[j+11][k] = v11;
                }
            }
        }
    } 
    // Case 2: 96x96 Matrix (执行最简单的单次读取和一次性写入)
    // miss = 9988
    // else if (M == 96) {
    //     // 采用与 48x48 完全相同的逻辑
    //     for (i = 0; i < N; i += 12) {
    //         for (j = 0; j < M; j += 12) {
    //             for (k = i; k < i + 12; k++) {
    //                 // 1. 读取 A 的一行到寄存器 (v0..v11)
    //                 v0 = A[k][j];
    //                 v1 = A[k][j+1];
    //                 v2 = A[k][j+2];
    //                 v3 = A[k][j+3];
    //                 v4 = A[k][j+4];
    //                 v5 = A[k][j+5];
    //                 v6 = A[k][j+6];
    //                 v7 = A[k][j+7];
    //                 v8 = A[k][j+8];
    //                 v9 = A[k][j+9];
    //                 v10 = A[k][j+10];
    //                 v11 = A[k][j+11];

    //                 // 2. 写入 B 的一列 (一次性写入 12 行，触发 B vs B 自我驱逐)
    //                 B[j][k] = v0;
    //                 B[j+1][k] = v1;
    //                 B[j+2][k] = v2;
    //                 B[j+3][k] = v3;
    //                 B[j+4][k] = v4;
    //                 B[j+5][k] = v5;
    //                 B[j+6][k] = v6;
    //                 B[j+7][k] = v7;
    //                 B[j+8][k] = v8;
    //                 B[j+9][k] = v9;
    //                 B[j+10][k] = v10;
    //                 B[j+11][k] = v11;
    //             }
    //         }
    //     }
    // }
    // Case 2: 96x96 Matrix (双重扫描)
    // miss = 2484
    // else if (M == 96) {
    //     for (i = 0; i < N; i += 12) {
    //         for (j = 0; j < M; j += 12) {
                
    //             // --- 阶段一：写入 B 的上半部分 (Rows j 到 j+5) ---
    //             for (k = i; k < i + 12; k++) {
    //                 // 1. 读取 A 的一行 (12个元素)
    //                 v0 = A[k][j]; v1 = A[k][j+1]; v2 = A[k][j+2]; v3 = A[k][j+3];
    //                 v4 = A[k][j+4]; v5 = A[k][j+5]; v6 = A[k][j+6]; v7 = A[k][j+7];
    //                 v8 = A[k][j+8]; v9 = A[k][j+9]; v10 = A[k][j+10]; v11 = A[k][j+11];

    //                 // 2. 只写入 B 的上半部分 (Rows 0-5)
    //                 B[j][k] = v0; B[j+1][k] = v1; B[j+2][k] = v2; B[j+3][k] = v3;
    //                 B[j+4][k] = v4; B[j+5][k] = v5;
    //                 // 注意：v6-v11 的数据被丢弃了，因为 B 的下半部分现在不写
    //             }

    //             // --- 阶段二：重新读取 A，写入 B 的下半部分 (Rows j+6 到 j+11) ---
    //             for (k = i; k < i + 12; k++) {
    //                 // 1. 重新读取 A 的一行 (A Miss 再次发生，支付双倍 Miss)
    //                 v0 = A[k][j]; v1 = A[k][j+1]; v2 = A[k][j+2]; v3 = A[k][j+3];
    //                 v4 = A[k][j+4]; v5 = A[k][j+5]; v6 = A[k][j+6]; v7 = A[k][j+7];
    //                 v8 = A[k][j+8]; v9 = A[k][j+9]; v10 = A[k][j+10]; v11 = A[k][j+11];

    //                 // 2. 只写入 B 的下半部分 (Rows 6-11)
    //                 B[j+6][k] = v6; B[j+7][k] = v7; B[j+8][k] = v8; B[j+9][k] = v9;
    //                 B[j+10][k] = v10; B[j+11][k] = v11;
    //             }
    //         }
    //     }
    // }
    // Case 2: 96x96 Matrix (最终)
    // miss = 1868
    else if (M == 96) {
        for (i = 0; i < N; i += 12) {
            for (j = 0; j < M; j += 12) {
                // 步骤 1: 处理 A 的上半部分 (6行)
                for (k = i; k < i + 6; k++) {
                    v0 = A[k][j];    v1 = A[k][j+1];  v2 = A[k][j+2];  v3 = A[k][j+3];
                    v4 = A[k][j+4];  v5 = A[k][j+5];  v6 = A[k][j+6];  v7 = A[k][j+7];
                    v8 = A[k][j+8];  v9 = A[k][j+9];  v10 = A[k][j+10]; v11 = A[k][j+11];

                    B[j][k] = v0;    B[j+1][k] = v1;  B[j+2][k] = v2; 
                    B[j+3][k] = v3;  B[j+4][k] = v4;  B[j+5][k] = v5; 
                    
                    B[j][k+6] = v6;    B[j+1][k+6] = v7;  B[j+2][k+6] = v8;
                    B[j+3][k+6] = v9;  B[j+4][k+6] = v10; B[j+5][k+6] = v11;
                }

                // 步骤 2: 处理 A 的下半部分 (6行) 并 修正 B 的数据位置
                for (k = 0; k < 6; k++) {
                    v0 = B[j + k][i + 6];
                    v1 = B[j + k][i + 7];
                    v2 = B[j + k][i + 8];
                    v3 = B[j + k][i + 9];
                    v4 = B[j + k][i + 10];
                    v5 = B[j + k][i + 11];

                    v6 = A[i + 6][j + k];
                    v7 = A[i + 7][j + k];
                    v8 = A[i + 8][j + k];
                    v9 = A[i + 9][j + k];
                    v10 = A[i + 10][j + k];
                    v11 = A[i + 11][j + k];

                    B[j + k][i + 6] = v6;
                    B[j + k][i + 7] = v7;
                    B[j + k][i + 8] = v8;
                    B[j + k][i + 9] = v9;
                    B[j + k][i + 10] = v10;
                    B[j + k][i + 11] = v11;

                    B[j + k + 6][i] = v0;
                    B[j + k + 6][i + 1] = v1;
                    B[j + k + 6][i + 2] = v2;
                    B[j + k + 6][i + 3] = v3;
                    B[j + k + 6][i + 4] = v4;
                    B[j + k + 6][i + 5] = v5;
                }

                // 步骤 3: 处理 A 的右下角数据
                for (k = i + 6; k < i + 12; k++) {
                    v0 = A[k][j+6];
                    v1 = A[k][j+7];
                    v2 = A[k][j+8];
                    v3 = A[k][j+9];
                    v4 = A[k][j+10];
                    v5 = A[k][j+11];

                    B[j+6][k] = v0;
                    B[j+7][k] = v1;
                    B[j+8][k] = v2;
                    B[j+9][k] = v3;
                    B[j+10][k] = v4;
                    B[j+11][k] = v5;
                }
            }
        }
    }
    // Case 3: 93x99 Matrix (Irregular size)
    // miss = 2881
    else {
        for (i = 0; i < N; i += 12) {
            for (j = 0; j < M; j += 12) {
                // 检查是否是完整的 12x12 块
                if (i + 12 <= N && j + 12 <= M) {
                    // 如果是完整块，使用 12 个寄存器进行缓冲优化，避免对角线冲突
                    for (k = i; k < i + 12; k++) {
                        v0 = A[k][j];
                        v1 = A[k][j+1];
                        v2 = A[k][j+2];
                        v3 = A[k][j+3];
                        v4 = A[k][j+4];
                        v5 = A[k][j+5];
                        v6 = A[k][j+6];
                        v7 = A[k][j+7];
                        v8 = A[k][j+8];
                        v9 = A[k][j+9];
                        v10 = A[k][j+10];
                        v11 = A[k][j+11];

                        B[j][k] = v0;
                        B[j+1][k] = v1;
                        B[j+2][k] = v2;
                        B[j+3][k] = v3;
                        B[j+4][k] = v4;
                        B[j+5][k] = v5;
                        B[j+6][k] = v6;
                        B[j+7][k] = v7;
                        B[j+8][k] = v8;
                        B[j+9][k] = v9;
                        B[j+10][k] = v10;
                        B[j+11][k] = v11;
                    }
                } else {
                    // 如果是边缘的不完整块，使用带边界检查的普通处理
                    for (k = i; k < i + 12 && k < N; k++) {
                        for (h = j; h < j + 12 && h < M; h++) {
                            v0 = A[k][h];
                            B[h][k] = v0;
                        }
                    }
                }
            }
        }
    }
}

/*
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started.
 */

/*
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, tmp;

    for (i = 0; i < N; i++)
    {
        for (j = 0; j < M; j++)
        {
            tmp = A[i][j];
            B[j][i] = tmp;
        }
    }
}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerTransFunction(trans, trans_desc);
    registerTransFunction(transpose_submit, transpose_submit_desc);

    /* Register any additional transpose functions */
    // registerTransFunction(trans, trans_desc);
}

/*
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++)
    {
        for (j = 0; j < M; ++j)
        {
            if (A[i][j] != B[j][i])
            {
                return 0;
            }
        }
    }
    return 1;
}
