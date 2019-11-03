clc;
close all;
clear all;
k= [10 20 50 100]
b=tf(1,[1 1 0]);
for i= 1:length(k);
    a=tf([11 k(i)],[1]);
    h(i)=feedback(series(b,a),1);
    subplot(4,3,(3*i-3)+1);
    step(h(i));
    str=sprintf('response without disturbance k=%d',k(i));
    title(str);
    stepinfo(h(i))
end
for i= 1:length(k)
   a=tf([11 k(i)],[1]);
   h=feedback(b,-1*a,+1);
   subplot(4,3,(3*i-3)+2);
   step(h);
    str=sprintf('k=%d',k(i));
    title(str);
    stepinfo(h)
end

for i= 1:length(k)
   a=tf([11 k(i)],[1]);
   e=feedback(series(b,a),1);
   f=feedback(b,-1*a,+1);
   h= e+f;
   subplot(4,3,(3*i-3)+3);
   step(h);
    str=sprintf('k=%d',k(i));
    title(str);
    stepinfo(h)
end

