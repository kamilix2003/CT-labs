import numpy as np
import cmath as cm

f=1e3
w=2*3.14*f
Zr=1e3
Zc1=1/complex(0,-((100e-9)*w))
Zc2=1/complex(0,-((47e-9)*w))
Zc3=1/complex(0,-((22e-9)*w))
Zl=complex(0,(10e-3)*w)
V = 1.117

G1 = 1/Zc2 + 1/(Zc1+Zr)
G3 = 1/Zr + 1/Zc2 + 1/Zl
G4 = 1/Zc3 + 1/(Zc1+Zr)
G13 = -1/Zc1
G14 = -1/(Zr+Zc1)
G34 = -1/Zr
I1 = -V/Zr - V/(Zr+Zc1)
I2 = V/(Zc2)
I3 = V/(Zr+Zc1)
# I1 = V/50
# I2 = 0
# I3 = 0
G = np.array([[G1, G13, G14],
              [G13, G3, G34],
              [G14, G34, G4]])
I = np.array([[I1],
              [I2],
              [I3]])

V = np.matmul(np.linalg.inv(G), I)

print('V: \n', V)
print('|V|: \n', np.abs(V))