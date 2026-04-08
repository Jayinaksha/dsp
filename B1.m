%% Parameters
nmax = 20;                 % Length of sequence
n = 0:nmax;

%% System Definition
% Difference equation:
% y(n) = y(n-1) - y(n-2) + x(n)

num = [1];                 % Numerator
den = [1 -1 1];            % Denominator

%% Input Signals
x_imp = [1 zeros(1,nmax)];     % Impulse input
x_step = ones(1,nmax+1);       % Step input

%% Manual Impulse Response
y_imp_manual = zeros(1,nmax+1);

for k = 1:nmax+1
    if k == 1
        y_imp_manual(k) = x_imp(k);
    elseif k == 2
        y_imp_manual(k) = y_imp_manual(k-1) + x_imp(k);
    else
        y_imp_manual(k) = y_imp_manual(k-1) ...
                        - y_imp_manual(k-2) ...
                        + x_imp(k);
    end
end

%% Manual Step Response
y_step_manual = zeros(1,nmax+1);

for k = 1:nmax+1
    if k == 1
        y_step_manual(k) = x_step(k);
    elseif k == 2
        y_step_manual(k) = y_step_manual(k-1) + x_step(k);
    else
        y_step_manual(k) = y_step_manual(k-1) ...
                         - y_step_manual(k-2) ...
                         + x_step(k);
    end
end

%% Using filter()
h_filter = filter(num, den, x_imp);
s_filter = filter(num, den, x_step);

%% Display Results
disp('Manual h(n):');
disp(y_imp_manual);

disp('Filter h(n):');
disp(h_filter(1:nmax+1));

disp('Manual s(n):');
disp(y_step_manual);

disp('Filter s(n):');
disp(s_filter(1:nmax+1));

%% Plot Impulse Response Comparison
figure;
stem(n, y_imp_manual, 'b', 'filled');
hold on;
stem(n, h_filter(1:nmax+1), 'r--');
legend('Manual h(n)', 'Filter h(n)');
title('Impulse Response Comparison');
xlabel('n');
ylabel('Amplitude');
grid on;

%% Plot Step Response Comparison
figure;
stem(n, y_step_manual, 'b', 'filled');
hold on;
stem(n, s_filter(1:nmax+1), 'r--');
legend('Manual s(n)', 'Filter s(n)');
title('Step Response Comparison');
xlabel('n');
ylabel('Amplitude');
grid on;