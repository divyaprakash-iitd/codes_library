# Initial guess
T11 = 0
T21 = 0
T12 = 0
T22 = 0

maxiter = 1000

for i in range(1,maxiter):
    T11 = 1/4*(75+100+T12+T21)
    T21 = 1/4*(75+T11+T22+0)
    T12 = 1/4*(T11+100+25+T22)
    T22 = 1/4*(T21+T12+25+0)

print('T11 = '+ str(T11))
print('T21 = '+ str(T21))
print('T12 = '+ str(T12))
print('T22 = '+ str(T22))
