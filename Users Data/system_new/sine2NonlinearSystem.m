fs=1000;
n=0:5999;
x=sin(2*pi*50*n/fs);

h=[0 0 0 1 -0.3 0.5];

[H,w]=freqz(h,1,1024,fs);

d=filter(h,1,x);

y=[zeros(1,2) d(1:end-2)]+0.3*([zeros(1,2) d(1:end-2)].^2)+0.8*([zeros(1,2) d(1:end-2)].^3);

N=length(y);
f=(-N/2:N/2-1)*(fs/N);
Y=fftshift(abs(fft(y)));

subplot(3,1,1)
plot(w,abs(H))

subplot(3,1,2)
plot(w,angle(H))

subplot(3,1,3)
plot(f,Y)