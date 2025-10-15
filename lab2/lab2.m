Tosc=2.2;
Ti= 0.5 * Tosc;
Td= 1.125 * Tosc;
Kr=55/3;
Kp=0.6*Kr;

% Kp = 0.6*Kkr;
% Kp=11;

%przeregulowanie zawsze jako procent, dopuszczalne przeregulowanie 


%%%%%%% dyskretnie
Ts=1;
tp=1;

l=3;
m=[1 7 8 1];
Kp=0.6*Kr*(1-tp/Tosc);
% Td

[ld, md]=c2dm(l,m,tp, 'zoh');
G=tf(1,m);
Gd=c2d(G,tp);

%%%%%%%% PID
