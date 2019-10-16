clc;
clear all;
close all;
tspan = [0 5];
y0 = 1;
[t,y] = ode15i(@(t,y) -10*t,tspan,y0);
plot(t,y,'-o');
title('Analysis of ODE using @ode15i');
xlabel('time(s)'),ylabel('y(t)');