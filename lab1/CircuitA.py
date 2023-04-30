import numpy as np
from tabulate import tabulate

def get_V(f):
    w=2*np.pi*f
    Zr=1e3 #Zr1 == Zr2
    Zc1=1/(complex(0,100e-9)*w)
    Zc2=1/(complex(0,47e-9)*w)
    Zc3=1/(complex(0,22e-9)*w)
    Zl=complex(0,10e-3)*w
    V = 0.192
    G1 = 1/Zc2 + 1/(Zc1+Zr)
    G3 = 1/Zr + 1/Zc2 + 1/Zl
    G4 = 1/Zc3 + 1/(Zc1+Zr) + 1/Zr
    G13 = -1/Zc2
    G14 = -1/(Zr+Zc1)
    G34 = -1/Zr
    I1 = - V/(Zr+Zc1) - V/Zc2
    I3 = V/Zc2
    I4 = V/(Zr+Zc1)
    G = np.array([[G1, G13, G14],
                [G13, G3, G34],
                [G14, G34, G4]])
    I = np.array([[I1],
                [I3],
                [I4]])
    V = np.matmul(np.linalg.inv(G), I)
    VP = np.angle(V, True)
    VA = np.abs(V)
    IC12 = (V[0]-V[1])/Zc2
    VA = np.append(VA, np.abs(IC12))
    VP = np.append(VP, np.angle(IC12))
    headers = [str(f)+' Hz' , 'Magnitude', 'Phase']
    first_col = ['Node 2', 'Node 3', 'Node 4', 'I of C_12']
    table1 = np.column_stack((first_col, VA, VP))
    print(tabulate(table1, headers=headers, tablefmt="simple"))

get_V(1e3)
get_V(5e3)
get_V(9e3)


