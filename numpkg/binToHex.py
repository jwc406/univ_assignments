#!/usr/bin/python3
# bin-to-hex conversion

def b2h():
        num = input("input bin number : ")
        num = hex(int(num,2))
        print("hexa number:", num)

if __name__ == '__main__':
        b2h()
