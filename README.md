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
![image](https://user-images.githubusercontent.com/71545160/119292415-51930e00-bc8b-11eb-9b88-3caeefe9110a.png)

## ( H0 + H1 )/2 plot
![image](https://user-images.githubusercontent.com/71545160/119292427-56f05880-bc8b-11eb-890a-6db30ecc55bb.png)

Below figure represents a result of designed filter with a sequence x.
```matlab
x = [1, 2, 2, 3, 2, 2, 2, 1, 2, 1, 1, 1, 2, 8, 9, 6, 3, 1, 1, 2, 1, 1, 1, 2, 1, 1]';
```
## Test for a sequence X
![image](https://user-images.githubusercontent.com/71545160/119292435-5b1c7600-bc8b-11eb-9229-f4c3e1913244.png)

# DCT
Please refer to the site below.

https://jaehoon9201.github.io/data-processing/DFT/
