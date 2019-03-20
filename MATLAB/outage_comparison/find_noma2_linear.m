function [outage,position] = find_noma2_linear(sigma,d1,d2,a,thres)
% sigma = 1/10^6;
% d1 = 15;
% d2 = 30;
% a = 3;
% thres = 5;
fun = @(x)d1^a*thres*sigma/x + d2^a*thres*sigma/(1-x-thres*x);
x0 = 0.1;
Aeq = [];
beq = [];
lb = 0+sigma;
ub = 1/(1+thres)-sigma;
[x,~] = fmincon(fun,x0,[],[],Aeq,beq,lb,ub);
outage = zeros(2,1);
outage(1) = 1 - exp(-1*d1^a*thres*sigma/x);
outage(2) = 1- exp(d2^a*thres*sigma/(thres*x+x-1));
position = x;