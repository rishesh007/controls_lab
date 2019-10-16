clc;
clear all;
close all;
K = 10.8E8;
num1 = K*[1 1];
den1 = [1 8];
num2 = [1];
den2 = 0.8*K*[2 0 0];
den3 = 0.5*K*[2 0 0];
c1 = tf(num1,den1);
sc1 = tf(num2,den2);
sc2 = tf(num2,den2);
g3 = series(c1,sc2);
transfer = feedback(g3,1);
g2 = series(c1,sc1);
transfer2 = feedback(g2,1);
step(transfer2);
xlabel('time'),ylabel('Amplitude');
title('Step Response for 50% change in step input');