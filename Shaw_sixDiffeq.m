% This script runs Kendrick Shaw's model without sensory feedback.
% Implemented by Hsing-Duan Louh and revised by Dr. Peter Thomas 2019-09-19
% Load the parameters.
Parameters

%Six governing differential equations from Shaw et al. 2014 are specified
%in dadt.m

global atau gam mu mtau umax k k0 k1 c0 c1 w0 w1

%Initial values
% a0=[1e-19;1e-9;1e-9;0;0;0.5;0]; %a(1),(2)(3) are a0,a1,a2, and a(4)(5) are u0, u1
% a0 = [0.193894174941004   0.730749041959371   0.000000003358105   0.680930428114503   0.302133606010658   0.622287293777687 0]
% a0 = [0.1439    0.7858    0.0000    0.6824    0.3003    0.6255    0.9565]; % initial conditions on the limit cycle (after a transient)
%Differential Equations
% a0=[0,0,0,1,0,1];
% a0=[1,1,2,3,4,5];
a0 = [0,0,0,1,0,-1];
%ABC is the Nelder-Mead triangle containing the "weights" [Pt1_1,Pt1_2,Pt2_1,Pt2_2,Pt3_1,Pt3_2];
%nmT is the Nelder-Mead triangle plus the functional output in the last row
ABC = [1,0.7,0.4;0.3,1,0.9]; %Initial Value of Nelder Mead Triangle     
final = NelderMead(ABC,a0,0);
% Figure 1 b)
% figure(1)
% hold on;
% plot(t,a(:,1));
% plot(t,a(:,2));
% plot(t,a(:,3));
% legend('a0','a1','a2');
% figure(2)
% hold on;
% plot(t,a(:,4));
% plot(t,a(:,5));
% legend('u0','u1');
% figure(3)
% hold on;
% plot(t,a(:,6));
% plot(t,a(:,7),'-o');
% legend('xr','xsw');
% grid on;