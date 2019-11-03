clc;
close all;
clear all;
k = [10 20 50 100];
s = tf('s');
G = 1/(s*(s+1));
G1 = 11*s;
for i=1:4
    t = parallel(G1,k(i));
    Y(i) = feedback(series(t,G),1);
%     subplot(2,2,i),step(Y);
%     str = sprintf('K = %d',k(i));
    stepinfo(Y(i))
%     title(str);
end

for i=1:4
    t = parallel(G1,k(i));
    YY(i) = feedback(G,t);
%     subplot(2,2,i),step(YY);
%     str = sprintf('K = %d',k(i));
%     title(str);
    stepinfo(YY(i))
end

for i=1:4
    YYY = parallel(Y(i),YY(i));
    subplot(2,2,i),step(YYY);
    str = sprintf('K = %d',k(i));
    title(str);
   stepinfo(YYY)
end

