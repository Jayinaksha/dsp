fs=1000;
fc=100;
N=51;

n=-(N-1)/2:(N-1)/2;
wc=2*pi*fc/fs;

h_lp=(wc/pi)*sinc((wc/pi)*n);
h_hp=-h_lp;
h_hp((N+1)/2)=1+h_hp((N+1)/2);

w=0.54-0.46*cos(2*pi*(0:N-1)/(N-1));
h=h_hp.*w;

[H,f]=freqz(h,1,1024,fs);

subplot(2,1,1)
plot(f,abs(H))

subplot(2,1,2)
plot(f,angle(H))