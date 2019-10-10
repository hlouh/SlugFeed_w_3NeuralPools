function rate = seaweed_rate(wght1,wght2,a0)
%Calculating the rate of seaweed movement using differen weights on 
%the neural variables a1 and a2 from the Shaw et al. 2014 model given intital
%conditions for all 7 differential equations

%Implemented by Hsing-Duan Louh
% % % tspan=[0,150];
% % % [t,y]=ode45(@(t,y)dadt(t,y,wght1,wght2),tspan,a0);
% % % idx=find(t<=(tspan(2)-100),1,'last');
% % % dseaweed=y(end,7)-y(idx,7);
% % % rate=dseaweed/(t(end)-t(idx));

rate = a0(1)+a0(2)*wght1+a0(3)*wght2+a0(4)*wght1^2+a0(5)*wght1*wght2+a0(6)*wght2^2;
end

