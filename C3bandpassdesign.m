%% Specifications
fs  = 8000;        % Sampling frequency (Hz)
Fstop1 = 1200;
Fpass1 = 1400;
Fpass2 = 1600;
Fstop2 = 1800;

Rp = 1;            % Passband ripple (dB)
Rs = 60;           % Stopband attenuation (dB)

%% --- FIR Filter Design (Kaiser Window) ---

% Normalize frequencies (0 to 1 corresponds to 0 to fs/2)
Wp = [Fpass1 Fpass2]/(fs/2);
Ws = [Fstop1 Fstop2]/(fs/2);

% Ripple/attenuation to linear deltas
delta_p = (10^(Rp/20)-1)/(10^(Rp/20)+1);
delta_s = 10^(-Rs/20);

% Use the stricter requirement
delta = min(delta_p, delta_s);

% Kaiser parameters
A = -20*log10(delta);
if A > 50
    beta = 0.1102*(A-8.7);
elseif A >= 21
    beta = 0.5842*(A-21)^0.4 + 0.07886*(A-21);
else
    beta = 0;
end

% Transition width
Dw = min(Wp(1)-Ws(1), Ws(2)-Wp(2));

% Filter order
N = ceil((A-8)/(2.285*Dw*pi));
if mod(N,2) ~= 0
    N = N + 1;  % make even for symmetry
end

% FIR coefficients
b = fir1(N, Wp, kaiser(N+1, beta));

%% --- Frequency Response ---
figure;
freqz(b,1,1024,fs);
title('Bandpass FIR Filter Frequency Response');

%% --- Read Audio File ---
[x, fs_audio] = audioread('input.wav');   % replace with your file

% If stereo → convert to mono
if size(x,2) > 1
    x = mean(x,2);
end

% Ensure same sampling frequency
if fs_audio ~= fs
    x = resample(x, fs, fs_audio);
end

%% --- Filtering ---
y = filter(b,1,x);

%% --- Spectrum (FFT) ---
Nfft = length(x);
f = (0:Nfft-1)*(fs/Nfft);

X = fft(x);
Y = fft(y);

%% Plot Input Spectrum
figure;
plot(f, abs(X));
xlim([0 4000]);
title('Input Signal Spectrum');
xlabel('Frequency (Hz)');
ylabel('|X(f)|');
grid on;

%% Plot Output Spectrum
figure;
plot(f, abs(Y));
xlim([0 4000]);
title('Filtered Output Spectrum');
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');
grid on;

%% --- Optional: Listen to Output ---
% sound(y, fs);

%% --- Save Output ---
% audiowrite('filtered_output.wav', y, fs);