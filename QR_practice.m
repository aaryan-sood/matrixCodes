clc
clear 
a=[2 0 0 0; 1 4 0 1;3 1 5 2;0 0 0 1];
n=4;
Q=eye(n);
for i=1:n
    ai=a(:,i);
    r=norm(ai);
    ei=zeros(n,1);
    ei(i)=1;
    v=ai+sign(ai(i)) * r * ei;
    H=eye(n) - 2*(v* v')/(v' * v);
    Q=Q*H;
    a=H*a;
    R=a;
end
Q*R