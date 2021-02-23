function f = afterzeropad(x,N)
if mod(length(x),N) ~= 0
    f = [x zeros(1,N - mod(length(x),N))];
end
end