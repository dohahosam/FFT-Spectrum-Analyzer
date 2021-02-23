function f = RMSaverage(x,numOfSubArrays,N)
lengthOfSubArray = ceil(length(x)/numOfSubArrays);
if mod(length(x),lengthOfSubArray)~=0
    x = [x zeros(1,lengthOfSubArray-mod(length(x),lengthOfSubArray))];
end
RmsFftResults = zeros(numOfSubArrays,N);
for i = 1:numOfSubArrays
    subArray = x(:,(i-1)*lengthOfSubArray+1:i*lengthOfSubArray);
    RmsFftResults(i,:)= abs(radix2fft(subArray,N));
end
s =  zeros(1,N);
for i = 1:numOfSubArrays
   s = s+ RmsFftResults(i,:); 
end
f = s./numOfSubArrays;
end
