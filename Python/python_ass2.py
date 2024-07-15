def addition(*args):
    sum =0
    for i in args:
        sum += i
    print(sum)
addition(2 , 3, 4)

def sbtraction(a , b):
    print(a-b)

sbtraction(34 , 6)

def multiplication(*args):
    ans =1
    for i in args:
        ans = ans*i
    print(ans)
    
multiplication(2 , 3 , 4)

def exponentation(a , b):
    ans =1
    for i in range(0 , b):
        ans = ans*a
    print(ans)

exponentation(4 , 5)

def squareroot(a):
    ans = a**0.5
    print(ans)
    
squareroot(16)