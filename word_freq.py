import re

f = open('textfile.txt', 'r', encoding='utf-8')

t = f.readlines()
t = list(map(lambda s: s.strip(), t))

text = " ".join(t)

print(text)

f.close()