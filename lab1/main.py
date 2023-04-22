import numpy as np
import cmath as cm

f = 1000
Zc11 = 1/complex(0, f*100e-9)
Zc12 = 1/complex(0, f*47e-9)
Zc13 = 1/complex(0, f*22e-9)
Zr11 = complex(1e3)
Zr12 = complex(1e3)
Zl11 = complex(0, f*10e-3)

v = 1.17

G = np.array([[1/Zc11 + 1/Zr11 + 1/Zc13, -1/Zr12],
              [-1/Zr12, 1/Zc12 + 1/Zl11]])
I = np.array([[v/(Zr11+Zc11)],
              [v/Zc12]])

U = np.matmul(np.linalg.inv(G), I)

Um = np.sqrt(pow(np.real(U), 2) + pow(np.imag(U), 2))

print('I: \n',I)
print('G: \n',G)
print('U: \n',U)
print('|U|: \n', Um)
