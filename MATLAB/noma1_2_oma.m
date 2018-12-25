all clear;
clc;
clf;
d1 = 15;
d2 = 30;
a = 3;
thres = 5;
% 分别调用函数find_noma1_min_outage，find_noma2_min_outage和find_oma_min_outage计算相应信噪比下最小中断概率
% 及功率分配
x_axis = zeros(1,40);
out_noma_1 = zeros(1,40);
out_noma_2 = zeros(1,40);
out_oma = zeros(1,40);

% 调用find_noma1_min_asymp计算渐进分析下最小中断概率
out_noma_1_asymp = zeros(1,40);
for loop = 51:90
    %横坐标
    x_axis(loop-50) = loop;
    sigma= 10^(-loop/10);  %发射机信噪比为51dB到90dB
    [outage1,~] = find_noma1_min_outage(sigma,d1,d2,a,thres);
    [outage2,~] = find_noma2_min_outage(sigma,d1,d2,a,thres);
    [outage_oma,~] = find_oma_min_outage(sigma,d1,d2,a,thres);
    [outage_1_asymp,~] = find_noma1_min_asymp(sigma,d1,d2,a,thres);
%     position = 2/3*ones(4,1);
%     outage_oma = OMA_outage(sigma,d1,d2,a,thres,position);
    out_oma(loop-50) = outage_oma;
    out_noma_1(loop-50) = outage1;
    out_noma_2(loop-50) = outage2;
    out_noma_1_asymp(loop-50) = outage_1_asymp;
end
semilogy(x_axis,out_noma_1,'b'),hold on;
semilogy(x_axis,out_noma_2,'r');
semilogy(x_axis,out_oma,'c');
semilogy(x_axis,out_noma_1_asymp,'b--*');
legend('NOMA1','NOMA2','OMA','NOMA1-asymp');
ylabel('Outage probability');
xlabel('SNR');
    