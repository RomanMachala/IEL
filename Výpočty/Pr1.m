%Stanovení napětí UR2 a IR2 za pomocí metody postupného zjednodušování
clc
clear

%Zadané hodnoty:
U1=115; %[V]
U2=55;  %[Ohm]
R1=485; %[Ohm]
R2=660; %[Ohm]
R3=100; %[Ohm]
R4=340; %[Ohm]
R5=575; %[Ohm]
R6=815; %[Ohm]
R7=255; %[Ohm]
R8=225; %[Ohm]

%Sečtení sériově zapojených zdrojů
U=U1+U2; %[V]

%Součet paralelně zapojených rezistorů R2 a R3
R23=(R2*R3)/(R2+R3); %[Ohm]

%Součet sériově zapojených rezistorů R6 a R8
R68=R6+R8; %[Ohm]

%Převod z trojúhelníku na hvězdu
Ra=R4;  %[Ohm]
Rb=R5;  %[Ohm]
Rc=R23; %[Ohm]

R10=(Ra*Rc)/(Ra+Rb+Rc); %[Ohm]
R20=(Ra*Rb)/(Ra+Rb+Rc); %[Ohm]
R30=(Rb*Rc)/(Ra+Rb+Rc); %[Ohm]

%Součet sériově zapojených rezistorů (R10 a R1, R20 a R7, R30 a R68)
R101=R10+R1;   %[Ohm]
R3068=(R30+R68); %[Ohm]
R207=R20+R7;   %[Ohm]

%Součet paralelně zapojených rezistorů R3068 a R207
Ri=(R207*R3068)/(R207+R3068); %[Ohm]

%Výpočet finálního rezistoru REKV
REKV=Ri+R101; %[Ohm]

%Výpočet proudu protékajícího obvodem dle Ohmova zákona
I=U/REKV; %[A]

%Postupné rozkládání a dopočitávání napětí na jednotlivých rezistorech
UR101=I*R101; %[V]
URi=I*Ri;     %[V]

%Výpočet proudů, protékajících reizistory R207 a R3068
I1=URi/R207;  %[A]
I2=URi/R3068; %[A]

%Výpočet napětí na rezistorech po dalším rozložení
UR1=I*R1;   %[V]
UR68=I2*R68; %[V]
UR7=I1*R7;   %[V]

%Přechod z hvězdy zpět na trojúhelník
RA=R10+R20+((R10*R20)/R30);  %[Ohm]
RB=R20+R30+((R20*R30)/R10);  %[Ohm]
RC=R10+R30+((R10*R30)/R20);  %[Ohm]

%Sestavení rovnic dle II.Kirchhoffova zákona
%A: -U+UR1+UR4+UR7=0
%B: -U+UR1+UR2+UR6+UR8=0  (UR6+UR8=UR68)
%C: -UR4+UR3+UR5=0

%Z rovnice A vyjádříme UR4:
UR4=U-UR1-UR7;  %[V]

%Z rovnice B vyjádříme UR2 (UR2=UR3):
UR2=U-UR1-UR68 %[V]

%Dosadíme hodnoty UR4 a UR3 (=UR2) do rovnice C a vyjádříme UR5:
UR3=UR2;      %[V]
UR5=-UR3+UR4; %[V]

%Z Ohmova zákona vypočítáme proud protékající rezistorem R2 R3 a R4:
IR2=UR2/R2  %[A]
IR3=UR3/R3; %[A]
IR4=UR4/R4; %[A]


