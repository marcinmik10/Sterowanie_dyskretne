clc; clear; clf;
%% a)
Ts=1;
L=2;
M=[3 1];
G=tf(L,M)
GdZ= c2d(G,Ts,'zoh'); % ekstrapolator zerowego rzędu, bedziemy korzystac bo w czasie rzeczywstym najlepsza 
GdF= c2d(G,Ts, 'foh'); % myli sie dodatnio %foh i tustin minimalizuja blad
GdT= c2d(G,Ts, 'tustin'); % myli sie ujemnie 

step(G,GdZ,GdF, GdT);

%% b)
Ts = [0.1 0.5 1 2 20];  % Sampling times
GdZ1 = cell(1, length(Ts));
GdZ2 = cell(1, length(Ts));

for k = 1:numel(Ts)
    GdZ1{k} = c2d(G, Ts(k), 'zoh');
    GdZ2{k} = tf(L,M, Ts(k)); %dla dyskretnych trzeba podac czas

end

figure, step(GdZ1{:})
figure, bode(GdZ1{:})
figure, nyquist(GdZ1{:})

figure, step(GdZ2{:})
figure, bode(GdZ2{:})
figure, nyquist(GdZ2{:})
%obiekt stabilny asymptotycznie
