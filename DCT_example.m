close all;
clear; clc; 

% org
m=1:1:200;
org = m+50*cos(m*2*pi/10) + 25*sin(m*2*pi/5);

dct_org = dct(org);
plot( dct_org);hold on;

% plot(n, samp)
dct_samp = dct(samp);
plot(scale_factor *dct_samp);grid on;
legend('org', 'dct');

% sampled
n=0:2:200;
samp = n+50*cos(n*2*pi/10) + 25*sin(n*2*pi/5);
% plot(n, samp)
dct_samp = dct(samp);
plot(dct_samp);grid on;
legend('org', 'dct');
