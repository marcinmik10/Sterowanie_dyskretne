% c2dm
% filt
% sum
clear all;
clc;


L=40;
M=[1 2 20];
tp=0.1;

[Ld1,Md1]=c2dm(L,M,tp,'zoh');

H=filt(Ld1,Md1,tp) %Discrete-time transfer function.

G=tf(Ld1,Md1,tp); %obiekt
q0=1/(sum(Ld1));
q=q0.*Md1;
p=-q0.*Ld1;
p(1)=1;
q;
p;
Gr=tf(q,p,tp) %regulator

L2=3;
M2=[1 7 8 1];
[Ld2,Md2]=c2dm(L2,M2,tp,'zoh');
H2=filt(Ld2,Md2,tp) %Discrete-time transfer function.

G2=tf(Ld2,Md2,tp); %obiekt
q02=1/(sum(Ld2));
q2=q02.*Md2;
p2=-q02.*Ld2;
p2(1)=1;
q2;
p2;
Gr2=tf(q2,p2,tp) %regulator
Ts=tp;
set_param(gcb,'SampleTime', 'Ts')


% 
% Tp=0.1;
% L1=40;
% M1=[1 2 20];
% L2=3;
% M2=[1 7 8 1];
% 
% Gs1=tf(L1,M1);
% Gs2=tf(L2,M2);
% H=filt()
% 
% [ld1 md1]=c2dm(L1,M1,Tp,'zoh');
% Go1 = tf(ld1, md1, 0.1) % transmitancje z c2d
% lr1=md1;
% mr1_1=sum(ld1);
% mr1_2=-ld1(2:end);
% mr1=[mr1_1 mr1_2];
% Gr1 = tf(lr1, mr1, 0.1)
% 
% [ld2 md2]=c2dm(L2,M2,Tp,'zoh');
% Go2 = tf(ld2, md2, 0.1)
% lr2=md2;
% mr2_1=sum(ld2);
% mr2_2=-ld2(2:end);
% mr2=[mr2_1 mr2_2];
% Gr2 = tf(lr2, mr2, 0.1)
% 
% %%%%%%%%%%%%%%%%%%%%%%%%
% 
% l1=40;
% m1= [1 2 20];
% Tp1=0.1;
% l2=50;
% m2=[1 10 50];
% Tp2=0.05;
% l3=3;
% m3=[1 7 8 1];
% Tp3=0.1;
% 
% [ld1 md1]=c2dm(l1,m1,Tp1,'zoh');
% [ld2 md2]=c2dm(l2,m2,Tp2,'zoh');
% [ld3 md3]=c2dm(l3,m3,Tp3,'zoh');
% 
% Go1 = tf(ld1, md1, 0.1) % transmitancje z c2d
% lr1=md1;
% mr1_1=sum(ld1);
% mr1_2=-ld1(2:end);
% mr1=[mr1_1 mr1_2];
% Gr1 = tf(lr1, mr1, 0.1)
% 
% Go2 = tf(ld2, md2, 0.1)
% lr2=md2;
% mr2_1=sum(ld2);
% mr2_2=-ld2(2:end);
% mr2=[mr2_1 mr2_2];
% Gr2 = tf(lr2, mr2, 0.1)
% 
% Go3 = tf(ld3, md3, 0.1) 
% lr3=md3;
% mr3_1=sum(ld3);
% mr3_2=-ld3(2:end);
% mr3=[mr3_1 mr3_2];
% Gr3 = tf(lr3, mr3, 0.1)
