function [X,freq]=positiveFFT(x,Fs)
   N=length(x); %get the number of points
   k=0:N-1;     %create a vector from 0 to N-1
   T=N/Fs;      %get the frequency interval
   freq=k/T;    %create the frequency range
   X=fft(x)/N*2; % normalize the data
 if X(1)~=X(N)
     X(1)=X(1)/2;
 end
   %only want the first half of the FFT, since it is redundant
   cutOff = ceil(N/2); 
 
   %take only the first half of the spectrum
   X = X(1:cutOff);
   freq = freq(1:cutOff);
   
