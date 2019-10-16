clc;
clear all;
close all;
num1 = [1 0 1];
den1 = [1 1 4];
h1 = tf(num1,den1);
[z1,p1,k1] = tf2zpk(num1,den1);
num2 = [0 1 1 2];
den2 = [1 1 1 4];
h2 = tf(num2,den2);
[z2,p2,k2] = tf2zpk(num2,den2);
G1 = zpk(z1,p1,k1);
G2 = zpk(z2,p2,k2);
T = G1 + G2;
T1 = parallel(G1,G2)