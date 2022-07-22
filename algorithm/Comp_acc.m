function [ qEst, bias ] = Comp_acc( fs, gyro, acc )
% Attitude estimation using Complementary filter, see
% "Nonlinear Complementary Filters on the Special Orthogonal Group", Mahony, 2008
% input parameters: sf: sampling frequency Hz
%                   gyro: measured angular velocity rad/s 
%                   acc: measured acceleration g
% output parameters: qEst: estimated quaternion

dt = 1/fs;
Nt = size(gyro,2);
kp_a = 1.0;
qEst = zeros(4,Nt);

% initialize
q = quat_acc( acc(:,1) );

% calulate gyro bias
bias = get_gyro_bias( gyro , dt );
% bias = bias * 0;

% filter iteration
for nt = 1:Nt
    % correction
    v = [2*(q(2)*q(4)-q(1)*q(3));
         2*(q(1)*q(2)+q(3)*q(4));
         q(1)*q(1)-q(2)*q(2)-q(3)*q(3)+q(4)*q(4)];

    a = acc(:,nt) / norm(acc(:,nt));
    e = cross(a,v);
    corr = kp_a * e;
%     corr = corr * 0;

    % integration
    q = integral(q,gyro(:,nt)-bias+corr,dt);
    qEst(:,nt) = q;
end

end
