clc;
close all;
clear all;
c1 = 1; c2 = 2; r1 = 1; r2 = 2;
g1 = tf([0 1],[c1 0]);
g2 = tf(1/r1);
g3 = tf([0 1],[c2 0]);
g4 = tf(1/r2);
g34 = series(g3,g4);
gh34 = feedback(g34,1);
g2t = series(gh34,g2);
gh2t = feedback(g2t,r2);
gt = series(gh2t,g1);
gf = feedback(gt,1/gh34)
cal_gf = tf([0 0 1],[4 7 1])
gf-cal_gf