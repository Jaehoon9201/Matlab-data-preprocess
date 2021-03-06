
% reference : https://www.youtube.com/watch?v=rt5mMEmZHfs
clear; close all; clc;

n = 5000;
t = linspace(0, 1/8, n);
f = sin(1394*pi*t)+sin(3266*pi*t);
figure(1); hold on;
plot(t,f);grid on;

f_dct = dct(f);
figure(2);
plot(f_dct);grid on;

%% compressed sensing
m = 500;
temp =randperm(n);
idx = temp(1:m);
tcom_idx = t(idx);
fcom = sin(1394*pi*tcom_idx)+sin(3266*pi*tcom_idx);
figure(1);
plot(tcom_idx, fcom, 'ro','LineWidth',2,'MarkerSize',2);

D = dct(eye(n,n)); 
% setup a basis(realted to A-Matrix). 
% b= Ac --> we can find 'c'
A = D(idx,:); % setup A-Matrix

%% Method 1
% x = pinv(A)*fcom';  % =Mean square error


%% Method 2
cvx_begin;
    variable x(n);
    minimize(norm(x,1));
    subject to
        A*x == fcom';
cvx_end

%% plot
reconstructed_sig = dct(x);  % It's probably wrong. i guess that it should be 'idct'

figure(3)
plot(t, f, t, reconstructed_sig);

figure(4)
plot(f_dct, 'b'), hold on, grid on;
plot(x, 'r');

