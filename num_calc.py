# File Name : num_calc.py
# Description : implement some number  theory functions 
# Author : Ganyuan Cao

# gcd
def gcd(a, b): 
    if (a == 0): 
        return b 
    return gcd(b % a, a) 

# Euler's totient function


# modular inverse (iterative search)

def modInv_iter(a,n):
    a = a%n
    for x in range(1, m) : 
        if ((a * x) % m == 1) : 
            return x 
    return 1

# modular inverse (Extended Euclidean)

def modInv_Euclid(a,n):
