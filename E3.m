%Q - 1  
X1 = [2 3 4];  
X2 = [3 4 5 6];  
X3 = conv(X1,X2);  
disp(X3);  
%Q - 2  
syms z n   
X = (1+(0.4*sqrt(2)*z^(-1)))/(1-(0.8*sqrt(2)*z^(-1))+(0.64*z^(-2)));  
H = iztrans(X,z,n);  
pretty(H);  disp(H);  
X_num = [1 0.4*sqrt(2)];  
X_den = [1 0.8*sqrt(2) 0.64];  
[H1,t] = impz(X_num,X_den,20);  
subplot(4,2,1);  stem(t,H1);  
xlabel("time"); ylabel("Output Coefficients");  
title("Impulse Response"); grid on;  
%Q - 3  
Y_coeff = [1 -0.9];  
X_coeff = 1;  
subplot(4,2,2);  
zplane(X_coeff,Y_coeff);  
title("Pole zero plot");  
[H2,W] = freqz(X_coeff,Y_coeff,512); subplot(4,2,3);  
plot(W/pi,20*log10(abs(H2)));  
title("Magnitude Response");  
xlabel("Frequency");  
ylabel("Magnitude");  grid on;  
subplot(4,2,4);  
plot(W/pi,angle(H2));  
title("Phase Response");  
xlabel("Frequency"); ylabel("Phase");  
grid on;  
subplot(4,2,5);  
impz(X_coeff,Y_coeff,30);  
title("Impulse Response"); grid on;  
%Q - 4  
n = 0 : 100 ;  
X_coeff1 = [1/3 1/3 1/3];  
Y_coeff1 = [1 -0.95 0.9025];  
X_n = cos(pi*n/3);  
Y_initial = [-2 -3];  
X_initial = [1 1];  
Z_i = filtic(X_coeff1,Y_coeff1,Y_initial,X_initial);  
Y = filter(X_coeff1,Y_coeff1,X_n,Z_i);  
subplot(4,2,6);  
stem(n,X_n); title("Input Signal");  
subplot(4,2,7); stem(n,Y);  
title("Solution to difference equation");