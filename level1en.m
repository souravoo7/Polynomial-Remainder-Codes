function [ r1,r2,r3 ] = level1en(F)
%This function does the first level encoding of the information polynomial
%F(x)
%r1, r2 , r3 are the remainder obtained by dividing the F(x) bythe three
%relatively prime polynomials given as:
%c1(x)=[1,6,11,6]
%c2(x)=[1,15,74,120]
%c3(x)=[1,24,191,504]
c1=[1,6,11,6];
c2=[1,15,74,120];
c3=[1,24,191,504];
[q,r1]=deconv(F,c1);
[q,r2]=deconv(F,c2);
[q,r3]=deconv(F,c3);
return
end

