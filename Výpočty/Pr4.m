clc;
clear;
R1=14;
R2=13;
U1=5;
U2=3;
ZL1=73.5137*1i;
ZL2=33.9292*1i;
ZC1=-17.6839*1i;
ZC2=-27.205*1i;

%Matice soustavy
A=[(ZL2+R2+ZL1+R1) -ZL2 (-ZL1-R2);
    -ZL2 (ZL2+ZC1) -ZC1;
    (-R2-ZL1) -ZC1 (ZC1+ZC2+ZL1+R2)];

ds=det(A);

b = [-U1 -U2 0];
I = b/A;

Ia = I(1);
Ib = I(2);
Ic = I(3);

uc2=Ic*ZC2

Uc2_RE = real(uc2);
Uc2_IM = imag(uc2);
UC2=sqrt((Uc2_RE*Uc2_RE)+(Uc2_IM*Uc2_IM))

anglerad=atan(Uc2_IM/Uc2_RE)
angledeg=rad2deg(anglerad)




