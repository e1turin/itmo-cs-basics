def f(x):
    if(x<=0 or x>183): 
        return x*3+183
    if(x<=183): 
        return 208    

z = -1
y = int("00b8",16)
x = int("00aa",16)
var = f(y+1)+f(x)+1+f(z)-1
print(var)
