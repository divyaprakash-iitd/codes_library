import numpy as np
from scipy import interpolate

t = np.array([0,10,15,20,22.5,30])
v = np.array([0,227.04,362.78,517.35,602.97,901.67])

fun = interpolate.interp1d(t,v)

tq = 16 # Query point
print('The velocity at {:3} seconds id {:.4} m/s'.format(tq,fun(tq)))
