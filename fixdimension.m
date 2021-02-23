function f = fixdimension(x,N)
if N<=length(x)
    f=x(1,1:N);
else
    f = [x zeros(1,N - mod(length(x),N))];
end
end