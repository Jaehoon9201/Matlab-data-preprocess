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


# Compressed sensing
## What is a compressive sensing?

* It could be thought compressed or random measurements.
* And then inferring what the sparse representation is in the transformed basis.
* It's somewhat NP(non-polynomial) hard problem.
* If an uncompressed signal will generally be sparse in a transform basis, the **Shannon-Nyquist theorem** may be relaxed, and the signal may be reconstructed with considerably fewer measurements than given by the Nyquist rate. It's a key idea to understand the compressive sensing.



## How to do? (For reconstructing a $f$)

* [References](https://www.youtube.com/watch?v=rt5mMEmZHfs)

1. $ f = \Psi c $

   * $\Psi$ : basis

   * $c$ : "loadings" or "coefficeints of basis"
   * ![image](https://user-images.githubusercontent.com/71545160/159208323-71e171c2-9158-441d-a748-e1c3474d2951.png)
   * ![image](https://user-images.githubusercontent.com/71545160/159208336-87a7c361-debf-4fc3-9665-d95a12bcb494.png)
   * (above images's source) : https://www.youtube.com/watch?v=rt5mMEmZHfs

2. $ b= \Phi f $

   * $b$ : 
     * = subsample vectror 
     * = really acquired data from processor
     * = it also could be thought as a portion of $f$.
   * $\Phi$ :  measuring matrix
   * $f$ : $ f = \Psi c $
   * ![image](https://user-images.githubusercontent.com/71545160/159208351-14bbfaa8-0ee0-4764-adf2-911d07bb5103.png)

3. $ b= \Phi f  = \Phi \Psi c = Ac$
   $ subject\;to  ||c||_{1} $ 

   * If we obtain $c$ , **we can reconstruct the $f$.**

## Example code
