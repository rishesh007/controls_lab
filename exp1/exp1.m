clc;
close all;
clear all;
[t,v] = ode45(@asdf,0:200,0);
plot(t,v);
title('Analysis of Physical System using @ode45');
xlabel('time(s)'),ylabel('v(t)');