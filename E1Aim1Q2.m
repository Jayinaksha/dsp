%Part a) 
n = -20:100;
x = zeros(1,length(n)); 
y = zeros(1,length(n));
for k = 1:length(n) 
if n(k)==0
x(k)=1;
end
end
for k = 3:length(n)
y(k) = x(k) + y(k-1) - 0.9*y(k-2);
end
stem(n,y,'filled'); grid on; 
title('Impulse Response h(n)');
%% 
%Part b) 
x = zeros(1,length(n)); 
y = zeros(1,length(n));
for k = 1:length(n) 
if n(k)>=0
x(k)=1;
end
end
for k = 3:length(n)
y(k) = x(k) + y(k-1) - 0.9*y(k-2);
end
stem(n,y,'filled'); grid on; 
title('Unit Step Response s(n)');