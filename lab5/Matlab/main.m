clear all; close all; clc;

%% theoretical calculations
% circuit 2
R21 = 1.1e3;
R22 = 4.7e3;
C21 = 10e-9;
w21 = 7e3;
w22 = 13e3;
Y = [[1/R21 + j*w21*C21, j*w21*C21];
     [-j*w21*C21, 1/R21 + j*w21*C21]]
Z = Y_to_Z(Y)
A = Z_to_chain(Z)

% circuit 3
R31 = 1.1e3;
C31 = 10e-9;
w31 = 13e3;
w32 = 15e3;


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