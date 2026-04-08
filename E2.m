%Aim 1
x = [1 2]; 
h = [1 2 4]; 
n1 = length(x); 
n2 = length(h); 
n = n1+n2-1;  
y = zeros(1, n);  
for i = 1:n  
for j = 1:n 
if(i-j+1 > 0 && i*j+1<=n2) 
y(i) = y(i) + x(j)*h(i-j+1); 
end 
end 
end 
stem(y); 
ybuilt_in = conv(x, h); 
stem(ybuilt_in);
%% Aim 2
x2 = [1 2 3 4];  
h2 = [1 2];  
n12 = length(x2);  
n22 = length(h2);  
n2 = max(n12, n22);  
x2_pad = [x2 , zeros(1, n2 - n12)];  
h2_pad = [h2 , zeros(1, n2 - n22)]; 
y_circ = zeros(1, n2); 
for i = 0:n2-1 
sum = 0;  
for j = 0:n2-1  
h_ind = mod(i-j, n2); 
sum = sum + x2_pad(j+1)*h2_pad(h_ind+1); 
end  
y_circ(i+1) = sum;  
end  
stem(y_circ); 