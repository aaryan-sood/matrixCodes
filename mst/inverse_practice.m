a=[1 2 -3;2 1 4;5 5 0];
rows=size(a,1);
b=[a eye(rows)];
for k=1:rows-1
    [ele,index]=max(abs(b(k:rows,k)));
    index=index+k-1;
    if(ele ~= 0 && index~= k)
        temp=b(index,:);
        b(index,:)=b(k,:);
        b(k,:)=temp;
    end
    for i=k+1:rows
        m=b(i,k)/b(k,k);
        b(i,:)=b(i,:)-m*b(k,:);
    end
end

for k=rows:-1:2
    m=1/b(k,k);
    b(k,:)=m*b(k,:);
    for i=k-1:-1:1
        m=b(i,k);
        b(i,:)=b(i,:)-m*b(k,:);
    end
end
m=1/b(1,1);
b(1,:)=m*b(1,:);
invele_a=b(:,n+1:2*n);
disp(invele_a);