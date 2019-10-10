function final = NelderMead(ABC,a0,closeness)
%The Nelder-mead algorithm based on numerical methods using matlab 4th edition
%with 3 data points with weigts for a1 and a2 for each point as
%coordinates as input, 2x3 matrix, and the starting conditions for the Shaw
%et al 2014 differential equations

%Implemented by Hsing-Duan Louh

%Initialization
for i=1:size(ABC,2)
    output(i)=seaweed_rate(ABC(1,i),ABC(2,i),a0); %rate of seaweed intake based on each weight
end
nmT=[ABC;output];
[W,I]=sort(nmT(3,:)); %sort the column vectors from ascending to descending based on rate of intake
nmT=nmT(:,I); 
%Nelder-Mead Algorithm
A = nmT(:,1);
B = nmT(:,2);
C = nmT(:,3);
sqrt((C(3)-A(3))^2)
% while closeness<sqrt((C(3)-A(3))^2) || 0<=C(3)
while closeness<sqrt((C(3)-A(3))^2)
% while closeness<C(3)
    M = [(A(1)+B(1))/2,(A(2)+B(2))/2]; %midpoint between the 2 smaller points
    R = [2*M(1)-C(1),2*M(2)-C(2)];
    R_rate = seaweed_rate(R(1),R(2),a0);
    if R_rate < C(3)
        E=[2*R(1)-M(1),2*R(2)-M(2)];
        E_rate = seaweed_rate(E(1),E(2),a0);
        if E_rate < R_rate
            C(1)=E(1);
            C(2)=E(2);
            C(3)=E_rate;
        else
            C(1)=R(1);
            C(2)=R(2);
            C(3)=R_rate;
        end
    else
        W1=[(M(1)+C(1))/2,(M(2)+C(2))/2];
        W2=[(M(1)+R(1))/2,(M(2)+R(2))/2];
        W1_rate=seaweed_rate(W1(1),W1(2),a0);
        W2_rate=seaweed_rate(W2(1),W2(2),a0);
        W = [W1,W1_rate;W2,W2_rate];
        [J,I]=sort(W(:,3)); 
        W = W(I,:); %sort based on the rate with the smaller W vector on the bottom
        if W(2,3)< C(3)
            C(1)=W(2,1);
            C(2)=W(2,2);
            C(3)=W(2,3);
        else
            B(1)=M(1);
            B(2)=M(2);
            B(3)=seaweed_rate(M(1),M(2),a0);
            C(1)=(A(1)+C(1))/2;
            C(2)=(A(2)+C(2))/2;
            C(3)=seaweed_rate(C(1),C(2),a0);
        end
    end
    nmT(:,1)=A;
    nmT(:,2)=B;
    nmT(:,3)=C;
    [U,I]=sort(nmT(3,:)); %sort the column vectors from ascending to descending based on rate of intake
    nmT=nmT(:,I); 
    A = nmT(:,1)
    B = nmT(:,2)
    C = nmT(:,3)
    sqrt((C(3)-A(3))^2)
end
final=A;
end

