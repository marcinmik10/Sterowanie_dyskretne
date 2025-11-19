clear all
clc

Tp=0.1;
L1=40;
L2=3;
M1=[1 2 20];
M2=[1 7 8 1];

Gs1=tf(L1,M1);
Gs2=tf(L2,M2);

Gz1=c2d(Gs1,Tp,'zoh');
Gz1=tf(Gz1.Numer,Gz1.Denom,Gz1.Ts,'Variable','z^-1');
Gz2=c2d(Gs2,Tp,'zoh');
Gz2=tf(Gz2.Numer,Gz2.Denom,Gz2.Ts,'Variable','z^-1');

[ld1,md1]=tfdata(Gz1);
[ld2,md2]=tfdata(Gz2);

ld1=ld1{1};
ld1(1)=[];
md1=md1{1};
q01=0;
for i=1:length(ld1)
    q01=q01+ld1(i);
end
q01=1/q01;
Lr1=q01*md1;
Mr1=[1 -ld1*q01];

ld2=ld2{1};
ld2(1)=[];
md2=md2{1};
q02=0;
for i=1:length(ld2)
    q02=q02+ld2(i);
end
q02=1/q02;
Lr2=q02*md2;
Mr2=[1 -ld2*q02];

out = sim("simlab5");
t=out.t.data;
Go1=out.Go1.data;
Go2=out.Go2.data;
Gr1=out.Gr1.data;
Gr2=out.Gr2.data;
Y1=out.Y1.data;
Y2=out.Y2.data;

figure('Name','Obiekt 1 deadbeat')
S1=stairs(t,[Go1,Gr1,Y1]);
S1(2).LineWidth=2;
S1(3).LineWidth=2;
title('Obiekt 1','FontSize',20)
xlabel('t [s]','FontSize',16)
grid on
legend('Go1','Gr1','Y1','FontSize',12)

figure('Name','Obiekt 2 deadbeat')
S2=stairs(t,[Go2,Gr2,Y2]);
S2(2).LineWidth=2;
S2(3).LineWidth=2;
title('Obiekt 2','FontSize',20)
xlabel('t [s]','FontSize',16)
grid on
legend('Go2','Gr2','Y2','FontSize',12)