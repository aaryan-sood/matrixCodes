clc
a=[2 4 5;4 1 -1;-2 0 4];
rows=size(a,1);
for k=1:rows-1
    [ele,b]=max(abs(a(k:rows,k)));
    b=b+k-1;
    if(b~=k && ele~= 0)
        temp=a(b,:);
        a(b,:)=a(k,:);
        a(k,:)=temp;
    end
    for i=k+1:rows
        m=a(i,k)/a(k,k);
        a(i,:)=a(i,:)-m*a(k,:);
    end
end
found=false;
for i=rows:-1:1
    for j=i:-1:1
        if(a(i,j) ~= 0)
            r=i;
            found=true;
            break;
        end
    end
    if(found)
        break;
    end
end
fprintf('the rank of matrix A is %d',r);