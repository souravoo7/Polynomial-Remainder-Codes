function [ A ] = randomize(A)
%This function randomly induces errors into the matrix A 
[n,m]=size(A);
tot=n*m;
p=ceil(tot/10);% 10% error
i=1; 
while(i<10)
    a=randperm(n);
    b=randperm(m);
    if(A(a(1),b(1))>0)
        kx=max(A(1,:));
        J=randperm(kx);
        A(a(1),b(1))=J(1);
        i=i+1;
    end
end
return
end

