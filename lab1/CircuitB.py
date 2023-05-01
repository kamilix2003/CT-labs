import numpy as np
from tabulate import tabulate

def get_V(f):
    w=2*np.pi*f
    Zr=1e3
    Zc1=1/(complex(0,47e-9)*w)
    Zc2=1/(complex(0,100e-9)*w)
    Zc3=1/(complex(0,100e-9)*w)
    Zl=complex(0,10e-3)*w
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
    VP = np.angle(V, True)
    VA = np.abs(V)
    IR22 = (V[0]-V[2])/Zr
    VA = np.append(VA, np.abs(IR22))
    VP = np.append(VP, np.angle(IR22))
    headers = [str(f)+' Hz', 'Magnitude', 'Phase']
    first_col = ['Node 2', 'Node 3', 'Node 4', 'I of R_22']
    table1 = np.column_stack((first_col, VA, VP))
    print(tabulate(table1, headers=headers,tablefmt='latex'))
    return(V, VA, VP)

(V1, VA1, VP1)=get_V(1e3)
(V5, VA5, VP5)=get_V(5e3)
(V9, VA9, VP9)=get_V(9e3)

