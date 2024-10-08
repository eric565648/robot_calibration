%% Check smoothness of minimal POE

clearvars; close all;

syms hx hy k1x k1y th phi;
hz = sqrt(1-hx^2-hy^2); % unit vector
hn = [hx;hy;hz];
k1z = sqrt(1-k1x^2-k1y^2);
f = (hx*k1x+hy*k1y)^2+(hz*k1z)^2;
f = collect(simplify(expand(f)),k1y);
k1yAns = solve(f,k1y);
k1y = simplify(expand(k1yAns(1)));

k1 = [k1x; k1y; k1z];
k2 = cross(hn,k1);

% define small differences
syms dth dphi;
dha = simplify(hat(k1)*rotm(k1,th)*rotm(k2,phi)*hn*dth + rotm(k1,th)*hat(k2)*rotm(k2,th)*hn*dphi)

function R=rotm(k,theta)
    R = eye(3,3)+sin(theta)*hat(k)+(1-cos(theta))*hat(k)*hat(k);
end