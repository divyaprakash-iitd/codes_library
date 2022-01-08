import sympy
from sympy.abc import x, y

def cylinder_stream_function(U=1, R=1, C =1 ):
    r = sympy.sqrt(x**2 + y**2)
    theta = sympy.atan2(y, x)
    return U * (r - R**2 / r) * sympy.sin(theta)  + (-C / 2 /sympy.pi * sympy.log(r))

def rankine_half_body_stream_function(U=1, Q=0.8):
    r = sympy.sqrt(x**2 + y**2)
    theta = sympy.atan2(y, x)
    return U * r * sympy.sin(theta) + Q / 2 / sympy.pi * theta

def rankine_2D_body_stream_function(U,Q,a):
    r = sympy.sqrt(x**2 + y**2)
    theta = sympy.atan2(y, x)
    theta1 = sympy.atan2(y, (x+a))
    theta2 = sympy.atan2(y, (x-a))
    return U * r * sympy.sin(theta) + Q / 2 / sympy.pi * (theta1 - theta2)

def velocity_field(psi):
    u = sympy.lambdify((x, y), psi.diff(y), 'numpy')
    v = sympy.lambdify((x, y), -psi.diff(x), 'numpy')
    return u, v

import numpy as np

def plot_streamlines(ax, u, v, xlim=(-1, 1), ylim=(-1, 1)):
    x0, x1 = xlim
    y0, y1 = ylim
    Y, X =  np.ogrid[y0:y1:100j, x0:x1:100j]
    ax.streamplot(X, Y, u(X, Y), v(X, Y), color='cornflowerblue')

def format_axes(ax):
    ax.set_aspect('equal')
    ax.figure.subplots_adjust(bottom=0, top=1, left=0, right=1)
    ax.xaxis.set_ticks([])
    ax.yaxis.set_ticks([])

import matplotlib.pyplot as plt
import numpy as np

U = 1
R = 0.1
C = 4*np.pi*R*U
cval = np.array([0, C, 2*C, 0.5*C])
for i in cval:
    psi = cylinder_stream_function(U,R,i)
    u, v = velocity_field(psi)
    xlim = ylim = (-0.5, 0.5)
    fig, ax = plt.subplots(figsize=(4, 4))
    plot_streamlines(ax, u, v, xlim, ylim)
    format_axes(ax)

# 2D Rankine Body
psi = rankine_2D_body_stream_function(U=1, Q=1.1166, a=0.8380)
u, v = velocity_field(psi)
xlim = (-2, 2)
ylim = (-1.5, 1.5)
fig, ax = plt.subplots(figsize=(4, 4))
plot_streamlines(ax, u, v, xlim, ylim)
format_axes(ax)
plt.show()
