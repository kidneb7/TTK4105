%Maxon RE30 12V motor data

R_a = 0.198; %Ohm
L_a = 0.0345e-3; % H
K_T = 13.9e-3; %Nm/A
K_v = 1/(685*2*pi/60); %V/rad
J = 3.35e-6; %kg*m^2
tau_m = 3.42e-3; %sec
B = J/tau_m; %kg*m^2*rad/sec
n = 1/12;

% Reg
%K_p = 1*10^((38.5-1*(7.08+6.02))/20);

