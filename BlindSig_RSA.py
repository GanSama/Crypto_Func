# File Name : BlindSig_RSA.py
# Description : Illustrate a simple RSA blind signature
# Author : Ganyuan Cao


import random
from num_calc import *

# choose random integer r such that gcd(r,n) = 1
def randomChoice(n):
    while 1:
        r = random.getrandbits(3)
        if gcd(r,n) == 1:
            return r

# sign function
def sign(m,e,d,n):
    print "The original message is:", hex(m)
    r = randomChoice(n)
    m_1 = m * (r ** e) % n
    print "Message manipulated with random r is:", hex(m_1)
    s_1 = (m_1 ** e) % n
    print "The blind signature is:", hex(s_1)
    return s_1, m_1

# verify func
def verify(s,e,n,m):
    print "Message provided by the signer is:", hex(m)
    m_v = (s ** e) % n
    print "Message derived from the signature is:", hex(m_v)
    if m_v == m:
        print "Verified signature"
    else:
        print "Not a valid signature"

def main():
    m = 70113
    n = 93
    e = 41
    d = 41
    
    print "This program illustare a simple RSA blind signature"
    print "---------------------------------------------------"
    print "This program use unrealistically short RSA key. It is just for a demo of blind signature"
    print "---------------------------------------------------------------------------------------"
    sig, m_e = sign(m,e,d,n)
    verify(sig, e, n, m_e)


if __name__ == "__main__":
    main()