clear;
close all;
clc;

%%

h0 = [1/4; 1/2; 1/4];
h1 = [-1/8; -1/4; 3/4; -1/4; -1/8];
f0 = [-1/8; 1/4; 3/4; 1/4; -1/8];
f1 = [-1/4; 1/2; -1/4];

%%

t = 0.5*(conv(h0,f0) + conv(h1,f1));

[H0, w] = freqz(h0,1);
[H1, w] = freqz(h1,1);
[T, w] = freqz(t,1);

figure(1)
plot(w, abs(H0))
hold on
plot(w, abs(H1))
hold off
grid on
set(gca,'fontname','Times New Roman','FontSize', 13)
title('H0 and H1'); 
legend('H0', 'H1');
xlabel('w'); ylabel('Mag');

figure(2)
plot(w, abs(2*T))
grid on
set(gca,'fontname','Times New Roman','FontSize', 13)
title('2T : For Checking PR'); 
legend('2T');
xlabel('w'); ylabel('Mag');
%%

x = [1, 2, 2, 3, 2, 2, 2, 1, 2, 1, 1, 1, 2, 8, 9, 6, 3, 1, 1, 2, 1, 1, 1, 2, 1, 1]';

A = sum(h0)^2 + sum(h1)^2;
x0 = conv(x,h0);
x1 = conv(x,h1);
% decimation & interpoplation
x0(2:2:end) = 0;
x1(2:2:end) = 0;
y0 = conv(x0,f0);
y1 = conv(x1,f1);
x_hat = 2*(y0 + y1)/A;
delay_m = 3
x_err = sum(abs(x - x_hat(delay_m+1:delay_m+size(x,1))))

figure(3)
plot(1:size(x,1), x)
hold on
plot(1:size(x_hat,1), x_hat)
hold off
grid on
set(gca,'fontname','Times New Roman','FontSize', 13)
title('Test using a Sequence X'); ylim([0 10]);
legend('x', 'x,hat');
xlabel('sequence'); ylabel('x and x hat');

