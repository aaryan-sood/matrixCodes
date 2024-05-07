% QR algorithm for eigen values of any matrix A
clc
clear
n=input('enter the order of the matrix : ');
a=[2 0 0 0; 1 4 0 1;3 1 5 2;0 0 0 1];
tol=0.001;
err=1;
oldev=zeros(n,1);
A=a;
Q=eye(n);
%while err > tol 
    for i=1:n
        ai=a(:,i);
        r=norm(ai);
        ei=zeros(n,1);
        ei(i)=1;
        v=ai+sign(ai(i)) * r * ei;
        H=eye(n) - 2*(v*v')/(v' * v);
        Q=Q*H;
        a=H*a;
        R=a;                %Qr decomposition code ends here
    end
    %ev=diag(a);
    %err=max(abs(ev-oldev))
    %oldev=ev;

%end
%disp(ev);