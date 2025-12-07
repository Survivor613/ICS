#!/usr/bin/env python3
#
# driver.py - The driver tests the correctness of the student's cache
#     simulator and the correctness and performance of their transpose
#     function. It uses ./test-csim to check the correctness of the
#     simulator and it runs ./test-trans on three different sized
#     matrices (48x48, 96x96, and 93x99) to test the correctness and
#     performance of the transpose function.
#
import subprocess
import re
import os
import sys
import optparse

#
# computeMissScore - compute the score depending on the number of
# cache misses
#
def computeMissScore(miss, lower, upper, full_score):
    if miss <= lower:
        return full_score
    if miss >= upper: 
        return 0

    score = (miss - lower) * 1.0 
    range_span = (upper- lower) * 1.0
    return round((1 - score / range_span) * full_score, 1)

#
# main - Main function
#
def main():
    def ensure_executable(path, friendly):
        if path is None:
            print(f"Error: required helper `{friendly}` is missing. Ensure ref-bin/ binaries are present or rebuild with `make refs`.")
            sys.exit(1)
        if not os.path.isfile(path):
            print(f"Error: required helper `{friendly}` is missing. Build it or restore the provided reference binary.")
            sys.exit(1)
        if not os.access(path, os.X_OK):
            print(f"Error: `{friendly}` is not executable. Run `chmod +x {friendly}` or rebuild.")
            sys.exit(1)

    def pick_helper(candidates):
        for p in candidates:
            if os.path.isfile(p) and os.access(p, os.X_OK):
                return p
        return None

    # Configure maxscores here
    maxscore= {};
    maxscore['csim'] = 40
    maxscore['trans48'] = 12
    maxscore['trans96'] = 12
    maxscore['trans93'] = 12
    honorpart = [4,5,10]

    # Parse the command line arguments 
    p = optparse.OptionParser()
    p.add_option("-A", action="store_true", dest="autograde", 
                 help="emit autoresult string for Autolab");
    opts, args = p.parse_args()
    autograde = opts.autograde

    # Helper binary locations (prefer prebuilt references in ref-bin if present)
    test_csim = pick_helper(["./ref-bin/test-csim", "./test-csim"])
    csim_ref = pick_helper(["./ref-bin/csim-ref", "./csim-ref"])
    ensure_executable(test_csim, test_csim)
    ensure_executable("./test-trans", "./test-trans")

    test_mul = pick_helper(
        ["./honor-part/test-mul", "./honor-part/build/bin/test-mul"])
    ensure_executable(test_mul, "honor-part/test-mul (run `make -C honor-part`)")

    # Check the correctness of the cache simulator
    print("Part A: Testing cache simulator")
    print("the following are original points, which will be transformed into the final points")
    print("Running ./test-csim")
    p = subprocess.Popen(f"{test_csim}", 
                         shell=True, stdout=subprocess.PIPE, text=True)
    stdout_data = p.communicate()[0]

    # Emit the output from test-csim
    stdout_lines = re.split('\n', stdout_data)
    resultsim = []
    for line in stdout_lines:
        if re.match("TEST_CSIM_RESULTS", line):
            resultsim = re.findall(r'(\d+)', line)
        else:
            print(f"{line}")
    if not resultsim:
        print("Error: failed to parse results from ./test-csim. See output above.")
        sys.exit(1)
    csim_cscore_origin = int(resultsim[0])
    csim_cscore = csim_cscore_origin * 40 / 27
    print("part A final points: %d * (40 / 27) = %8.1f\n" % (csim_cscore_origin, csim_cscore))

    # Check the correctness and performance of the transpose function
    # 48x48 transpose
    print("Part B: Testing transpose function")
    print("Running ./test-trans -M 48 -N 48")
    p = subprocess.Popen("./test-trans -M 48 -N 48 | grep TEST_TRANS_RESULTS", 
                         shell=True, stdout=subprocess.PIPE, text=True)
    stdout_data = p.communicate()[0]
    result48 = re.findall(r'(\d+)', stdout_data)
    if len(result48) < 2:
        print("Error: failed to parse 48x48 transpose results. Ensure ./test-trans produced output.")
        sys.exit(1)
    
    # 96x96 transpose
    print("Running ./test-trans -M 96 -N 96")
    p = subprocess.Popen("./test-trans -M 96 -N 96 | grep TEST_TRANS_RESULTS", 
                         shell=True, stdout=subprocess.PIPE, text=True)
    stdout_data = p.communicate()[0]
    result96 = re.findall(r'(\d+)', stdout_data)
    if len(result96) < 2:
        print("Error: failed to parse 96x96 transpose results. Ensure ./test-trans produced output.")
        sys.exit(1)
    
    # 93x99 transpose
    print("Running ./test-trans -M 93 -N 99")
    p = subprocess.Popen("./test-trans -M 93 -N 99 | grep TEST_TRANS_RESULTS", 
                         shell=True, stdout=subprocess.PIPE, text=True)
    stdout_data = p.communicate()[0]
    result93 = re.findall(r'(\d+)', stdout_data)
    if len(result93) < 2:
        print("Error: failed to parse 93x99 transpose results. Ensure ./test-trans produced output.")
        sys.exit(1)

    print("Running honor-part")
    p = subprocess.Popen(f"(cd honor-part && ./test-mul -M 32 -N 32 | grep TEST_MUL_RESULTS)", 
                         shell=True, stdout=subprocess.PIPE, text=True)
    stdout_data = p.communicate()[0]
    resultmul = re.findall(r'(\d+)', stdout_data)
    if len(resultmul) < 2:
        print("Error: failed to parse honor-part results. Ensure ./honor-part/test-mul produced output.")
        sys.exit(1)

    # Compute the scores for each step
    miss48 = int(result48[1])
    miss96 = int(result96[1])
    miss93 = int(result93[1])
    mul_correct = int(resultmul[0])
    missmul = int(resultmul[1]) if mul_correct else 2**31 - 1
    trans48_score = computeMissScore(miss48, 500, 800, maxscore['trans48']) * int(result48[0])
    if miss48 < 450:
        trans48_score += honorpart[0]
    trans96_score = computeMissScore(miss96, 2200, 3000, maxscore['trans96']) * int(result96[0])
    if miss96 < 1900:
        trans96_score += honorpart[1]
    trans93_score = computeMissScore(miss93, 3000, 4000, maxscore['trans93']) * int(result93[0])
    transmul_score = 0
    if mul_correct and missmul < 4000:
        transmul_score += honorpart[2]

    total_score = csim_cscore + trans48_score + trans96_score + trans93_score + transmul_score

    # Summarize the results
    print("\nCache Lab summary:")
    print("%-22s%8s%10s%12s" % ("", "Points", "Max pts", "Misses"))
    print("%-22s%8.1f%10d" % ("Csim correctness", csim_cscore, 
                              maxscore['csim']))

    misses = str(miss48)
    if miss48 == 2**31-1 :
        misses = "invalid"
    print("%-22s%8.1f%10d%12s" % ("Trans perf 48x48", trans48_score, 
                                  maxscore['trans48'] + honorpart[0], misses))

    misses = str(miss96)
    if miss96 == 2**31-1 :
        misses = "invalid"
    print("%-22s%8.1f%10d%12s" % ("Trans perf 96x96", trans96_score, 
                                  maxscore['trans96'] + honorpart[1], misses))

    misses = str(miss93)
    if miss93 == 2**31-1 :
        misses = "invalid"
    print("%-22s%8.1f%10d%12s" % ("Trans perf 93x99", trans93_score, 
                                  maxscore['trans93'], misses))

    misses = str(missmul)
    if missmul == 2**31-1 :
        misses = "invalid"
    print("%-22s%8.1f%10d%12s" % ("Trans perf honor-part", transmul_score, 
                                  honorpart[2], misses))

    print("%22s%8.1f%10d" % ("Total points", total_score,
                             maxscore['csim'] + 
                             maxscore['trans48'] + 
                             maxscore['trans96'] +
                             maxscore['trans93'] +
                             honorpart[0] + honorpart[1] + honorpart[2]))
    
    # Emit autoresult string for Autolab if called with -A option
    if autograde:
        autoresult="%.1f:%d:%d:%d" % (total_score, miss48, miss96, miss93)
        print("\nAUTORESULT_STRING=%s" % autoresult)
    
    
# execute main only if called as a script
if __name__ == "__main__":
    main()
