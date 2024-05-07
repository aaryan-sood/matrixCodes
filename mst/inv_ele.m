a=[1 2 -3;2 1 4;5 5 0];
n=size(a);
b=[a eye(n)];
for k=1:n-1
    [ele,index]=max(abs(b(k:n,k)));
    index=index+k-1;
    if(index~=k && ele~=0)
        temp=b(k,:);
        b(k,:) = b(index,:);
        b(index,:)=temp;
    end
    for i=k+1:n
        m=b(i,k)/b(k,k);    % m=entry to be deleted/pivot row
        b(i,:)=b(i,:)-m* b(k,:);
    end
end

%Forward Substitution
for k=n:-1:2
    m=(1/b(k,k));
    b(k,:)=m*b(k,:);
    for i=k-1:-1:1
        m=b(i,k);
        b(i,:)=b(i,:)-m*b(k,:);
    end
end
m=(1/b(1,1));
b(1,:)=m*b(1,:);
invele_a=b(:,n+1:2*n);
disp(invele_a);