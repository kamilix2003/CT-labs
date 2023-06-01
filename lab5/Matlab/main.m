clear all; close all; clc;

%% theoretical calculations
% circuit 2
R21 = 1.1e3;
R22 = 4.7e3;
C21 = 10e-9;
w21 = 2*pi*7e3;
w22 = 2*pi*13e3;
% 7kHz
tY2_7 = abs([[1/R21 + 1j*w21*C21, 1j*w21*C21];
     [-1j*w21*C21, 1/R22 + 1j*w21*C21]]);
tZ2_7 = abs(Y_to_Z(tY2_7));
tA2_7 = abs(Z_to_chain(tZ2_7));
% 13kHz
tY2_13 = [[1/R21 + 1j*w22*C21, 1j*w22*C21];
     [-1j*w22*C21, 1/R22 + 1j*w22*C21]];
tY2_13 = abs(tY2_13);
tZ2_13 = abs(Y_to_Z(tY2_13));
tA2_13 = abs(Z_to_chain(tZ2_13));

% circuit 3
R3 = 1.1e3;
C3 = 10e-9;
w31 = 2*pi*13e3;
w32 = 2*pi*15e3;
% 13kHz
tZ3_13 = abs([[1/(1j*w31*C3) + R3, R3];
     [R3, 1/(1j*w31*C3) + R3]]);
tY3_13 = abs(Z_to_admittance(tZ3_13));
tA3_13 = abs(Z_to_chain(tZ3_13));
% 15kHz
tZ3_15 = abs([[1/(1j*w32*C3) + R3, R3];
     [R3, 1/(1j*w32*C3) + R3]]);
tY3_15 = abs(Z_to_admittance(tZ3_15));
tA3_15 = abs(Z_to_chain(tZ3_15));

%chain connection
tA_chain = abs(tA2_13 * tA3_13);
tZ_chain = abs(chain_to_Z(tA_chain));
tY_chain = abs(Z_to_admittance(tZ_chain));

%% circuit 2 
% 7kHz
Z2_7 = abs(import_csv('csv/C2_7.csv'));
Y2_7 = abs(Z_to_admittance(Z2_7));
chain2_7 = abs(Z_to_chain(Z2_7));
% 13kHz
Z2_13 = abs(import_csv('csv/C2_13.csv'));
Y2_13 = abs(Z_to_admittance(Z2_13));
chain2_13 = abs(Z_to_chain(Z2_13));

%% circuit 3
% 13kHz
Z3_13 = abs(import_csv('csv/C3_13.csv'));
Y3_13 = abs(Z_to_admittance(Z3_13));
chain3_13 = abs(Z_to_chain(Z3_13));
% 15kHz
Z3_15 = abs(import_csv('csv/C3_15.csv'));
Y3_15 = abs(Z_to_admittance(Z3_15));
chain3_15 = abs(Z_to_chain(Z3_15));

%% chain circuit 2-3 13kHz
% measured chain configuration
Z23_13 = abs(import_csv('csv/23_13.csv'));
Y23_13 = abs(Z_to_admittance(Z23_13));
measured_chain23_13 = abs(Z_to_chain(Z23_13));
% calculated from matrix multiplication
calculated_chain23_13 = chain2_13 * chain3_13;