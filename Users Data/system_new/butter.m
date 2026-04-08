fs=1000;
fc=100;

[b,a]=butter(4,fc/(fs/2),'high');

[H,w]=freqz(b,a,1024,fs);

subplot(2,1,1)
plot(w,abs(H))

subplot(2,1,2)
plot(w,angle(H))