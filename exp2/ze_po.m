clc;
clear all;
close all;
% making direct function
s = tf('s');
H = (s+2)/(s^2+s+2);
% using coefficients
num = [0 1 2];
den = [1 1 2];
h = tf(num,den);
% poles, zeros and gain
[z,p,k] = tf2zpk(num,den);
% regenrate transfer function
[b,a] = zp2tf(z,p,k);
%pzmap(h);
%step(H);
impulseplot(H);