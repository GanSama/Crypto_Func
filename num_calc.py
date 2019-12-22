# File Name : num_calc.py
# Description : implement some number  theory functions 
# Author : Ganyuan Cao

# gcd (Greateest Common Divisor)
def gcd(a, b): 
    if a == 0: 
        return b 
    return gcd(b % a, a) 

# Euler's totient function
def eulerphi(n):
    result = 0
    for i in range(1,n):
        if gcd(a,n) == 1:
            result = result + 1
    return result


# modular inverse (iterative search)
def modInv_iter(a,n):
    
    # mod inverse exist iff gcd = 1
    if gcd(a,n) != 1:
        print "Modular Inverse DNE"
        return

    # a mod n
    a = a % n
    
    # perform iterative test to find the modular inverse 
    for x in range(1, n) : 
        if (a * x) % n == 1 : 
            return x 
    return 1

# modular inverse (Extended Euclidean)
def modInv_ExEuclid(a,n):

    # mod inverse exist iff gcd = 1
    if gcd(a,n) != 1:
        print "Modular Inverse DNE"
        return
    
    n0 = n
    y = 0
    x = 1

    # trivial case...
    if m == 1:
        return 0

    while a > 1: 

        #obtain the quotient q
        q = a // n
        tmp = n

        #update m for euclidean algorithm
        n = a % n
        a = tmp
        tmp = y

        # update x & y
        y = x - q * y
        x = tmp

    # change x to positive value 
    if x < 0:
        x = x+ n0
    
    return x

# main() here
def main():
    result = gcd(10,5)
    print result

if __name__ == "__main__":
    main()