-------------------------

# Wavelet-Filter-Bank

## Perfect-Reconstruction-Filter-Bank (one of a tree-structured filter bank)

This code is based on a filter designed with below filter coefficients.
```matlab
$ filter coefficients 
h0 = [1/4; 1/2; 1/4];
h1 = [-1/8; -1/4; 3/4; -1/4; -1/8];
f0 = [-1/8; 1/4; 3/4; 1/4; -1/8];
f1 = [-1/4; 1/2; -1/4];

```

## H0 and H1 plot
<img src="https://user-images.githubusercontent.com/71545160/119292415-51930e00-bc8b-11eb-9b88-3caeefe9110a.png" alt="drawing" width="300"/>

## ( H0 + H1 )/2 plot
<img src="https://user-images.githubusercontent.com/71545160/119292427-56f05880-bc8b-11eb-890a-6db30ecc55bb.png" alt="drawing" width="300"/>

Below figure represents a result of designed filter with a sequence x.
```matlab
x = [1, 2, 2, 3, 2, 2, 2, 1, 2, 1, 1, 1, 2, 8, 9, 6, 3, 1, 1, 2, 1, 1, 1, 2, 1, 1]';
```
## Test for a sequence X
<img src="https://user-images.githubusercontent.com/71545160/119292435-5b1c7600-bc8b-11eb-9229-f4c3e1913244.png" alt="drawing" width="300"/>

<br>
<br>
<br>
<br>


-------------------------

# DCT

Please refer to the site below.

https://jaehoon9201.github.io/data-processing/DFT/


<br>
<br>
<br>
<br>


-------------------------

# Compressed sensing

See the following link
https://jaehoon9201.github.io/data-processing/Compressive_sensing/

<br>
<br>
<br>
<br>

-------------------------

# FFT/runFFT.m

### Why do we need 'Positive FFT'?

```matlab
function [X,freq]=positiveFFT(x,Fs)
   ...
```

+ The FFT on a real signal (w/o imaginary elements) is perfectly symmetric.
  + Real signal = The abs value of FFT
  + It also could be thought frequencies are to being aliased to negative frequencies which are equivalent to the positive frequencies in magnitude. (Phase is opposite) 
  + [Related Example](https://kr.mathworks.com/matlabcentral/answers/338408-why-are-fft-diagrams-mirrored) : The k =1 frequency will take you around the unit circle at a certain angular speed, and k= N-1 looks like k = 1, but in the negative direction. If you draw out the unit circle, and how far each waveform will 'travel around' in the each unit of time, this will make sense. Likewise, these pairings exist symmetrically around the nyquist limit as you approach it from the positive and negative direction. Therefore, you will have equal component frequencies, i.e. the 'mirroring' around that nyquist limit, N/2
  


<img src="https://user-images.githubusercontent.com/71545160/165462993-6b77b0ba-6b30-4276-91f2-1560435a7488.png" alt="drawing" width="300"/>

<img src="https://user-images.githubusercontent.com/71545160/165463023-a207860f-421e-46f8-a009-d9ff1bb465e4.png" alt="drawing" width="300"/>

<br>
<br>
<br>
<br>

-------------------------

# FFT2/Matlab_FFT_example.m

### Matlab-FFT
This code is for the FFT of below waveform(**Wave_example.csv**).

<img src="https://user-images.githubusercontent.com/71545160/117937112-98563f00-b340-11eb-87f5-a7c0e3131ac1.png" alt="drawing" width="300"/>


### How to start?

Run the **Matlab_FFT_example.m** file.

And then, you could get the below graph. 

<img src="https://user-images.githubusercontent.com/71545160/117936715-267df580-b340-11eb-8261-e42181423acc.png" alt="drawing" width="300"/>

If you activate below code, you could also get the ratio of 2nd order wave. 
```matlab
ratio2rd = Magnitude(1,3)/Magnitude(1,2) *100
```

<br>
<br>
<br>
<br>

-------------------------

# THD/calcTHD.m

<img src="https://user-images.githubusercontent.com/71545160/165463109-aa48d273-0a07-4c0f-b6dd-2294b9a54dd5.png" alt="drawing" width="300"/>

<img src="https://user-images.githubusercontent.com/71545160/165463066-e654e374-12d0-45e1-9bb2-2e47b17b3ed4.png" alt="drawing" width="300"/>
