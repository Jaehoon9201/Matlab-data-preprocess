clear;clc;
%%

data = csvread('Wave_example.csv',1,1);
x=data(:,1);


positiveFFT(x,length(x));

Magnitude=(abs(ans))';
Order=0:1:length(Magnitude)-1;

bar(Order, Magnitude);
ylim([0 2.5]);
xlim([0 10]);


grid on;
xlabel('Harmonic Order','FontSize',15);
ylabel('Mag','FontSize',15);
set(gca,'FontSize',15);
grid on;
% ratio2rd = Magnitude(1,3)/Magnitude(1,2) *100