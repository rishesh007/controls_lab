s = tf('s');
tp = [.5 1 2 4 5 7];
tz = [.1 1 3 5 7 8];
sys = 1/(s^2+2*0.2*s+1);
figure(1)
for i = 1:length(tp)
subplot(3,2,i)
step(sys)
sys = sys/(s-tp(i))
str = sprintf('pole added at s = %f',tp(i));
title(str);
end
32
figure(2)
for i = 1:length(tz)
subplot(3,2,i)
step(sys);
sys = sys*(s-tz(i))
str = sprintf('zero added at s = %f',tz(i));
title(str);
end