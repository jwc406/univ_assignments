import re

f = open('textfile.txt', 'r', encoding='utf-8')

text = f.readlines()
text = list(map(lambda s: s.strip(), text))

print(text)

f.close()