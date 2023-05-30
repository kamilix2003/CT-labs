function [Z] = chain_to_Z(A)
det_A = det(A);
Z = [[A(1, 1)/A(2, 1), det_A/A(2, 1)];
         [1/A(2, 1), A(2, 2)/A(2, 1)]];
end

