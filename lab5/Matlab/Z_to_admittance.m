function [Y] = Z_to_admittance(Z)
det_Z = det(Z);
Y = [[Z(2, 2)/det_Z, -Z(1, 2)/det_Z];
     [-Z(2, 1)/det_Z, Z(1, 1)/det_Z]];
end