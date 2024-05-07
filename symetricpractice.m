clc
clear
n=4;
a=[4 1 -2 2;1 2 0 1;-2 0 3 -2;2 1 -2 -1];
for i=1:n-2
    x=a(:,i);
    r=0;
    for j=i+1:n
        r=r+x(j) * x(j);
    end
    y=x;
    r=sqrt(r);
    y(i+1)=r;
    for j=i+2:n
        y(j)=0;
    end
    w=(x-y)/norm(x-y);
    H=eye(n) - 2*(w * w');
    a=H*a*H;
end
disp(a);