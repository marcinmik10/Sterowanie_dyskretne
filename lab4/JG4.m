set_param(gcb, 'SampleTime','Ts')
Ts = 1;
s=tf('s')
L1=[40];
M1=[s^2+2*s+20];
Ts1=0.1;



G1=tf(L1/M1)




Go1=c2d(G1, Ts1, 'zoh');

