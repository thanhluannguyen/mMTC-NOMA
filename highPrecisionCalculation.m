digits(16); % This is the Default Precision
meijerG(1-2/3.67,[],[1,0],-2/3.67,5000) % -6.6516e+05 (WRONG)
digits(32); % Increasing Precision up to 32 digits
double(vpa(meijerG(1-2/3.67,[],[1,0],-2/3.67,sym(5000)))) % 0.0140
% You'll know that it is Exact if the Result with higher Precision is the same
digits(64); % Increasing Precision up to 64 digits
double(vpa(meijerG(1-2/3.67,[],[1,0],-2/3.67,sym(5000)))) % 0.0140