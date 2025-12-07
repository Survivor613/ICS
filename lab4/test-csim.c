/*
 * test-csim.c - Compare student's simulator (./csim) against reference
 * (./csim-ref) under the bit-parameter semantics:
 *   S = 2^s sets, B = 2^b bytes/line, E lines/set.
 *
 * Scoring: first 7 tests worth 3 pts each, last test worth 6 pts.
 * Each test splits its points evenly across hits/misses/evictions matches.
 * Emits TEST_CSIM_RESULTS=<score> for driver.py consumption.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <unistd.h>
#include <sys/wait.h>

typedef struct
{
    int s;
    int E;
    int b;
    const char *tracefile;
    int weight;
} TestCase;

static TestCase tests[] = {
    {1, 1, 1, "traces/yi2.trace", 3},
    {4, 2, 4, "traces/yi.trace", 3},
    {2, 1, 4, "traces/dave.trace", 3},
    {2, 1, 3, "traces/trans.trace", 3},
    {2, 2, 3, "traces/trans.trace", 3},
    {2, 4, 3, "traces/trans.trace", 3},
    {5, 1, 5, "traces/trans.trace", 3},
    {5, 1, 5, "traces/long.trace", 6},
};

static int read_results(const char *path, int *hits, int *misses, int *evicts)
{
    FILE *fp = fopen(path, "r");
    if (!fp)
    {
        return -1;
    }
    if (fscanf(fp, "%d %d %d", hits, misses, evicts) != 3)
    {
        fclose(fp);
        return -1;
    }
    fclose(fp);
    return 0;
}

static const char *pick_prog(const char *preferred, const char *fallback)
{
    FILE *fp = fopen(preferred, "r");
    if (fp)
    {
        fclose(fp);
        return preferred;
    }
    return fallback;
}

static void run_sim(const char *prog, const TestCase *tc, int *hits, int *misses, int *evicts)
{
    char cmd[256];
    snprintf(cmd, sizeof(cmd), "./%s -s %d -E %d -b %d -t %s > /dev/null",
             prog, tc->s, tc->E, tc->b, tc->tracefile);
    int ret = system(cmd);
    if (ret != 0)
    {
        fprintf(stderr, "Error: %s failed for (%d,%d,%d) %s\n",
                prog, tc->s, tc->E, tc->b, tc->tracefile);
        exit(1);
    }
    if (read_results(".csim_results", hits, misses, evicts) != 0)
    {
        fprintf(stderr, "Error: cannot read .csim_results after %s\n", prog);
        exit(1);
    }
}

static bool run_leak_check(void)
{
    /* Small leak check: run a trivial case under valgrind, penalize if leaks/errors are reported */
    if (access("/usr/bin/valgrind", X_OK) != 0 && access("/bin/valgrind", X_OK) != 0)
    {
        /* valgrind not available, treat as failing the leak check */
        return true;
    }
    int ret = system("valgrind --quiet --leak-check=full --errors-for-leak-kinds=all --error-exitcode=9 "
                     "./csim -s 1 -E 1 -b 1 -t traces/yi2.trace > /dev/null 2> /dev/null");
    if (WIFEXITED(ret) && WEXITSTATUS(ret) == 9)
    {
        return true;
    }
    return false;
}

int main(void)
{
    int num_tests = (int)(sizeof(tests) / sizeof(tests[0]));
    double total_score = 0.0;
    bool leak_penalty = false;

    printf("                        Your simulator     Reference simulator\n");
    printf("Points (s,E,b)    Hits  Misses  Evicts    Hits  Misses  Evicts\n");

    for (int i = 0; i < num_tests; i++)
    {
        const TestCase *tc = &tests[i];
        int h_ref = 0, m_ref = 0, e_ref = 0;
        int h_stu = 0, m_stu = 0, e_stu = 0;

        const char *ref_prog = pick_prog("ref-bin/csim-ref", "csim-ref");
        run_sim(ref_prog, tc, &h_ref, &m_ref, &e_ref);
        run_sim("csim", tc, &h_stu, &m_stu, &e_stu);

        int correct = 0;
        if (h_ref == h_stu)
            correct++;
        if (m_ref == m_stu)
            correct++;
        if (e_ref == e_stu)
            correct++;

        double gain = (tc->weight / 3.0) * correct;
        total_score += gain;

        printf("%6.0f (%d,%d,%d)%9d%8d%8d%9d%8d%8d  %s\n",
               gain, tc->s, tc->E, tc->b,
               h_stu, m_stu, e_stu,
               h_ref, m_ref, e_ref,
               tc->tracefile);
    }

    leak_penalty = run_leak_check();
    double final_score = total_score - (leak_penalty ? 1.0 : 0.0);
    if (final_score < 0)
    {
        final_score = 0;
    }

    printf("%6.0f\n", final_score);
    if (leak_penalty)
    {
        printf("(Leak check: -1 point)\n");
    }
    printf("\nTEST_CSIM_RESULTS=%d\n", (int)final_score);
    return 0;
}
