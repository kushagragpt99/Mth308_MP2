function approx = approxFunction(xEval, xGrid, fGrid)

N=size(xGrid,2);
a=xGrid(N);
b=xGrid(1);

coef=ones(1,N);
coef(1)=1/2;
coef(N)=1/2;

f1=@(i,x) cos(i*acos(  (2*x-(b+a))/(b-a)   )  );
f2= @(i,x) cos(i*pi*x/(N-1));

alpha=zeros(1,N);

for i=0:N-1
    alpha(i+1)=sum(fGrid.*f2(i,[0:N-1]));
end
alpha=(2*alpha.*coef)/(N-1);
%disp('alpha');
%disp(alpha);

approx=zeros(1,size(xEval,2));

for i=0:N-1
    approx=approx+(alpha(i+1)*f1(i,xEval));
end

end