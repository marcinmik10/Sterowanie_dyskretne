clc

clear all variables

Kkr=18.2;

Tosc=3.13;


Kp=0.6*Kkr


Ti=0.5*Tosc


Td=0.125*Tosc




tp=1;

L=[3];
M= [1 7 8 1];




G=tf(L,M)

Kkr1=4.93;

Gd=c2d(G,tp,'zoh')

[ld,md]=c2dm(L,M,tp,'zoh')

% Tosc1=18.994/4

Tosc1=4.9;

Kp1=0.6*Kkr1*(1-tp/Tosc1)
Ti1=0.5*(Tosc1/tp-1)
Td1=0.125*(Tosc1/tp)^2/(Tosc1/tp-1)





