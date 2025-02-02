function [xGrid, fGrid] = discreteData(nGrid, a, b, f)

k=[0:nGrid-1];
xGrid=(b+a)/2 + (b-a)*cos(pi*(k)/(nGrid-1))/2; %Chebyshev points
fGrid=f(xGrid);

end