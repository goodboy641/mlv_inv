function [Vin,Pout, Poutm, Ls, Ef, Efm, Vdc, Vdcm, Is, Xs, Vtln, Vtll, ma, delta, Load_Angle, pf, intangle1, intangle2, intangle3, intangle4, Lsm, THD_mean_frequency,Load_Nominal_Freq]  = loadsourcesettings(topology_type,ns,np)
ref_frequency = 2*pi*50;
Pout = 8000; %W
Poutm = Pout/(ns*np);
Ls = 13.8e-3; %will be decided based on topology
Lsm = Ls;
Ef = 155;
Efm = Ef/ns;
Vdc = 540;
Vdcm = Vdc/ns;
Is = Poutm/(3*np*Efm); % Aline
Xs = ref_frequency*Lsm; % Ohm
Vtln = sqrt(Efm^2+(Xs*Is)^2); % Vln
Vtll = Vtln*sqrt(3); % Vll
ma = (Vtll)/(Vdcm*0.612);
delta = 180*atan(Xs*Is/Efm)/pi;
Load_Angle = delta*pi/180;
pf = cos(Load_Angle);

interleaving_angle = 360/np;
intangle1 = 0;
intangle2 = intangle1 + interleaving_angle;
intangle3 =intangle1;
intangle4 = intangle2;
Rin = 1; %ohm
Vin = Vdc + Rin*(Pout/Vdc);
THD_mean_frequency = 10;
Load_Nominal_Freq = 50;


end