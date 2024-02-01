clc 
clear
%Stanovení napětí a proudu pomocí Théveninovy věty, př. 2.

%Zadané hodnoty:
U=50;   %[V]
R1=100; %[Ohm]
R2=525; %[Ohm]
R3=620; %[Ohm]
R4=210; %[Ohm]
R5=530; %[Ohm]

%Výpočet sériového zapojení rezistorů 1,2 a 3.
R123=R1+R2+R3; %[Ohm]

%Uplatnění Théveninovy věty pro výpočet napětí na svorkách
U0=U*(R4/(R4+R123)); %[V]

%Výpočet hodnoty rezistoru Ri (paralelní zapojení R123 a R4)
Ri=(R123*R4)/(R123+R4); %[Ohm]

%Výpočet UR5 (napětí na rezistrou R5 pomocí Théveninovy věty)
UR5=U0*(R5/(R5+Ri)) %[V]

%Výpočet velikosti proudu protékajícího rezistorem R5 (Ohmův zákon)
IR5=(UR5/R5)*10^3   %[mA]

