clc;
close all;
clear;

% Parametre
T1=4;  
T2=1.5;   
svar ='j';

disp('Tast inn verdien til K og avslutt med Enter.');
disp(' ');

while strcmp(svar,'j'),

   K=input(' K :');
   
   num=K;
   den=[T1*T2 (T1+T2) 1 K];
   sys=tf(num,den);  

   figure(1);
   hold on 
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   % LEGG TIL DEN ENE PROGRAMMLINJEN HER
   bode(sys);

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  figure(2);
  hold on
  step(sys); 	% sprangrespons
  svar=input('En gang til (j/n) ?','s');

end

