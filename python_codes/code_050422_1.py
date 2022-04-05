import numpy as np

dy1 = lambda y2: y2
dy2 = lambda y1: -y1

h       = 1/5.0
tend    = 1
nt      = int((tend-0)/h + 1)
t       = np.linspace(0,tend,nt)

y10     = 1
y20     = 0
y1      = np.zeros((nt))
y2      = np.zeros((nt))
y1[0]   = y10
y2[0]   = y20

for i in range(0,nt-1):
        y10 = y1[i] + dy1(y2[i]) * h
        y20 = y2[i] + dy2(y1[i]) * h

        y1[i+1] = y1[i] + (dy1(y2[i]) + dy1(y20))/2 * h
        y2[i+1] = y2[i] + (dy2(y1[i]) + dy2(y10))/2 * h

print('y_1')
print(y1.T)
print('y_2')
print(y2.T)

absrelerr = np.abs((np.cos(t[4]) - y1[4]) / np.cos(t[4]))
print('Absolute Relative Error: {:.4f}'.format(absrelerr))