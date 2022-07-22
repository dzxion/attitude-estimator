function [ bias ] = get_gyro_bias( gyro , dt )
% gyro bias calulation use first 0.1ms data

N = 0.1/dt;
sum_gyro = zeros(3,1);

for t=1:N
	sum_gyro = sum_gyro + gyro(:,t);
end

bias = sum_gyro / N;

end