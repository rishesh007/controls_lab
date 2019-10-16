clc;
close all;
clear all;
p = [0.5, 1, 2, 4, 5, 7];
ze = [0.1 ,1, 3, 5, 7, 8];
wn = 1;
z = 0.2;
G = tf([0 0 wn],[1 2*z 0]);
Y = feedback(G,1);
for i=1:6
    k = tf([0 1],[1 p(i)]);
    h(i) = series(Y,k);
    Y = h(i);
end
Y
for i=1:6
    k = tf([1 ze(i)],[0 1]);
    h(i) = series(Y,k);
    Y = h(i);
    subplot(2,3,i),step(h(i))
    str = sprintf('Adding zero at %f',ze(i));
    title(str);
    hold on;
end
hold off;