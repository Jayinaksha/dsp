%1. Generate a sine wave having frequency equal to indian power supply and it contains 3 harmonics of it . 
% Design a filter to remove 1st and 2nd harmonic. 
% Plot the spectrum of signal and filtered signal

%% Parameters
fs = 1000;              % Sampling frequency (Hz)
t = 0:1/fs:1;           % Time vector
f0 = 50;                % Fundamental frequency

%% Generate Signal with Harmonics
x = sin(2*pi*f0*t) + 0.5*sin(2*pi*2*f0*t) + 0.3*sin(2*pi*3*f0*t);

%% FFT of Original Signal
N = length(x);
X = fft(x);
f = (0:N-1)*(fs/N);

%% Design Bandpass FIR Filter (around 50 Hz)
Wn = [40 60]/(fs/2);    % Passband 40–60 Hz
b = fir1(60, Wn, 'bandpass');  % Order 60 filter

%% Apply Filter
y = filter(b,1,x);

%% FFT of Filtered Signal
Y = fft(y);

%% Plot Spectrum of Original Signal
figure;
plot(f, abs(X));
xlim([0 200]);
title('Spectrum of Original Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

%% Plot Spectrum of Filtered Signal
figure;
plot(f, abs(Y));
xlim([0 200]);
title('Spectrum of Filtered Signal (Bandpass)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

%% Time Domain Comparison
figure;
plot(t,x,'b');
hold on;
plot(t,y,'r');
legend('Original Signal','Filtered Signal');
title('Time Domain Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;