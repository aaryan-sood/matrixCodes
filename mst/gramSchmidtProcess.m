n=input('enter the number of elements in the basis ');
u=[2 -1 3 4;4 0 1 2;-2 4 3 7;5 0 4 -1];
v(1,:)=u(1,:);
sm=0;
for i=1:n
    sm=sm+u(1,i)^2;
end
e(1,:)=1/sqrt(sm) * v(1,:);
for i=2:n
    v(i,:)=u(i,:);
    for j=1:i-1
        v(i,:)=v(i,:) - sum((u(i,:) .* e(j,:))) *e(j,:);
    end
    e(i,:)=(v(i,:)/ norm(v(i,:)));
end
disp('e vectos')
for i=1:n
    disp(e(i,:));
end
