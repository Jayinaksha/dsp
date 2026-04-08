%% EXP_4_AIM_1 
x = [0 1 2 3]; 
N = length(x); 
X = zeros(1,N); 
%DFT calculation 
for k = 0:N-1 
for n = 0:N-1 
X(k+1) = X(k+1) + x(n+1)*exp(-1j*2*pi*k*n/N); 
end 
end 
%IDFT calculation 
x_new = zeros(1,N); 
for n = 0:N-1 
for k = 0:N-1 
x_new(n+1) = x_new(n+1) + X(k+1)*exp(1j*2*pi*k*n/N); 
end 
end 
disp('DFT result using formula:') 
disp(X) 
disp('IDFT result using formula:') 
disp((1/4)*x_new) 
%% AIM_2 
clc; 
clear; 
x =[0 1 2 3]; 
N = length(x); 
n = 0:N-1; 
k = n'; 
W = exp(-1j*2*pi/N); 
F = W.^(k*n); 
 
X = F*x'; 
disp('DFT result using matrix method:') 
disp(X) 
F_inv = (1/N) * conj(F); 
x_reconstructed = F_inv * X; 
disp('IDFT result using matrix method:') 
disp(x_reconstructed) 
%% EXP_4_AIM_4_PART_1 
x=[0 1 2 3]; 
N=length(x); 
x=bitrevorder(x); 
%DIT FFT 
for s=1:log2(N) 
   m=2^s; 
   wm=exp(-1j*2*pi/m); 
   for k=1:m:N 
       w=1; 
       for j=0:m/2-1 
           t=w*x(k+j+m/2); 
           u=x(k+j); 
           x(k+j)=u+t; 
           x(k+j+m/2)=u-t; 
           w=w*wm; 
       end 
   end 
end 
disp('DIT-FFT result:') 
X_fft = x; 
disp('DIT-FFT using inbuit method result:') 
X_builtin = fft([0 1 2 3]);
%% EXP_4_AIM_4_PART_2 
x=[6.0000 + 0.0000i  -2.0000 + 2.0000i  -2.0000 - 0.0000i  -2.0000 - 2.0000i]; 
N=length(x); 
%DIT IFFT 
for s=log2(N):-1:1 
   m=2^s; 
   wm=exp(1j*2*pi/m); 
   for k=1:m:N 
       w=1; 
       for j=0:m/2-1 
           u=x(k+j); 
           v=x(k+j+m/2); 
           x(k+j)=u+v; 
           x(k+j+m/2)=(u-v)*w; 
           w=w*wm; 
       end 
   end 
end 
x_dit=bitrevorder(x); 
 
disp('The DIT-IFFT result is ') 
x_dit = x_dit/4; 
disp('DIT-IFFT using inbuit method result:') 
X_builtin = ifft([6.0000 + 0.0000i  -2.0000 + 2.0000i  -2.0000 - 0.0000i  -2.0000 - 2.0000i]); 
%% EXP_4_AIM_4_PART_3 
x=[0 1 2 3]; 
N=length(x); 
%DIF FFT 
for s=log2(N):-1:1 
   m=2^s; 
   wm=exp(-1j*2*pi/m); 
   for k=1:m:N 
       w=1; 
       for j=0:m/2-1 
           u=x(k+j); 
           v=x(k+j+m/2); 
           x(k+j)=u+v; 
           x(k+j+m/2)=(u-v)*w; 
           w=w*wm; 
       end 
   end 
end 
x_dit=bitrevorder(x); 
disp('The DIF-FFT result is ') 
x_dit; 
disp('The DIF-FFT using inbuilt method result is ') 
X_builtin = fft([0 1 2 3]); 
%% EXP_4_AIM_4_PART_4 
x=[6.0000 + 0.0000i  -2.0000 + 2.0000i  -2.0000 - 0.0000i  -2.0000 - 2.0000i]; 
N=length(x); 
x=bitrevorder(x); 
%DIT FFT 
for s=1:log2(N) 
   m=2^s; 
   wm=exp(1j*2*pi/m); 
   for k=1:m:N 
       w=1; 
       for j=0:m/2-1 
           t=w*x(k+j+m/2); 
           u=x(k+j); 
           x(k+j)=u+t; 
           x(k+j+m/2)=u-t; 
           w=w*wm; 
       end 
   end 
end 
disp('The DIF-IFFT result is ') 
X_fft=x/4; 
 
disp('The result using DIF-IFFT inbuit method is ') 
X_builtin = ifft([6.0000 + 0.0000i  -2.0000 + 2.0000i  -2.0000 - 0.0000i  -2.0000 - 2.0000i]);