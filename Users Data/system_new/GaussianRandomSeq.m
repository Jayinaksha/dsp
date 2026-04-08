N=6000;
w=sqrt(2)*randn(1,N);
alpha=[0.1 0.3 0.5 0.7 0.9];

figure
for k=1:length(alpha)
a=alpha(k);
y=zeros(1,N);
for n=2:N
y(n)=a*y(n-1)+w(n);
end
Y=fftshift(abs(fft(y)).^2/N);
f=(-N/2:N/2-1)/N;
subplot(5,1,k)
plot(f,Y)
end