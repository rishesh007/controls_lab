clc;
close all;
clear all;
z = [ 0.1 0.3 0.5];
tr = [];tp = [];
mp=[];ts = [];sv = [];
for i=1:3
h2 = feedback(tf([0 0 1],[1 2*z(i) 0]),tf([1],[1]));
tr(i) =  pi - acos(z(i))/sqrt(1-z(i)*z(i));
tp(i) = pi/sqrt(1-z(i)*z(i));
mp(i) = exp(-1*pi*z(i)/sqrt(1-z(i)*z(i)));
ts(i) = 4/z(i);
figure;
step(h2);
end
z = [ 1 2 ];
for i=1:2
h2 = feedback(tf([0 0 1],[1 2*z(i) 0]),tf([1],[1]));
figure;
step(h2);
end
