import re

f = open("textfile.txt", "r")
text = f.readlines()

text = re.sub("[-=+,#/\?:^.@*\"※~ㆍ!]", "", '{}'.format(text))

f.close()