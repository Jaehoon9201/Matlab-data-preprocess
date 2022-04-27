

clear all; clc;
data=[];
data = csvread('C3VI00001.csv',1);
single_prd = 1/60 * 200000; % sec
timeidx_start = 200; % start index
timeidx_end = timeidx_start+ floor(single_prd) ; % end index. 
data=data(timeidx_start:timeidx_end,2);

data_size = size(data);

YfreqDomain_list=[];   
YfreqDomain=[]; 
FFT_list_data = []; 
THD_list_data= [];  
THD_list=[];  

for i=1:data_size(1,2)    % 여러 데이터에 대해 iter 돌면서 THD 계산. 이 파일에서는 하나만 생각.
    y = data(:,i);
    Fs = length(y);
    
    [YfreqDomain,frequencyRange] = positiveFFT(y,Fs);   % FFT 수행
    FFT_list=abs(YfreqDomain);   % FFT 크기만 출력
    YfreqDomain_list=[YfreqDomain_list YfreqDomain];  % Re,Im Domain으로 FFT 출력 
    FFT_list_data = [FFT_list_data FFT_list];  % FFT 크기만 계산값 모음
    
    ysquare=y.^2;    % THD 계산하기 위한 과정
    y_base_rms=sqrt(sum(ysquare)/Fs);
    baseY=FFT_list(2)/sqrt(2);
    THD_list=sqrt(y_base_rms^2-baseY^2)/baseY*100;   % THD 계산 수행 및 소수점 4째자리까지 출력
    THD_list_data=[THD_list_data THD_list];   % THD 계산값 모음
end

    disp('============= THD =============');
    THD_list_data
    
    x = [0:1:size(FFT_list,1)-1];
    y1 = FFT_list_data(:,1);
    bar(x,y1)
    xlim([0 16]);
    grid on;
    % YfreqDomain_list : FFT 결과 Re,Im Domain 출력값
    % FFT_list_data : FFT 결과 Absolute 값 출력
    % THD_list_data : THD 결과 차례대로 출력
