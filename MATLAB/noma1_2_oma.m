all clear;
clc;
clf;
d1 = 15;
d2 = 30;
a = 3;
thres = 5;
% �ֱ���ú���NOMA1_outage��NOMA2_outage��OMA_outage������Ӧ���������С�жϸ���
% �����ʷ���
x_axis = zeros(1,40);
out_noma_1 = zeros(1,40);
out_noma_2 = zeros(1,40);
out_oma = zeros(1,40);
for loop = 51:90
    %������
    x_axis(loop-50) = loop;
    sigma= 10^(-loop/10);  %����������Ϊ51dB��90dB
    [outage1,~] = NOMA1_outage(sigma,d1,d2,a,thres);
    [outage2,~] = NOMA2_outage(sigma,d1,d2,a,thres);
    [outage_oma,~] = find_oma_min_outage(sigma,d1,d2,a,thres);
%     position = 2/3*ones(4,1);
%     outage_oma = OMA_outage(sigma,d1,d2,a,thres,position);
    out_oma(loop-50) = outage_oma;
    out_noma_1(loop-50) = outage1;
    out_noma_2(loop-50) = outage2;
end
semilogy(x_axis,out_noma_1,'b'),hold on;
semilogy(x_axis,out_noma_2,'r');
semilogy(x_axis,out_oma,'c');
legend('NOMA1','NOMA2','OMA');
ylabel('Outage probability');
xlabel('SNR');
    