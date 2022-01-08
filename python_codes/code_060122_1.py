import numpy as np

def f(x):
    return np.log(np.sin(x)+1)

h = np.pi/4

sum = h * f(np.pi/8)
sum = sum + h*f(np.pi * 3/8)

print(round(sum,3))
