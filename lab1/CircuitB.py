import numpy as np
import cmath as cm

f=1e3 #f=1e3 f=5e3 f=9e3
w=2*3.14*f
Zr=1e3
Zc1=1/complex(0,((47e-9)*w))
Zc2=1/complex(0,((100e-9)*w))
Zc3=1/complex(0,((100e-9)*w))
Zl=complex(0,(10e-3)*w)
V = 0.192

G2 = 2/Zr + 1/Zc1
G3 = 1/Zc1 + 1/Zc2 + 1/Zl
G4 = 1/Zc3 + 1/Zl + 1/Zr
G23 = -1/Zc1
G24 = -1/Zr
G34 = -1/Zl

I1 = 0
I2 = V / (Zc2)
I3 = 0
G = np.array([[G2, G23, G24],
              [G23, G3, G34],
              [G24, G34, G4]])
I = np.array([[I1],
              [I2],
              [I3]])

V = np.matmul(np.linalg.inv(G), I)

print('V: \n', V)
print('phase: \n', np.angle(V, True))
print('|V|: \n', np.abs(V))