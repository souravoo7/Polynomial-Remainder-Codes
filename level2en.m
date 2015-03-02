function[r1,r2,r3]=level2en(F)
% This function conducts the level two encoding of the input infomation
% polynomial F(x)
% c11(x)=[1,3,2];
% c12(x)=[1,7,12];
% c13(x)=[1,11,30];
c11=[1,3,2];
c12=[1,7,12];
c13=[1,11,30];
[q,r1]=deconv(F,c11);
[q,r2]=deconv(F,c12);
[q,r3]=deconv(F,c13);
return
end