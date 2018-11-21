% dcmotor_varier_Kp.m
% Brukes i data?ving 3, oppgave 1
% Fyll inn 3 verdier for Kp her, og kj?r skriptet
clear all;
clf;

run mopar;

K_p = 100;
T_d = 1/(4.17*10^3*sqrt(0.1));
%T_d = 4.12*10^(-4);
Kp = K_p;
Td = T_d;
alpha = 0.1;
Ti = 11*10^(-3);
T_i = Ti;
a = alpha;

Kp1 = K_p;
Kp2 = 0.5*Kp1;
Kp3 = 1.5*Kp1;



%T_s = (2*(2*pi/180))/Wpm; % Husk å kjøre motor.m først slik at Wpm er i workspace
Kps = [Kp1, Kp2, Kp3];
legends = {['Kp=', num2str(Kp1)], ['Kp=',num2str(Kp2)], ['Kp=',num2str(Kp3)]};
for Kp=Kp1
	sim dcmotor
	figure(1); hold all;
	plot(motor_data.time, motor_data.signals.values(:,1));
	figure(2); hold all;
	plot(motor_data.time, motor_data.signals.values(:,2));
	figure(3); hold all;
	plot(motor_data.time, motor_data.signals.values(:,4));
end

figure(1);
title('Ankerstrom');
xlabel('tid'); ylabel('strom [A]');
legend(legends);
hold on;
figure(2);
title('Vinkelhastighet');
xlabel('tid'); ylabel('omega [radianer/s]');
legend(legends);
hold on;
figure(3);
title('Vinkel');
xlabel('tid'); ylabel('vinkel [grader]');
legend(legends);
hold on;

