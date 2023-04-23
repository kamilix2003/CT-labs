import numpy as np
import cmath as cm

f=1e3
w=2*3.14*f
Zr=1e3
Zc1=1/complex(0,-((47e-9)*w))
Zc2=1/complex(0,-((100e-9)*w))
Zc3=1/complex(0,-((100e-9)*w))
Zl=complex(0,(10e-3)*w)
V = 1.117

G2 = 2/Zr + 1/Zc1
G3 = 1/Zc1 + 1/Zc2 + 1/Zl
G4 = 1/Zc3 + 1/Zl + 1/Zr
G23 = -1/Zc1
G24 = -1/Zr
G34 = -1/Zl

# Ga = complex(0.002, 2.963e-4)
# Gb = complex(0.001, 0.01654)
# Gab = 1/1000

I1 = 0
I2 = V / (Zc2)
I3 = 0
G = np.array([[G2, G23, G24],
              [G23, G3, G34],
              [G24, G34, G4]])
I = np.array([[I1],
              [I2],
              [I3]])

print('G: \n', G)
print('invG: \n', np.linalg.inv(G))
print('I: \n', I)

V = np.matmul(np.linalg.inv(G), I)

print('V: \n', V)
print('V: \n', np.abs(V))