n = -10:10;
u = zeros(1,length(n));
for k = 1:length(n) 
if n(k) >= 0
u(k) = 1;
else
u(k) = 0;
end
end
stem(n,u,'filled'); grid on;
title('Unit Step Sequence'); xlabel('n'); ylabel('u(n)');
%% 
%Part b) 
n = -10:10;
r = zeros(1,length(n));
for k = 1:length(n) 
if n(k) >= 0
r(k) = n(k);
else
r(k) = 0;
end
end
stem(n,r,'filled'); grid on;
title('Ramp Sequence'); xlabel('n'); ylabel('r(n)');
%% 
%part c
n = -1:15;
a = 0.8;
x = zeros(1,length(n));
for k = 1:length(n) 
if n(k) >= 0
x(k) = a^n(k);
else
x(k) = 0;
end
end
stem(n,x,'filled'); grid on;
title('Exponential Sequence'); xlabel('n'); ylabel('x(n)');
%% 
%Part d(a) 
n = -5:5;
x = zeros(1,length(n));
for k = 1:length(n) 
if n(k) == -2
x(k) = 2;
elseif n(k) == 4 
x(k) = -1;
else
x(k) = 0;
end
end
stem(n,x,'filled'); 
xlabel('n'); ylabel('x(n)'); 
title('D(a)');grid on;
%% 
%d(b)
n = 0:20;
x = zeros(1,length(n));
for k = 1:length(n)
if n(k)>=0 && n(k)<10 
part1 = n(k);
else
part1 = 0;
end
if n(k)>=10 && n(k)<20
part2 = 10*exp(-0.3*(n(k)-10)); 
else
part2 = 0;
end
x(k) = part1 + part2;
end
stem(n,x,'filled'); 
xlabel('n'); ylabel('x(n)'); 
title('D(b)');
grid on;
%% 
%Part d(c) 
n = 0:50;
x = zeros(1,length(n)); 
w = zeros(1,length(n));
for k = 1:length(n) 
w(k) = randn;
x(k) = cos(0.04*pi*n(k)) + 0.2*w(k);
end 
stem(n,x,'filled');
xlabel('n'); ylabel('x(n)'); 
title('D(c)');
grid on;
%% 
n = -10:9;
x = zeros(1,length(n)); 
pattern = [5 4 3 2 1];
for k = 1:length(n) 
index = mod(n(k),5); 
if index < 0
index = index + 5;
end
x(k) = pattern(index + 1);
end
stem(n,x,'filled'); 
xlabel('n'); ylabel('x(n)'); 
title('D(d)');
grid on;
%% 
%Part e) 
n = 0:20;
x = zeros(1,length(n));
for k = 1:length(n)
x(k) = exp(1j*0.3*pi*n(k));
end
subplot(1,2,1) 
stem(n,real(x),'filled'); grid on; 
title('(E)Real Part');
subplot(1,2,2) 
stem(n,imag(x),'filled'); grid on; 
title('(E)Imaginary Part');
%% 
%Part f)
n = -20:20;
x = zeros(1,length(n)); 
for k = 1:length(n)
if n(k)>=0 && n(k)<10 
x(k)=1;
else
x(k)=0;
end
end
x_rev = fliplr(x); 
xe = zeros(size(x)); 
xo = zeros(size(x)); 
for k = 1:length(x)
xe(k) = (x(k) + x_rev(k))/2;
xo(k) = (x(k) - x_rev(k))/2;
end 
subplot(3,1,1)
stem(n,x,'filled'); title('(F)Original'); grid on; 
subplot(3,1,2)
stem(n,xe,'filled'); title('(F)Even Part'); grid on; 
subplot(3,1,3)
stem(n,xo,'filled'); title('(F)Odd Part'); grid on; 
