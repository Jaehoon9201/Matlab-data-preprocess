%%
clear;clc;

data = csvread('C3VI00001.csv',1);
single_prd = 1/60 * 200000; % sec
timeidx_start = 200; % start index
timeidx_end = timeidx_start+ floor(single_prd) ; % end index. 

x2=data(timeidx_start:timeidx_end,1);
x=data(timeidx_start:timeidx_end,2);

positiveFFT(x,length(x2));

Magnitude=(abs(ans))';
Order=0:1:length(Magnitude)-1;

bar(Order, Magnitude);
% ylim([0 100]);
xlim([0 16]);


grid on;
xlabel('Harmonic Order','FontSize',15);
ylabel('Mag','FontSize',15);
set(gca,'FontSize',15);
grid on;

% 기본파 대비 3고조파 비율 계산 예제
ratio3rd = Magnitude(1,4)/Magnitude(1,2) *100

