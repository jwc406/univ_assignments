f = open("textfile.txt", "r")
list = f.readlines()

print(list[0])

a = list[0].split()
print(a)

num = int
f.close()