import numpy as np

def greatcircledistance(lamda1,phi1,lamda2,phi2):
    r = 6371
    delL = np.abs(lamda1 - lamda2)
    delP = np.abs(phi1 - phi2)
    num = np.sqrt(((np.cos(phi2)*np.sin(delL))**2 + (np.cos(phi1)*np.sin(phi2) - np.sin(phi1)*np.cos(phi2)*np.cos(delL))**2))
    den = (np.sin(phi1)*np.sin(phi2) + np.cos(phi1)*np.cos(phi2)*np.cos(delL))
    delS = np.arctan(num/den)
    return r*delS


r = greatcircledistance(45,-75,38,-77)
print(r)