clc;
clear all;
close all;
%transfer Functions
G1 = tf([1 0 1],[1 1 4]);
G2 = tf([0 1 1 2],[1 1 1 4]);
H = tf([0 0 1],[500 0 0]);

%series connection
Y1 = series(G1,G2)
%unity feedback connection
Y2 = feedback(Y1,1)
%parallel connection
Y3 = parallel(G1,G2)
%feedback connection
Y4 = feedback(G1,H)
