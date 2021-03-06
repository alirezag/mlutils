--[[ Implementation of some common statistical functions used in ML and data analysis.


Alireza Goudarzi, <alireza.goudarzi@gmail.com>

]]


require 'mlutilinit.mlutilinit'

function mlutils.cov(x)
    means = x:mean(1);
    cx = x - torch.expand(means,x:size(1),x:size(2));
    covs = (cx:t()*cx)
    return covs;
end
function mlutils.corr(x,y)
    local y = y or x;
    xmeans = x:mean(1);
    ymeans = y:mean(1);
    cx = x - torch.expand(xmeans,x:size(1),x:size(2));
    cy = y - torch.expand(ymeans,y:size(1),y:size(2));
    xnorms = (torch.pow(cx,2):sum(1));
    ynorms = (torch.pow(cy,2):sum(1));
    xnorms:resize(xnorms:size(2));
    ynorms:resize(ynorms:size(2));
    normsmat = torch.Tensor(xnorms:size(1),ynorms:size(1)):typeAs(x):zero()
    normsmat:addr(xnorms,ynorms):pow(.5)
    
    covs = (cx:t()*cy):cdiv(normsmat)
    return covs;
end
function mlutils.norm(x,l)
    local vl = l or 2;
    return (torch.pow(x,vl):sum(1):pow(1/vl));
end   

function ml.normalize(w,d)
    local vd = d or 1;

    if w:dim() == 1 then 
        w:div(mlutils.norm(w));
       
    elseif w:dim() == 2 then 
        if vd==1 then 
            local norms = mlutils.norm(w:t());
            for ni=1,w:size(1) do 
                w[{{ni},{}}]:div(norms[1][ni]);
            end   
        elseif vd==2 then 
            local norms = mlutils.norm(w);
            for ni=1,w:size(2) do 
                w[{{},{ni}}]:div(norms[1][ni]);
            end
        end
    end
    return w;
end 

return mlutils;
