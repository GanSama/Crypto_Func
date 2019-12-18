# File Name : bbsGen.py
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
    n = findPrime() * findPrime()
    print "n = pq =", n

    # choose a seed s between (1, n-1)
    s = random.randrange(1, n-1)
    print "seed s =", s

    # initialize the sequence with z_0 which is the parity of x_0
    x0 = s * s % n
    z0 = parity(x0)

    # start printing the sequence
    print "The sequence is:", z0,  

    # Initialize the result, then keep adding z_i * 2^i to result
    result = z0

    tmp = x0    
    
    # begin iterating to obtain the sequence z_1, z_2, z_3 ....
    for i in range(1, limit):
        x_i = tmp * tmp % n 
        if x_i % 2 == 0:
            z_i = 0
        else:
            z_i = 1
        tmp = x_i
        expo = int(math.pow(2,i))
        result = result + z_i * expo
        print z_i,
    
    print ""
    
    return result

def main():
    lim = input("Enter the round number: ")
    num = bbsAlgorithm(lim)
    print "Generated random integer is:", num

if __name__ == "__main__":
    main()
