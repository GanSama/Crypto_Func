#File Name : bbsGen.py
#Purpose : BBS random generator
#Author : Ganyuan Cao

from randomized.primality import probablyPrime
import random

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
    while not blumprime(candidate):
        candidate = random.getrandbits(numBits)
    return candidate

## parity of x_i 
def parity(x):
    if x % 2 == 0:
        return 0
    else
        return 1

# define the algorithm
def bbsAlgorithm(limit):
    n = findPrime() * findPrime()
    s = random.randrange(1, n-1)
    x0 = s^2 % n
    result = parity(x_0)
    temp = x0 
    for i in range(1, limit):
        x_i = temp^2 % n 
        if x_i % 2 == 0:
            z_i = 0
        else:
            z_i = 1
        result = result + z_i * 2^i
    return result
