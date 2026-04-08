fs=1000;
t=0:1/fs:1;
f0=50;
x=sin(2*pi*f0*t)+sin(2*pi*2*f0*t)+sin(2*pi*3*f0*t);

N=length(x);
f=(-N/2:N/2-1)*(fs/N);
X=fftshift(abs(fft(x)));

wo1=2*pi*100/fs;
wo2=2*pi*150/fs;
bw=wo1/35;
[b1,a1]=iirnotch(wo1,bw);
bw=wo2/35;
[b2,a2]=iirnotch(wo2,bw);

[b,a]=series(b1,a1,b2,a2);

y=filter(b,a,x);

Y=fftshift(abs(fft(y)));

h=impz(b,a,N);
y2=conv(x,h);
y2=y2(1:N);
Y2=fftshift(abs(fft(y2)));

subplot(3,1,1)
plot(f,X)

subplot(3,1,2)
freqz(b,a,1024,fs)

subplot(3,1,3)
plot(f,Y)