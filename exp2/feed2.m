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
num3 = [0 0 1];
den3 = [500];
h2 = tf(num2,den2);
[z3,p3,k3] = tf2zpk(num3,den3);
G1 = zpk(z1,p1,k1);
G2 = zpk(z2,p2,k2);
H1 = zpk(z3,p3,k3);
Y = feedback(G1,H1);
