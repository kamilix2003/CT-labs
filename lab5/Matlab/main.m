clear all; close all; clc;

%% theoretical calculations
% circuit 2
R21 = 1.1e3;
R22 = 4.7e3;
C21 = 10e-9;
w21 = 2*pi*7e3;
w22 = 2*pi*13e3;
% 7kHz
Y2_7 = [[1/R21 + 1j*w21*C21, 1j*w21*C21];
     [-1j*w21*C21, 1/R22 + 1j*w21*C21]];
Z2_7 = Y_to_Z(Y2_7);
A2_7 = Z_to_chain(Z2_7);
% 13kHz
Y2_13 = [[1/R21 + 1j*w22*C21, 1j*w22*C21];
     [-1j*w22*C21, 1/R22 + 1j*w22*C21]];
Z2_13 = Y_to_Z(Y2_13);
A2_13 = Z_to_chain(Z2_13);

% circuit 3
R3 = 1.1e3;
C3 = 10e-9;
w31 = 2*pi*13e3;
w32 = 2*pi*15e3;
% 13kHz
Z3_13 = [[1/(1j*w31*C3) + R3, R3];
     [R3, 1/(1j*w31*C3) + R3]];
Y3_13 = Z_to_admittance(Z3_13);
A3_13 = Z_to_chain(Z3_13);
% 15kHz
Z3_15 = [[1/(1j*w32*C3) + R3, R3];
     [R3, 1/(1j*w32*C3) + R3]];
Y3_15 = Z_to_admittance(Z3_15);
A3_15 = Z_to_chain(Z3_15);

%chain connection
A_chain = A2_13 * A3_13;
Z_chain = chain_to_Z(A_chain);
Y_chain = Z_to_admittance(Z_chain);

%% circuit 2 
% 7kHz
Z2_7 = import_csv('csv/C2_7.csv');
Y2_7 = Z_to_admittance(Z2_7);
chain2_7 = Z_to_chain(Z2_7);
% 13kHz
Z2_13 = import_csv('csv/C2_13.csv');
Y2_13 = Z_to_admittance(Z2_13);
chain2_13 = Z_to_chain(Z2_13);

%% circuit 3
% 13kHz
Z3_13 = import_csv('csv/C3_13.csv');
Y3_13 = Z_to_admittance(Z3_13);
chain3_13 = Z_to_chain(Z3_13);
% 15kHz
Z3_15 = import_csv('csv/C3_15.csv');
Y3_15 = Z_to_admittance(Z3_15);
chain3_15 = Z_to_chain(Z3_15);

%% chain circuit 2-3 13kHz
% measured chain configuration
Z23_13 = import_csv('csv/23_13.csv');
Y23_13 = Z_to_admittance(Z23_13);
measured_chain23_13 = Z_to_chain(Z23_13);
% calculated from matrix multiplication
calculated_chain23_13 = chain2_13 * chain3_13;