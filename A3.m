%2. You haver x_n a function of sine and it is passed through a non linear system having y_n = d(n-2) + 0.3d^2(n-2) +0.8d^3(n-2). Where d_n is convolution of x and h where H(z) = z^-3 - 0.3z^-4 +0.5z^-5
%Plot the magnitude and phase response of h(z)
%Plot the spectrum of y_n 
%Take the length of sequence greater than 5000

%% Parameters
fs = 1000;                 % Sampling frequency
N = 6000;                  % Length (>5000)
n = 0:N-1;

%% Input Signal (Sine)
f0 = 50;                   % Frequency
x = sin(2*pi*f0*n/fs);

%% Define h(n) from H(z)
h = [0 0 0 1 -0.3 0.5];

%% 1. Magnitude & Phase Response of H(z)
[H,w] = freqz(h,1,1024,fs);

figure;
subplot(2,1,1);
plot(w, abs(H));
title('Magnitude Response of H(z)');
xlabel('Frequency (Hz)');
ylabel('|H(f)|');
grid on;

subplot(2,1,2);
plot(w, angle(H));
title('Phase Response of H(z)');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
grid on;

%% 2. Convolution to get d(n)
d = conv(x,h,'same');

%% Shift d(n-2)
d_shift = [0 0 d(1:end-2)];

%% Nonlinear System
y = d_shift + 0.3*(d_shift.^2) + 0.8*(d_shift.^3);

%% 3. Spectrum of y(n)
Y = fft(y);
f = (0:N-1)*(fs/N);

figure;
plot(f, abs(Y));
xlim([0 200]);
title('Spectrum of y(n)');
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');
grid on;

%% Time-domain visualization (optional)
figure;
plot(n(1:500), y(1:500));
title('y(n) in Time Domain (First 500 samples)');
xlabel('n');
ylabel('Amplitude');
grid on;