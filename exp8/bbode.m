clc;
close all;
clear all;
s = tf('s');
G = 100/(s+30);
Y = 100*(s+1)/((s+5)*(s+75));
% subplot(2,1,1),bode(G);
% grid on;
% subplot(2,1,2),bode(Y) ;
% grid on;
% sisotool(G);
% sisotool(Y);
G = 1/s;
bode(G);