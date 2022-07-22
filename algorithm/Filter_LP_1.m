function [ output ] = Filter_LP_1( input , k )
% low pass filter

Nt = size(input,2);
output = zeros(size(input));

output(:,1) = input(:,1);
for t=2:Nt
	output(:,t) = k * input(:,t) + (1-k) * output(:,t-1);
end

end