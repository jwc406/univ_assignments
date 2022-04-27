def setCal():
    list_1st = list(map(int,input("input the 1st list: ").split()))
    list_2nd = list(map(int,input("input the 2nd list: ").split()))

    set_1st = set(list_1st)
    set_2nd = set(list_2nd)
    
    union = set_1st.union(set_2nd)
    intersection = set_1st.intersection(set_2nd)
        
    print("union:", list(union))
    print("intersection:", list(intersection))
