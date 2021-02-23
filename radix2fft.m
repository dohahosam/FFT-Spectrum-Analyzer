function f = radix2fft(x,N)
                                                                           %check the length of x relative to the N of N-fft
if length(x) < N                                                           %if length of x is smaller than N
   x=[x zeros(1,N - mod(length(x),N))];                                    %zero padding for x so length(x) = N 
elseif length(x)>N %if length of x is greater than N
  x = x(:,1:N);    %take the first N elements
end
xrev = bitrevorder(x); 
nStages = log2(length(xrev));
outputMatrix = zeros(nStages,length(xrev));
outputMatrix = [xrev ;outputMatrix];
%nButterflies = length(x)/2;
for stage = 1 :nStages
    N = pow2(stage);
    for subarray = 0:pow2(stage): length(x)-2
        for nButterflyPerSubarray = 1:pow2(stage-1)
        outputMatrix(stage+1,subarray+nButterflyPerSubarray) = outputMatrix(stage,subarray+nButterflyPerSubarray) + twiddlefactor(subarray+nButterflyPerSubarray-1,N)*outputMatrix(stage,subarray+nButterflyPerSubarray+(N/2));
        outputMatrix(stage+1,subarray+nButterflyPerSubarray+(N/2)) = outputMatrix(stage,subarray+nButterflyPerSubarray)+ twiddlefactor(subarray+nButterflyPerSubarray-1+(N/2),N)*outputMatrix(stage,subarray+nButterflyPerSubarray+(N/2)); 
        end
    end       
end
f = outputMatrix(nStages+1,:);
end