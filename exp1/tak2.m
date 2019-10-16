clc 
clear all
close all
syms t;
theta(t) = 0.5235987756*cos(2.19089023*t);
t = 0:0.01:2*pi;
plot(t,theta(t));
title('Analysis of Physical System');
xlabel('time(s)'),ylabel('theta(t)');