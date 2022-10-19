clear all;clc;close all; 

Fs = 1000;            % Sampling frequency 
T = 1/Fs;             % Sampling period 
L = 10000;            % Length of signal 
t = 0:T:10-T;         % Time vector 

S = 0.7*sin(2*pi*10*t) + sin(2*pi*150*t) +0.5*randn(size(t))+1;
X = S; 

%% FFT for all samples
Y = fft(X); 
P2 = abs(Y/L); 
P1 = P2(1:L/2+1); 
P1(2:end-1) = 2*P1(2:end-1); 
P1(end)

f = Fs*(0:(L/2))/L; 
figure(1)
plot(f,P1) 
xlabel('f (Hz)') 
ylabel('Magnitude')
%% FFT for 'n' samples
n = L; 
Y = fft(X,n); 
P = 2*abs(Y/n); 
P1new = P(1:n/2+1);
P1new(1) = P1new(1)/2;
P1new(end) = P1new(end)/2;
P1new(end)

f = Fs*(0:(n/2))/n ;
figure(2) 
plot(f,P1new) 
xlabel('f (Hz)') 
ylabel('Magnitude') 

%% FFT for all samples & using 'positiveFFT_v2' function.
% previous positiveFFT.m is not correct because it is not dividing last
% magnitude as 2.
[Results,freq] = positiveFFT_v2(X,Fs);
Magnitude=(abs(Results));
% Order=0:1:length(Magnitude)-1;
figure(3)
% bar(Order, Magnitude);
plot(freq, Magnitude);
Magnitude(end)