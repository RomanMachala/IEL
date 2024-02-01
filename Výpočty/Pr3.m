clc
clear
%Stanovení napětí a proudu pomocí metody uzlových napětí.

%Zadané hodnoty:
U=160;      %[V]
I1=0.65;    %[A]
I2=0.45;    %[A]
R1=46;      %[Ohm]
R2=41;      %[Ohm]
R3=53;      %[Ohm]
R4=33;      %[Ohm]
R5=29;      %[Ohm]

%Převedeme napětový zdroj na proudový
I3=U/R1;

%Převedeme odpory na vodivost:
G1=1/R1;    %[S]
G2=1/R2;    %[S]
G3=1/R3;    %[S]
G4=1/R4;    %[S]
G5=1/R5;    %[S]

%Sestavíme matici soustavy:
A=[(-G1-G2-G3) G2 0;
    G2 (-G2-G4) G4;
    0 G4 (-G4-G5)];
%5ešíme pomocí Sarrusova a Cramerova pravidla
b=[-I3 I2 I1-I2];

U=b/A;

%Vypočtené jednotlivá napětí.
UA=U(1);    %[V]
UB=U(2);    %[V]
UC=U(3);    %[V]

%Nyní vypočítáme napětí na rezistoru R4:
UR4=UB-UC;  %[V]

%Pomocí Ohmova zákona vypočítáme proud protékající tímto rezistorem:
IR4=UR4/R4; %[A]