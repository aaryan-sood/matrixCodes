clc
clear
n=4;
a=[4 1 -2 2;1 2 0 1;-2 0 3 -2;2 1 -2 -1];
for i=1:n-2 %because 2*2 matrix is already tridiagonal!
    x=a(:,i);
    r=0;
    for j=i+1:n
        r=r+x(j) * x(j);
    end
    r=sqrt(r);
    y=x;
    y(i+1)=r;
    for j=i+2:n
        y(j)=0;
    end
    w=(x-y)/norm(x-y);
    H=eye(n) - 2 * (w * w');
    a=H*a*H;
end
disp(a);