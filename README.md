# Utilities for Torch
Torch implementation of some commonly used statistical functions such as correlation, covariance and norms (column-wise norm of a matrix).

<br>
Author: Alireza Goudarzi <br>
Email: alireza.goudarzi@gmail.com <br>
<br>


## Example: 

'''
    require 'mlutils'
    x = torch.randn(1000,10);
    y = torch.randn(1000,10);
    mlutils.corr(x)   -- correlation matrix of columns of x.
    mlutils.corr(x,y) -- correlation matrix betwen columns of x and y
    mlutils.cov(x)  -- covariance matrix
    mlutils.norm(x) -- column-wise norm of a matrix
    mlutils.norm(x,p) -- l_p norm of columns of x. 
      
'''
