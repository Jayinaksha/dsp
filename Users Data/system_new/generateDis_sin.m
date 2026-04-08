
%generating the function and doinf fft of it

fs=2000;
n=0:999;
x=sin(2*pi*100*n/fs)+sin(2*pi*200*n/fs)+sin(2*pi*500*n/fs);

X=fftshift(abs(fft(x)));
f=(-length(x)/2:length(x)/2-1)*(fs/length(x));

subplot(2,1,1)
plot(n/fs,x)

subplot(2,1,2)
plot(f,X)