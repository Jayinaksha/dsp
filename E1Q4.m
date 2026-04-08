n = -50:50;
x = double(n == 0); 
b = [1 0.5 0.85] ;
a = [1 -1 -1];
h = filter(b, a, x);
stem(n, h); 
title('Impulse Response'); 
xlabel('n');
ylabel('h(n)');