n=int(input("enter : "))
for r in range(0,n+1):
    for s in range(0,n-r):
        print("s")
    for c in range(0,2*r-1):
        print("*")
