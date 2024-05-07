% s={(1,2,5),(2,1,5),(-3,4,0)}
% wap to check if any vector (4,6,-2) belongs to <s> or not

clc
a=[1 2 -3;2 1 4;5 5 0];
b=[4;6;-2];
a_b=[a b];
rows=size(a,1);
disp(rows)
for k=1:rows-1
    [ele,b]=max(abs(a(k:rows,k)));
    b=b+k-1;
    if(b~=k && ele~=0)
        temp=a(k,:);
        a(k,:) = a(b,:);
        a(b,:)=temp;
    end
    for i=k+1:rows
        m=a(i,k)/a(k,k);
        a(i,:)=a(i,:)-m* a(k,:);
    end
end
disp(a);
% Initialize found to false before starting the loop
found=false;
for i=rows:-1:1
    for j=i:-1:1
    if (a(i,j) ~= 0)
        fprintf('%d %d',i,j);
        r_a=i;
        found=true;
        break;
    end
    end
    if(found)
        break;
    end
end


rows=size(a_b,1);
disp(rows)
for k=1:rows-1
    [ele,b]=max(abs(a_b(k:rows,k)));
    b=b+k-1;
    if(b~=k && ele~=0)
        temp=a_b(k,:);
        a_b(k,:) = a_b(b,:);
        a_b(b,:)=temp;
    end
    for i=k+1:rows
        m=a_b(i,k)/a_b(k,k);
        a_b(i,:)=a_b(i,:)-m* a_b(k,:);
    end
end
disp(a_b);
% Initialize found to false before starting the loop
found=false;
cols=size(a_b,2);
for i=rows:-1:1
    for j=cols:-1:1
    if (a_b(i,j) ~= 0)
        fprintf('%d %d',i,j);
        r_ab=i;
        found=true;
        break;
    end
    end
    if(found)
        break;
    end
end


fprintf('the rank of matrix A_B is %d\n',r_ab);
rows=size(a,1);
n=rows;
if(r_a == r_ab && r_ab == rows)
    x(n)=a_b(n,n+1)/a_b(n,n);
    for i=n-1:-1:1
        sum=0;
        for j=i+1:n
            sum=sum+a_b(i,j)*x(j);
        end
        x(i)=(a_b(i,n+1)-sum)/a(i,i);
    end
    disp('it forms a basis!')
else
    disp('it does not form a basis')
end