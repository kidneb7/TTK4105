% Variable til bruk i øvingen.
Ra = 0.4;
La = 0.004;
Kt = 0.5;
Kv = 1.0;
J  = 0.08;
B  = 0.8;
Kp = 10;
Theta0 = 0;
TL = 0;
R = 10000;
C = 100*10^-6;
U = 5;

[str,err]= sprintf('Ra=%6.2f, La=%6.3f, Kt=%6.2f, \nKv=%6.2f, J=%6.2f, B=%6.2f, \nKp=%6.2f',...
    Ra, La, Kt, Kv, J, B, Kp);
disp(str);