close all
clear

% Deklarering av parametre
T1 = 0.064;
T2 = 0.01;
Td = T1;
%K = 1/(4*T1);
K = 1/T1;

if K >= 1/(4*T1)
    alpha = 1/(2*T1);
    beta = alpha*sqrt(4*T1*K-1);
else
    lambda1 = -1/(2*T1) * (1 + sqrt(1-4*T1*K));
    lambda2 = -1/(2*T1) * (1 - sqrt(1-4*T1*K));
end
    
simtime = 1; % Simuleringstid

% Deklarering av referanseverdi
y0 = 1;

% Utregning av verdier
w0 = sqrt(alpha^2 + beta^2);
zeta = alpha / w0;

% w0 = 0.5000

n = [K*Td K];
d = [T1 1 0];

sim('likestromsmotor'); % hp1

figure(1);
plot(y);
grid on;
hold on;

K = 1/(4*T1);
n = [K];

sim('likestromsmotor'); % hp1
plot(y)
grid on;
hold on;

%sim('likestromsmotor2'); % hp2
%plot(y2);
grid on;

len = length(y.Time)-1;
square_error = 0;
rms = 0;
biggest_square_error = 0;
time = 0;
sqr_err_y = 0;
sqr_err_y2 = 0;
for i=1:len
    square_error = (y.Data(i) - y2.Data(i))^2;
    rms = rms + square_error;
    if square_error > biggest_square_error
        biggest_square_error = square_error;
        time = y.Time(i);
        sqr_err_y = y.Data(i);
        sqr_err_y2 = y2.Data(i);
    end
end
biggest_square_error;
biggest_error = sqrt(biggest_square_error);
rms = rms/len;
rms;
hline = refline([0 sqr_err_y]);
hline.Color = 'k';
hline = refline([0 sqr_err_y2]);
hline.Color = 'k';