s = tf('s');
h_u = (K_T)/((J*L_a)*(s^3)+(J*R_a+B*L_a)*(s^2)+(R_a*B+K_T*K_v)*s);

%h_r = K_p*(1+T_d*s)/(1+alpha*T_d*s);
h_r = (K_p)*(((1+T_d*s)*(1+T_i*s))/((1+a*T_d*s)*(T_i*s)));

h_0 = h_u * h_r;

[Gm, Pm, Wgm, Wpm] = margin(h_0);
margin(h_0);
%asymp(h_0, 100, 10000);

N = 1/(1+h_0);
%bode(N);
N_peak = getPeakGain(N);