from itertools import count
import re
import collections

f = open('textfile.txt', 'r', encoding='utf-8')

t = f.readlines()
t = list(map(lambda s: s.strip(), t))

text = " ".join(t)

text = re.sub('[-=+,#/\?:^.@*\"※~ㆍ!』‘|\(\)\[\]`\'…》\”\“\’·]', '', text)

words = text.split()

def get_counts(seq):
    counts = {}
    for i in seq:
        if i in counts:
            counts[i] += 1
        else:
            counts[i] = 1
    return counts

counts = get_counts(words)

counts = sorted(counts.items(), key=lambda x:x[1], reverse=True)


for key, value in counts[:5]:
    print(format(key, "5"), str(value).rjust(5))

f.close()