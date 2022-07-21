function [ qEst ] = Comp_acc( fs, gyro, acc )
% Attitude estimation using Complementary filter, see
% "Nonlinear Complementary Filters on the Special Orthogonal Group", Mahony, 2008
% input parameters: sf: sampling frequency Hz
%                   gyro: measured angular velocity rad/s 
%                   acc: measured acceleration g
% output parameters: qEst: estimated quaternion

dt = 1/fs;
Nt = size(gyro,2);
K = 0.03;
qEst = zeros(4,Nt);

% initialize


% filter iteration
for nt = 2:Nt
    
end

end
