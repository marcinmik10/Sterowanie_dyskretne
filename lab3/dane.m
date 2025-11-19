clc

clear all variables

l=1;
m=[8 1];
gc=tf(l,m,'inputdelay',3)
Ts=1;
gd= c2d(gc,Ts,'zoh')



Tp=1;






