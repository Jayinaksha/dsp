fs=1000;
n=0:999;
x=sin(2*pi*50*n/fs)+sin(2*pi*120*n/fs)+sin(2*pi*300*n/fs);

N=length(x);
f=(-N/2:N/2-1)*(fs/N);

X=fftshift(abs(fft(x)));

[b,a]=butter(4,100/(fs/2),'low');
xf=filter(b,a,x);
XF=fftshift(abs(fft(xf)));

y=3./(1+exp(-(xf.^2)));

Y=fftshift(abs(fft(y)));

subplot(3,2,1)
plot(n/fs,x)

subplot(3,2,2)
plot(f,X)

subplot(3,2,3)
plot(f,XF)

subplot(3,2,4)
plot(n/fs,y)

subplot(3,2,5)
plot(f,Y)