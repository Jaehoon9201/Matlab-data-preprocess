function [Results,freq]=positiveFFT_v2(x,Fs)
    N=length(x); %get the number of points
    k=0:N-1;     %create a vector from 0 to N-1
    T=N/Fs;      %get the frequency interval
    freq=k/T;    %create the frequency range
    Results=fft(x)/N*2; % normalize the data
    if Results(1)~=Results(N)
        Results(1)=Results(1)/2;
    end
    %only want the first half of the FFT, since it is redundant
    % cutOff = ceil(N/2); 
    cutOff = N/2+1 ; 
    %take only the first half of the spectrum
    Results = Results(1:cutOff);
    Results(end)=Results(end)/2;
    freq = freq(1:cutOff);