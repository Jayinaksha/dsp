%y(n)=3/4y(n-1)-1/8y(n-2)+x(n)
%1. Find the system function H(z), Freq response of the system and tell if the system is stable or not.
%2. Find the impulse response h(n)
%3. Find the step response s(n)
%4. Compare the responses obtained in 2 and 3 using the inbuilt filter function
%% Given Difference Equation:
% y(n) = (3/4)y(n-1) - (1/8)y(n-2) + x(n)

% Coefficients
b = [1];                 % Numerator (input x(n))
a = [1 -3/4 1/8];        % Denominator (y terms shifted to LHS)

%% 1. System Function H(z)
disp('System Function H(z):');
disp('H(z) = (1) / (1 - 3/4 z^-1 + 1/8 z^-2)');

%% Frequency Response
figure;
freqz(b, a);
title('Frequency Response of the System');

%% Stability Check
poles = roots(a);
disp('Poles of the system:');
disp(poles);

if all(abs(poles) < 1)
    disp('System is STABLE');
else
    disp('System is NOT STABLE');
end

%% 2. Impulse Response h(n)
n = 0:20;
impulse = [1 zeros(1,20)];   % delta(n)

h = filter(b, a, impulse);

figure;
stem(n, h, 'filled');
title('Impulse Response h(n)');
xlabel('n');
ylabel('h(n)');

%% 3. Step Response s(n)
step = ones(1,21);

s = filter(b, a, step);

figure;
stem(n, s, 'filled');
title('Step Response s(n)');
xlabel('n');
ylabel('s(n)');

%% 4. Comparison using filter (already used above)
% Just plotting both together

figure;
stem(n, h, 'b', 'filled');
hold on;
stem(n, s, 'r', 'filled');
legend('Impulse Response h(n)', 'Step Response s(n)');
title('Comparison of Impulse and Step Responses');
xlabel('n');
ylabel('Amplitude');
grid on;