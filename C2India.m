%% Parameters
fs = 1000;
t = 0:1/fs:1;
n = 0:length(t)-1;

%% Input Signal (50 Hz + harmonics)
x = sin(2*pi*50*t) + ...
    sin(2*pi*100*t) + ...
    sin(2*pi*150*t) + ...
    sin(2*pi*200*t);

%% Design FIR Bandstop Filters (remove 100 Hz & 150 Hz)

% Stopband for 100 Hz
b1 = fir1(60, [90 110]/(fs/2), 'stop');

% Stopband for 150 Hz
b2 = fir1(60, [140 160]/(fs/2), 'stop');

% Combined filter (cascade)
b = conv(b1, b2);   % designing filter only (allowed)

%% Apply filter using filter()
y_filter = filter(b, 1, x);

%% Manual Convolution (NO conv for filtering)
lx = length(x);
lb = length(b);
ly = lx + lb - 1;

y_manual = zeros(1, ly);

for i = 1:ly
    for k = 1:lx
        if (i-k+1 > 0 && i-k+1 <= lb)
            y_manual(i) = y_manual(i) + x(k)*b(i-k+1);
        end
    end
end

% Trim to same length
y_manual = y_manual(1:lx);

%% STEM plots (discrete signals)
figure;
stem(n(1:100), x(1:100), 'filled');
title('Input Signal (first 100 samples)');
xlabel('n'); ylabel('x(n)');
grid on;

figure;
stem(n(1:100), y_filter(1:100), 'filled');
title('Filtered Signal using filter()');
xlabel('n'); ylabel('y(n)');
grid on;

figure;
stem(n(1:100), y_manual(1:100), 'filled');
title('Filtered Signal using Manual Convolution');
xlabel('n'); ylabel('y(n)');
grid on;

%% Frequency response of filter
figure;
freqz(b, 1, 1024, fs);
title('Frequency Response of Designed Filter');

%% Spectrum using FFT
N = length(x);
f = (0:N-1)*(fs/N);

X = fft(x);
Y = fft(y_filter);

figure;
plot(f, abs(X));
xlim([0 250]);
title('Spectrum of Input Signal');
xlabel('Frequency (Hz)');
ylabel('|X(f)|');
grid on;

figure;
plot(f, abs(Y));
xlim([0 250]);
title('Spectrum of Filtered Signal');
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');
grid on;

%% PSD (optional but good for lab)
figure;
pwelch(x,[],[],[],fs);
title('Input PSD');

figure;
pwelch(y_filter,[],[],[],fs);
title('Filtered PSD');