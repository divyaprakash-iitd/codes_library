# Description: Plots two functions
import numpy as np

def neutronenergy(En):
    return 0.30033*np.exp(-0.976*En)*np.sinh(2.926*En)**0.5

def gammarayenergy(Ey):
    return (Ey <= 1.5)*(375*Ey**2*np.exp(-9.174*Ey) + 0.468*np.exp(-0.686*Ey)) + (Ey>1.5)*np.exp(-1.175*Ey)

import matplotlib.pyplot as plt

En = np.linspace(0,100,100)
Ey = np.linspace(0,100,100)

plt.plot(En,neutronenergy(En))
plt.xlabel('En [MeV]')
plt.ylabel('N(En)')
plt.show()

plt.plot(Ey,gammarayenergy(Ey))
plt.xlabel('Ey [MeV]')
plt.ylabel('N(Ey)')
plt.show()
