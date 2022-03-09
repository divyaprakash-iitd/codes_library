import numpy as np
import matplotlib.pyplot as plt
from matplotlib import rcParams
from matplotlib.colors import LogNorm

T   = np.array([10,30])
dx  = 0.01
dt  = np.array([0.01,0.05,0.1])
nud = 0.0001
x   = np.arange(0,1+dx,dx)


def w_an(nud,X,t):
    w = np.zeros(X.shape)
    i = 0
    for ix in range(X.size):
        s = 0
        for nn in range(1,1000):
            s = s + np.sin(np.pi*nn/2.0)*np.sin(np.pi*nn*X[ix])*np.exp(-(np.pi**2)*(nn*nn)*nud*t)
            # print(n)
        w[i] = 2*s
        i = i + 1
    return w

# Solve using finite difference
ufd = np.zeros(x.shape)


for iT in range(T.size):
    plt.figure(iT)
    for idt in dt:
        # Boundary conditions
        ufd = w_an(nud,x,0)
        ufd[0]  = 0
        ufd[-1] = 0
        tspan = np.arange(0,T[iT]+idt,idt)
        for it in range(tspan.size):
            utemp = ufd
            for i in range(1,x.size-1):
                utemp[i] = ufd[i] + nud*idt/dx**2*(ufd[i-1]-2*ufd[i]+ufd[i+1])
            ufd = utemp
        plt.plot(x,ufd,label='dt = ' + str(idt))
    # Analytical solution
    w = w_an(nud,x,T[iT])
    plt.plot(x,w,label="Analytical")
    plt.legend()
    plt.title("t = " + str(T[iT]))
plt.show()