# File Name : shift_cipher.py
# Description : implement functions related to shift_cipher
# Author : Ganyuan Cao


# encrypt function
def encrypt(key, plain):
    plain = plain.lower()
    cipher = "The ciphertext is: "
    for i in range(0, len(plain)):
        ci = (ord(plain[i]) - 97 + key) % 26
        cc = chr(ci + 97 )
        cipher = cipher + cc
    return cipher.upper()  

# encrypt function
def decrypt(key, cipher):
    cipher = cipher.lower()
    plain = "The plaintext is: "
    for i in range(0, len(plain)):
        pi = (ord(cipher[i]) - 97 - key) % 26
        pc = chr(pi + 97 )
        plain = plain + pc
    return plain

# brute force 
def brute(cipher):
    cipher = cipher.lower()
    for key in range(0,26):
        plain = "The plaintext could be: "
        for i in range(0, len(cipher)):
            pi = (ord(cipher[i]) - 97 - key) % 26
            pc = chr(pi + 97 )
            plain = plain + pc
        print plain + '\n'

# main
def main():
    
    # call function as you need 
    cipher = "ZNKIGKYGXIOVNKXOYGXKGRREURJIOVNKXCNOINOYXKGRRECKGQOSTUZYAXKNUCURJHKIGAYKOSZUURGFEZURUUQGZZNKCOQOVGMKGZZNKSUSKTZHAZOLOMAXKOZYMUZZUHKGZRKGYZROQKLOLZEEKGXYURJUXCNGZKBKXBGPJADLIVBAYKZNUYKRGYZZKTINGXGIZKXYGYZNKYURAZOUT"
    brute(cipher)

if __name__ == "__main__":
    main()



