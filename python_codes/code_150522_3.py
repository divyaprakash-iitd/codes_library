import numpy as np

def get_vg_Affandi(T):
    a = -7.75883
    b = 3.23753
    c = 2.05755
    d = -0.06052
    e = 0.00529

    T = T + 273.15
    vg = a + b*((1/Tr))^(0.4) + c/Tr^2 + d/Tr^4 + e/Tr^5
    vg = np.exp(vg)

	return vg
