%% Parameters
N = 2000;                      % Sequence length
alphas = 0.1:0.2:0.9;         % Alpha values
fs = 1000;                    % Sampling freq (for plotting)

%% Generate Gaussian noise w(n)
w = sqrt(2)*randn(1,N);       % mean=0, variance=2

%% PART (a): Generate y_i(n) and plot spectrum

figure;

for i = 1:length(alphas)
    
    alpha = alphas(i);
    y = zeros(1,N);
    
    % Generate AR(1) sequence
    for n = 2:N
        y(n) = alpha*y(n-1) + w(n);
    end
    
    % FFT
    Y = fft(y);
    f = (0:N-1)*(fs/N);
    
    % Plot
    subplot(length(alphas),1,i);
    plot(f, abs(Y));
    xlim([0 200]);
    title(['Spectrum of y(n), \alpha = ', num2str(alpha)]);
    xlabel('Frequency (Hz)');
    ylabel('|Y(f)|');
    grid on;
end

%% PART (b): Impulse & Frequency Response for alpha = 0.9

alpha = 0.9;

% System coefficients
num = [1];
den = [1 -alpha];

%% Impulse response
imp = [1 zeros(1,50)];
h = filter(num, den, imp);

figure;
stem(0:50, h, 'filled');
title('Impulse Response (alpha = 0.9)');
xlabel('n');
ylabel('h(n)');
grid on;

%% Frequency response
figure;
freqz(num, den, 1024, fs);
title('Frequency Response (alpha = 0.9)');