close all
clear

% Deklarering av parametre 
c1 = 0.05;
c2 = 8e-5;
a1 = 5;
a2 = 0.8;

% Likvektspunkt
l_hare = a2/c2;
l_rev = a1/c1;

% Initialverdier - endre disse
start_harer = l_hare*1.2; 
start_rever = l_rev*0.2;	 

% Kj?r simuleringen og hent ut uline?r l?sning
sim harerev
tid = ulinmod.Time;
ulin_harer = ulinmod.Data(:,1);
ulin_rever = ulinmod.Data(:,2);

% Linearisering - utledet i ?ving 3
lengde = length(tid);
PHI = zeros(2,2,lengde);
lin_harer = zeros(lengde,1);
lin_rever = zeros(lengde,1);

for i=1:length(tid)
PHI(1,1,i) = cos(sqrt(a1*a2)*tid(i));
PHI(1,2,i) = -sqrt(a2/a1)*(c1/c2)*sin(sqrt(a1*a2)*tid(i)) ;
PHI(2,1,i) = sqrt(a1/a2)*(c2/c1)*sin(sqrt(a1*a2)*tid(i)); 
PHI(2,2,i) = cos(sqrt(a1*a2)*tid(i));

lin_harer(i) = l_hare + PHI(1,:,i)*[(start_harer-l_hare);(start_rever-l_rev)];
lin_rever(i) = l_rev + PHI(2,:,i)*[(start_harer-l_hare);(start_rever-l_rev)];
end

%Plotting av uline?r modell
figure(1); subplot(1,2,1);
plot(tid, ulin_harer);
grid;
xlabel('Tid');
ylabel('Antall harer');
title('Tidsforl{\o}p for harer')
subplot(1,2,2);
plot(tid, ulin_rever);
grid;
xlabel('Tid');
ylabel('Antall rever');
title('Tidsforl{\o}p for rever');

%Plotting av uline?r og line?r modell
figure(2)
subplot(1,2,1);
hold on
plot(tid,lin_harer,'k--'); %line?re kurver med stiplede linjer
plot(tid,ulin_harer,'k-');		 %uline?re kurver med heltrukkede linjer	
grid;
legend('Lin. model','Ulin. model')
xlabel('Tid');
ylabel('Antall harer');
title('Tidsforl{\o}p for harer')
hold off

subplot(1,2,2);
hold on
plot(tid,lin_rever,'k--'); %line?re kurver med stiplede linjer
plot(tid,ulin_rever,'k-');		 %uline?re kurver med heltrukkede linjer	
grid;
legend('Lin. model','Ulin. model')
xlabel('Tid');
ylabel('Antall rever');
title('Tidsforl{\o}p for rever')
hold off