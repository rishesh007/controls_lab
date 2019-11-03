clc;
clear all;
close all;
s = tf('s');
G1 = 11*s;
G2 = 1/(s*(s+1));
k = [10 20 50 100];
for i = 1:length(k)
    Y(i) = feedback(series(parallel(k(i),G1),G2),1);
    subplot(2,4,i),step(Y(i));
    str = sprintf('K = %d',k(i));
    title(str);
    str = sprintf('Y(%d)',i);
    disp(str);
    stepinfo(Y(i))
end

% for i = 1:length(k)
%     S(i) = feedback(series(parallel(parallel((1/s),G1),k(i)),G2),1);
%     subplot(2,6,4 +i),step(S(i));
%     str = sprintf('K = %d',k(i));
%     title(str);
%     str = sprintf('S(%d)',i);
%     disp(str);
%     stepinfo(S(i))
% end

for i = 1:length(k)
    H(i) = parallel(k(i),G1);
    R(i) = feedback(G2,H(i));
    subplot(2,4,4 +i),step(R(i));
    str = sprintf('K = %d',k(i));
    title(str);
    str = sprintf('R(%d)',i);
    disp(str);
    stepinfo(R(i))
end