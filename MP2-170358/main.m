format longg;
% the script file for testing the code
% the interval of approximations
a = -1; % the value of the left end-point of the interval
b = 1; % the value of the right end-point of the interval
% the function to be approximated
f = @(x) x.*x; % function description for f, e.g., f = @(x) x.*x
% approxim0ation grid size
nGrid = 1000; % size of the grid to be used for approximation
[xGrid, fGrid] = discreteData(nGrid, a, b, f);

% the number of test evaluation points
nEval = 500;
xEval = a + (b-a).*rand(1,nEval); % evaluation grid to be used for testing
tic;
exact = f(xEval);
approx = approxFunction(xEval, xGrid, fGrid);
%approx2 = approxFunction2(xEval, xGrid, fGrid);
%approx2 = approxFunction2(xEval, xGrid, fGrid);
%merdisp(approx);
%disp(approx2);
maxExact = max(abs(exact)); %  the max norm of f
maxError = max(abs(approx-exact));  % the max norm of error
%maxExact2 = max(abs(exact)); %  the max norm of f
%maxError2 = max(abs(approx2-exact));  % the max norm of error
toc;
%disp(maxExact);
%disp(maxExact2);
disp(maxError/maxExact);
%disp(maxError2/maxExact2);
