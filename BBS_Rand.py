# File Name : BBS_Rand.py
# Description : BBS random generator
# Author : Ganyuan Cao

import random
import math

# check if p is blum prime
def blumprime(p):
    if p % 4 == 3:
        return 1
    else:
        return 0

# determine prime p,q
# To have larger prime, adjust numBits
def findPrime(numBits=8):
    candidate = 1

    # check if candidate is a blum prime
    flag = blumprime(candidate)

    # Iterative to find a blum prime with specific digits
    while flag != 1:
        candidate = random.getrandbits(numBits)
        flag = blumprime(candidate)
    
    return candidate

## parity of x_i 
def parity(x):
    if x % 2 == 0:
        return 0
    else:
        return 1

# define the algorithm
def bbsAlgorithm(limit):

    # n = pq where p,q are primes
    p = findPrime()
    q = findPrime()
    n = p * q
    print "n = pq =", p, "*", q, "=", n

    # choose a seed s between (1, n-1)
    s = random.randrange(1, n-1)
    print "The random seed s =", s

    # initialize the sequence with z_0 which is the parity of x_0
    x_0 = s * s % n
    z_0 = parity(x_0)
    print "i = 0", ", x_i =", x_0, ", z_i =", z_0 

    # initialize the resulting sequence
    rlt_seq = [z_0] 

    # Initialize the result, then keep adding z_i * 2^i to result
    result = z_0

    tmp = x_0    
    
    # begin iterating to obtain the sequence z_1, z_2, z_3 ....
    for i in range(1, limit):

        x_i = tmp * tmp % n 
        z_i = parity(x_i)

        print "i =", i, ", x_i =", x_i, ", z_i =", z_i
        
        tmp = x_i
        
        expo = int(math.pow(2,i))
        result = result + z_i * expo
        
        tmp_seq = [z_i]
        rlt_seq = rlt_seq + tmp_seq

    rlt_seq.reverse()
    print "The resulting sequence is: ", rlt_seq
    return result

def main():
    print "This program illustrates the algorithm of Blum Blum Shub pseudorandom number generator"
    print "--------------------------------------------------------------------------------------"
    print "This program will prompt you to enter a round number i.e., the digit of the binary sequence to be generated"
    print "------------------------------------------------------------------------------------------------------"
    lim = input("Enter the round number: ")
    num = bbsAlgorithm(lim)
    print "Generated random integer is:", num

if __name__ == "__main__":
    main()
