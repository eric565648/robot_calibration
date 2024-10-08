%% Check smoothness of POE

clearvars; close all;

ex = [1;0;0];
ey = [0;1;0];
ez = [0;0;1];

syms hx hy hz th;

h = [hx;hy;hz];
R = rot(h,th);
% partial R partial hx
dRdhx = simplify(diff(R,hx));
% partial R partial hy
dRdhy = simplify(diff(R,hy));
% partial R partial hz
dRdhz = simplify(diff(R,hz));

% define small differences
syms dhx dhy dhz;

Rnew = simplify(R + dRdhx*dhx + dRdhy*dhy + dRdhz*dhz);

disp('At h=[0,1,0]');
subs(Rnew,[hx,hy,hz],[0,1,0])