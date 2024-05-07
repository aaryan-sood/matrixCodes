clc
a=[1 2 -3;2 1 4;5 5 0];
b=[4;6;-2];
a_b=[a b];
rows=size(a,1);
for k=1:rows-1
    for i=k+1:rows
        [ele,b]=max(abs(a(k:rows,k)));
        b=b+k-1;
        if(b~=k && ele~= 0)
            temp=a(b,:);
            a(b,:)=a(k,:);
            a(k,:)=temp;
        end
        m=a(i,k)/a(k,k);
        a(i,:)=a(i,:)-m*a(k,:);
    end
end
found=false;
for i=rows:-1:1
    for j=i:-1:1
        if(a(i,j) ~= 0)
            r_a=i;
            found=true;
            break;
        end
    end
    if(found)
        break;
    end
end
rows_ab=size(a,1);
cols_ab=size(a_b,2);
for k=1:rows_ab
    [ele ,b]=max(abs(a_b(k:rows,k)));
    b=b+k-1;
    if(ele ~= 0 && b~= k)
        temp=a_b(k,:);
        a_b(k,:)=a_b(b,:);
        a_b(b,:)=temp;
    end
    for i=k+1:rows_ab
    m=a_b(i,k)/a_b(k,k);
    a_b(i,:)=a_b(i,:)-m*a_b(k,:);
    end
end
cols_ab=size(a_b,2);
found=false;
for i=rows_ab:-1:1
    for j=cols_ab:-1:1
        if(a_b(i,j) ~= 0)
            found=true;
            r_ab=i;
            break
        end
    end
    if(found)
        break;
    end
end

if(r_a == r_ab && r_a == rows)
    disp('it spans');
    x(n)=a_b(n,n+1)/a_b(n,n);

    for i=n-1:-1:1
        sum=0;
        for j=i+1:n
            sum=sum+a(i,j)*x(j);
        end
        x(i)=(a_b(i,n+1) - sum)/a_b(i,i);
    end
else
    disp('it does not');
end