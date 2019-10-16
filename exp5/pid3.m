clc; clear; close all;
Gs = tf([0 0 400],[1 50 0 ]);
Y = feedback(Gs,1);
% step(Y);

Kp = [2 10 40 50];
for i = 1:length(Kp)
    t = tf([Kp(i)],[1]);
    s = series(t,Gs);
    C(i) = feedback(s,1);
    str = sprintf('kp = %d ',Kp(i));
    subplot(2,2,i),step(C(i));
    title(str);
end

k=1;
Kpp = [2 6 10];
Ki = [0.1 10 60];
for i = 1:length(Kpp)
    tp(i) = tf([Kpp(i)],[1]);
    for j = 1:length(Ki)
        ti(j) = tf([Ki(j)],[1 0]);
        a = parallel(tp(i),ti(j));
        se(k) = series(Gs,a);
        R(k) = feedback(se(k),1);
        str = sprintf('kp = %d and ki = %d',Kpp(i),Ki(j));
        subplot(3,3,k),step(R(k));
        title(str);
        k = k+1;
    end
end


k=1;
kii = [0.1 1 5];
kppp = 10;
kd = [0.1 1 10];
tpp = tf([kppp],[1]);
for i = 1:length(kii)
    tii(i) = tf([kii(i)],[1 0]);
    for j = 1:length(kd)
        td(j) = tf([kd(j) 0],[0 1]);
        a = parallel(tii(i),parallel(td(j),tpp));
        see(k) = series(Gs,a);
        Re(k) = feedback(see(k),1);
        str = sprintf('kp = %d, ki = %0.2f and kd = %0.2f',kppp,kii(i),kd(j));
        subplot(3,3,k),step(Re(k));
        title(str);
        k = k+1;
    end
end