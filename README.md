# DSP Lab – MATLAB Experiments

A collection of MATLAB scripts covering core Digital Signal Processing (DSP) topics, organized as lab experiments.

---

## Repository Structure

```
.
├── E1Aim1Q1.m          # Basic discrete-time signal generation
├── E1Aim1Q2.m          # Impulse and step response of a difference equation
├── E1Q3.m              # Frequency response (amplitude and phase)
├── E1Q4.m              # Impulse response using the filter() function
├── E2.m                # Linear and circular convolution
├── E3.m                # Z-transform, pole-zero plots, system analysis
├── E4.m                # DFT/IDFT and FFT/IFFT (DIT and DIF)
├── A1.m                # Stability, impulse & step response for a given difference equation
├── A2.m                # Harmonic filtering of a 50 Hz power signal
├── A3.m                # Nonlinear system: convolution + spectrum analysis
├── B1.m                # Manual vs filter() impulse and step response comparison
├── B2.m                # AR(1) processes – spectrum and frequency response
├── C1Hamming.m         # FIR low-pass filter design using Hamming window
├── C2India.m           # FIR bandstop filter to remove harmonics (Indian power supply)
├── C3bandpassdesign.m  # Bandpass FIR filter using Kaiser window + audio filtering
├── DSPES/              # Experiment PDFs (E1 – E6)
└── Users Data/         # Live scripts (.mlx), reports, and additional .m files
```

---

## Experiments

### Experiment 1 – Discrete-Time Signals and Systems

| File | Description |
|---|---|
| `E1Aim1Q1.m` | Generate and plot unit step, ramp, exponential, complex exponential, periodic, and even/odd sequences |
| `E1Aim1Q2.m` | Compute impulse and step responses for `y(n) = x(n) + y(n-1) − 0.9·y(n-2)` |
| `E1Q3.m` | Plot amplitude and phase response of `H(z)` with given numerator/denominator coefficients |
| `E1Q4.m` | Obtain impulse response using `filter()` for a transfer function with poles inside the unit circle |

### Experiment 2 – Convolution

| File | Description |
|---|---|
| `E2.m` | Linear convolution (manual loop + `conv()`), circular convolution (manual loop) |

### Experiment 3 – Z-Transform and System Analysis

| File | Description |
|---|---|
| `E3.m` | Symbolic inverse Z-transform, `impz()` impulse response, pole-zero plot (`zplane`), magnitude/phase plots, and solving a difference equation with initial conditions using `filtic()` |

### Experiment 4 – DFT and FFT

| File | Description |
|---|---|
| `E4.m` | DFT/IDFT via direct formula and matrix method; DIT-FFT, DIF-FFT, and their inverse counterparts; verified against MATLAB's built-in `fft()` / `ifft()` |

### Additional Lab Scripts

| File | Description |
|---|---|
| `A1.m` | Analyze `y(n) = ¾·y(n-1) − ⅛·y(n-2) + x(n)`: find H(z), check stability, compute impulse and step responses |
| `A2.m` | Generate a 50 Hz signal with 2nd and 3rd harmonics; design an FIR bandpass filter to retain only the fundamental |
| `A3.m` | Sine input through a nonlinear system `y(n) = d(n-2) + 0.3·d²(n-2) + 0.8·d³(n-2)` where `d(n) = x(n) * h(n)`; plot magnitude/phase of H(z) and spectrum of y(n) |
| `B1.m` | Compare manual recursive computation vs. `filter()` for impulse and step responses of `y(n) = y(n-1) − y(n-2) + x(n)` |
| `B2.m` | Generate AR(1) sequences for α ∈ {0.1, 0.3, …, 0.9}; plot spectrum; obtain impulse and frequency response for α = 0.9 |
| `C1Hamming.m` | Design a low-pass FIR filter: truncated sinc → apply Hamming window → plot frequency response in linear and dB scale |
| `C2India.m` | Model an Indian power supply signal (50 Hz + 100/150/200 Hz harmonics); cascade two FIR bandstop filters to remove 100 Hz and 150 Hz; compare `filter()` vs. manual convolution |
| `C3bandpassdesign.m` | Design a bandpass FIR filter (1400–1600 Hz) using Kaiser window; apply to an audio file; compare input/output spectra |

---

## Requirements

- **MATLAB** R2018b or later (Signal Processing Toolbox required for `freqz`, `fir1`, `filtic`, `impz`, `zplane`, `audioread`, `pwelch`)

---

## Usage

1. Open MATLAB and set the repository folder as the current directory.
2. Open any `.m` file and press **Run** (F5), or execute it from the Command Window:
   ```matlab
   run('E1Aim1Q1.m')
   ```
3. For `C3bandpassdesign.m`, place an audio file named `input.wav` in the same directory before running.

---

## License

This project is licensed under the [MIT License](LICENSE).
