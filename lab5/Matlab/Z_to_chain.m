function [chain] = Z_to_chain(Z)
det_Z = det(Z);
chain = [[Z(1, 1)/Z(2, 1), det_Z/Z(2, 1)];
         [1/Z(2, 1), Z(2, 2)/Z(2, 1)]];
end