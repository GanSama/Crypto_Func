# File Name : LFSR_Rand.py
# Description : implement a simple LFSR random number generator
# Author : Ganyuan Cao

import math

def lfsr_gen(init, tap, n):

    new_lfsr = init
    tap_length = len(tap)
    curr_sum = 0

    exp_length = len(init) + 1


    # iteratively fill the LFSR list
    while exp_length <= n:
        for i in range(0, tap_length):
            curr_sum = curr_sum + tap[i] * new_lfsr[exp_length - (tap_length + 1) + i]

        new_lfsr = new_lfsr + [curr_sum % 2]
        
        curr_sum = 0

        exp_length = exp_length + 1
    
    return new_lfsr


# Convert the sequence to the integer
def convRandom(lfsr_seq):
    num = 0
    for i in range(0, len(lfsr_seq)):
        num = num + lfsr_seq[i] * int(math.pow(2,i))
    return num


# convert the binary to list
def binaryConvert(num):
    l = []
    for i in range(0, len(num)):
        l = l + [int(num[i])]
    return l


def main():

    seed1 = input("Enter seed #1: ")
    seed2 = input("Enter seed #2: ")
    round = input("Enter a round number: ")

    seed1 = '{0:08b}'.format(seed1)
    seed2 = '{0:08b}'.format(seed2)

    init = binaryConvert(seed1)
    tap = binaryConvert(seed2)

    lfsr = lfsr_gen(init,tap, round)
    print "The generated LFSR sequence is: ", lfsr
    numRand = convRandom(lfsr)
    print "The random number derived is: ", numRand

if __name__ == "__main__":
    main()