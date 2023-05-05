import numpy as np
from tabulate import tabulate

def get_V(f):
    w=2*np.pi*f
    Zr=1e3 #Zr1 == Zr2
    Zc1=1/(complex(0,100e-9)*w)
    Zc2=1/(complex(0,47e-9)*w)
    Zc3=1/(complex(0,22e-9)*w)
    Zl=complex(0,10e-3)*w
    VS = 0.192
    G3 = 1/Zr + 1/Zc2 + 1/Zl
    G4 = 1/Zc3 + 1/(Zc1+Zr) + 1/Zr
    G34 = -1/Zr
    I3 = VS/Zc2
    I4 = VS/(Zr+Zc1)
    G = np.array([[G3, G34],
                [G34, G4]])
    I = np.array([[I3],
                [I4]])
    V = np.matmul(np.linalg.inv(G), I)
    VP = np.angle(V, True)
    VA = np.abs(V)
    # V2 = ((VS-V[1])*Zc1)/(Zr + Zc1)
    IC12 = (VS - V[0])/Zc2
    # VA = np.insert(VA, 0,np.abs(V2), axis=0)
    # VP = np.insert(VP, 0,np.angle(V2,True), axis=0)
    VA = np.append(VA, np.abs(IC12))
    VP = np.append(VP, np.angle(IC12,True))
    headers = [str(f)+' Hz' , 'Magnitude', 'Phase']
    first_col = ['Node 3', 'Node 4', 'I of C_12']
    table1 = np.column_stack((first_col, VA, VP))
    print(tabulate(table1, headers=headers, tablefmt="latex"))
    # print (VA,'\n', VP)

get_V(1e3)
get_V(5e3)
get_V(9e3)


