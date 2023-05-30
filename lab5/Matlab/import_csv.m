function [Z] = import_csv(file)
CSV = readtable(file);
deg = table2array(CSV(:,4));
deg = reshape(deg, [2, 2])';
Z = table2array(CSV(:, 7));
Z = reshape(Z, [2, 2])';
% Z = Z .* (cos(deg) + 1i * sin(deg));

% UR = table2array(CSV(:,3));
% Uin = table2array(CSV(:,2));
% deg = table2array(CSV(:,4));
% rs21 = table2array(CSV(:,6));
% for k = [1:4]
%     I = UR(k)/rs21(k);
%     Z = Uin(k)/I

end