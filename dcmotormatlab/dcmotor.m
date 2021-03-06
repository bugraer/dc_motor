clear
Vt=25;
Rs=0.15;
P_rated=100;
V_rated = 24;
Ra = 0.1;
Rf = 0.8;
Km= 0.031;
n = 0:1300;
w = 2*pi*n/60;
Ia = Vt ./(Ra+Rf+Rs+Km*w);
I_rated = P_rated/V_rated;
figure(1);
plot(n,Ia,'k',n,I_rated*ones(1,size(n,2)),'k--');
ylim([0 25])
legend('Motor ak�m',' Anma Ak�m�');
xlabel('motor h�z�');
ylabel('Motor Ak�m�');
title(['Baslama Akimi', num2str(Ia(1)),'A']);
Ea = Km * Ia .* w;
Pout = Ia.* Ea;
figure (2);
plot(n,Pout, 'k',n,P_rated*ones(1,size(n,2)),'k--');
legend('C�k�s Gucu',' Anma G�c�');
xlabel('motor h�z�');
ylabel('Mekanik Cikis Gucu');
nrated = 0;
k=size(n,2);
while(nrated ==0)
    if Pout(k) >= P_rated
        nrated = k;
    end
    k=k-1;
end
Tout = Km * Ia.^2;
figure(3);
plot(n,Tout,'k')
xlabel('Motor H�z�');
ylabel('Motor Torku');
title(['Baslama Torku',num2str(Tout(1)),'Nm']);
