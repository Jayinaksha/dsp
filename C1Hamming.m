%% Parameters
m = 51;                     % Filter length (must be odd)
fc = 0.2;                   % Normalized cutoff frequency (0 to 0.5)
n = 0:m-1;
p = n - (m-1)/2;            % Centered index

%% 1. Truncated sinc function z(n)
z = zeros(1,m);

for i = 1:m
    if p(i) == 0
        z(i) = 2*fc;        % Limit value
    else
        z(i) = sin(2*pi*fc*p(i)) / (pi*p(i));
    end
end

%% 2. Plot truncated unit sample response
figure;
stem(n, z, 'filled');
title('Truncated Sinc Function (Unit Sample Response)');
xlabel('n');
ylabel('z(n)');
grid on;

%% 3. Frequency response of truncated sinc
[Z, w] = freqz(z, 1, 1024);

figure;
plot(w/pi, abs(Z));
title('Frequency Response of Truncated Sinc');
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('|Z(e^{j\omega})|');
grid on;

%% 4. Hamming Window
w_ham = hamming(m)';

figure;
stem(n, w_ham, 'filled');
title('Hamming Window');
xlabel('n');
ylabel('Amplitude');
grid on;

%% 5. Multiply sinc with Hamming window
z_win = z .* w_ham;

figure;
stem(n, z_win, 'filled');
title('Windowed Sinc Function');
xlabel('n');
ylabel('Amplitude');
grid on;

%% 6. Frequency response of windowed sinc
[H, w] = freqz(z_win, 1, 1024);

figure;
plot(w/pi, abs(H));
title('Frequency Response of Windowed Sinc');
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('|H(e^{j\omega})|');
grid on;

%% 7. Frequency response in dB
figure;
plot(w/pi, 20*log10(abs(H)));
title('Frequency Response of Windowed Sinc (dB)');
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Magnitude (dB)');
grid on;