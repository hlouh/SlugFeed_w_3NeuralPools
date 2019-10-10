function dadt = dadt(~,a,wght1,wght2)
%The dynamics between muscle activation and the three neural pool
%parameters of Shaw et al. 2014
%
% RHS for Shaw_sixDiffeq.m
%
% Implemented by Hsing-Duan Louh 2019-09-19
global atau gam mu mtau umax k k0 k1 c0 c1 w0 w1 br bsw
dadt=zeros(7,1);
dadt(1)=(1/atau)*(a(1)*(1-a(1)-gam*a(2))+mu);   %a0
dadt(2)=(1/atau)*(a(2)*(1-a(2)-gam*a(3))+mu);   %a1
dadt(3)=(1/atau)*(a(3)*(1-a(3)-gam*a(1))+mu);   %a2
dadt(4)=(1/mtau)*((a(1)+a(2))*umax-a(4));       %u0
dadt(5)=(1/mtau)*(a(3)*umax-a(5));              %u1
LT=@(x)-1*k*x*(x-1)*(x+1); %length tension curve
Fmusc=k0*LT((a(6)-c0)/w0)*a(4)+k1*LT((a(6)-c1)/w1)*a(5); %muscle force based on grasper position
Fsw=0.05; %what the seaweed force is set to
c=Fmusc-Fsw;
if 0.5<=wght1*a(2)+wght2*a(3) %if rad/odonophor is retraction closed
    dadt(6)=(Fmusc+Fsw)/(br+bsw); %x rad/od
    dadt(7)=dadt(6);              %x seaweed
else
    dadt(6)=Fmusc/br;
    dadt(7)=0;
end
end

