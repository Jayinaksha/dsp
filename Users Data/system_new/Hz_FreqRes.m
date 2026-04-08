b=[1];
a=[1 -3/4 1/8];

[H,w]=freqz(b,a,1024);

subplot(3,1,1)
plot(w,abs(H))

subplot(3,1,2)
plot(w,angle(H))

n=0:50;
imp=[1 zeros(1,50)];
h=filter(b,a,imp);

step=ones(1,51);
s=filter(b,a,step);

subplot(3,1,3)
stem(n,h)
hold on
stem(n,s)