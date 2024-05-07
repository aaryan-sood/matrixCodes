% s={(1,2,5),(2,1,5),(-3,4,0)}
% wap to check if any vector (4,6,-2) belongs to <s> or not

clc
a=[1 2 5;2 1 5;-3 4 0];
a_b=[1 2 5;2 1 5;-3 4 0;4 6 -2];
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

rows_ab=size(a_b,1);
cols_ab=size(a_b,2);
for k=1:rows_ab-1
    [ele,b]=max(abs(a_b(k:rows_ab,k)));
    if(ele~= 0 && b~=k)
        temp=a_b(k,:);
        a_b(k,:)=a_b(b,:);
        a_b(b,:)=temp;
    end
    for i=k+1:rows_ab
        m=a_b(i,k)/a_b(k,k);
        a_b(i,:)=a_b(i,:)-m*a_b(k,:);
    end
end
found=false;
for i=rows_ab:-1:1
    for j=cols_ab:-1:1
        if(a_b(i,j) ~= 0)
            r_ab=i;
            found=true;
            break;
        end
    end
    if(found)
        break;
    end
end

if(r_ab == r_a)
    disp('it spans');
else
    disp('It does not');
end