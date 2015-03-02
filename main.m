clear all;
%driver function to test the Coding technique 
%defining the information polynomial
%--------
%encoding
%--------
F=[1,3,12,34,256,331,745,1366];
[C1,C2,C3]=level1en(F);
[c11,c12,c13]=level2en(C1);
[c21,c22,c23]=level2en(C2);
[c31,c32,c33]=level2en(C3);
% generating the matrix for network transmission
A=[size(c11),size(c12),size(c13),size(c21),size(c22),size(c23),size(c31),size(c32),size(c33)];
k=max(A); %get the maximum size of the cii vectors
%{
U=[c11,c12,c13;c21,c22,c23;c31,c32,c33]
if(size(c11)<k)
    diff=k-size(c11);
    c11=[zeros(1,diff),c11];
end
if(size(c12)<k)
    diff=k-size(c12);
    c12=[zeros(1,diff),c12];
end
if(size(c13)<k)
    diff=k-size(c13);
    c13=[zeros(1,diff),c13];
end
if(size(c21)<k)
    diff=k-size(c21);
    c21=[zeros(1,diff),c21];
end
if(size(c22)<k)
    diff=k-size(c22);
    c22=[zeros(1,diff),c22];
end
if(size(c23)<k)
    diff=k-size(c23);
    c23=[zeros(1,diff),c23];
end
if(size(c31)<k)
    diff=k-size(c31);
    c31=[zeros(1,diff),c31];
end
if(size(c32)<k)
    diff=k-size(c32);
    c32=[zeros(1,diff),c32];
end
if(size(c33)<k)
    diff=k-size(c33);
    c33=[zeros(1,diff),c33];
end
%all the element sizes are normalized
%}
U=[c11,c12,c13;c21,c22,c23;c31,c32,c33];
%can append a unit vector here (not done here)
%U=randomize(U);%randomly induce errors in the matrix
% assume that the error is coming from the network
% now we decode the errorneous matrix to get back F(x)
%--------
%decoding
%--------
%packet size is k, using it it to pick up the cii'(x)
c11=U(1,1:8);
c12=U(1,9:16);
c13=U(1,17:24);
%--cell 1------
c21=U(2,1:8);
c22=U(2,9:16);
c23=U(2,17:24);
%--cell 2------
c31=U(3,1:8);
c32=U(3,9:16);
c33=U(3,17:24);
%--cell 3------
cell1={c11,c12,c13};
cell2={c21,c22,c23};
cell3={c31,c32,c33};
c11m=[1,3,2];
c12m=[1,7,12];
c13m=[1,11,30];
celllevel2={c11m,c12m,c13m};
f1=level1decode(cell1,celllevel2);
f2=level1decode(cell2,celllevel2);
f3=level1decode(cell3,celllevel2);
cell4={f1,f2,f3};
c1m=[1,6,11,6];
c2m=[1,15,74,120];
c3m=[1,24,191,504];
celllevel1={c1m,c2m,c3m};% we define all the cells that we require
Fend=level1decode(cell4,celllevel2);