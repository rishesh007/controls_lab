clc; clear all; close all;
s = tf('s');
g1 = 0.5;
g2 = 4/(s+3);
g3 = -2/(-s+1);
h = 1/(s+10);
Y = series(feedback(series(g1,g2),1),g3);
rlocus(Y*h);