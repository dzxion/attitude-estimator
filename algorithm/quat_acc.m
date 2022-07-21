function [ q ] = quat_acc( acc )
% Attitude calulation using acceleration data
% input parameters: acc: measured acceleration g 
% output parameters: q: quaternion

Nt = size(acc,2);
euler = zeros(3,Nt);

for t=1:Nt
    acc(:,t) = acc(:,t) / norm(acc(:,t));
    euler(2,t) = -asin(acc(1,t));
    euler(1,t) = atan2(acc(2,t), acc(3,t));
end

q = eul2qua(euler);

end