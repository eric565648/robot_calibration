%% Proof that DH has singularity
% Note that this script uses general-robotics-toolbox
% https://github.com/rpiRobotics/general-robotics-toolbox

clearvars; close all;

ex = [1;0;0];
ey = [0;1;0];
ez = [0;0;1];

syms th alpha d a;

R = rot(ez,th)*rot(ex,alpha);
% partial R partial alpha
dRdalpha = diff(R,alpha);
% partial R partial theta
dRdth = diff(R,th);

% define small differences
syms dalpha dth;

Rnew = R + dRdalpha*dalpha + dRdth*dth;
dR = dRdalpha*dalpha + dRdth*dth;

disp('At alpha = 0 (deg)');
subs(dR,alpha,0)

disp('At alpha = 0 (deg), theta = 0 (deg)');
subs(Rnew,[alpha,th],[0,0])

disp('At alpha = 0 (deg), theta = 45 (deg)');
subs(Rnew,[alpha,th],[0,pi/4])

disp('At alpha = 0 (deg), theta = 90 (deg)');
subs(Rnew,[alpha,th],[0,pi/2])

disp('At alpha = 45 (deg), theta = 0 (deg)');
subs(Rnew,[alpha,th],[pi/4,0])

disp('At alpha = 90 (deg), theta = 0 (deg)');
subs(Rnew,[alpha,th],[pi/2,0])

% The result shows that if alpha = 0, the degree of freedom of z_i is
% reduced to 1.

