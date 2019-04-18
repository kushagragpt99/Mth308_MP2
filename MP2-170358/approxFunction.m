function approx = approxFunction(xEval, xGrid, fGrid)
format longg;
N=size(xGrid,2);

a=xGrid(N);
b=xGrid(1);         %boundary points

coef=ones(1,N);
coef(1)=1/2;

f1=@(i,x) cos(i*acos(  (2*x-(b+a))/(b-a)   )  );
f2= @(i,x) cos(i*pi*(x+0.5)/(N-1));
Ti=@(i,x) cos(i*acos((2*x-(b+a))/(b-a)));

alpha=zeros(1,N);

for i=0:N-1
    alpha(i+1)=sum(fGrid.*Ti(i,xGrid));
end

alpha=(2*alpha.*coef)/(N-1);

approx=zeros(1,size(xEval,2));

for i=0:N-1
    approx=approx+(alpha(i+1).*f1(i,xEval));
end

end
