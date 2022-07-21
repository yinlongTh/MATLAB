function w = fftm(digi,fs)
 
  for i = 1:length(digi)
     
ind = i;

%Doing FFT to see main freq
TD_signal_leng = length(digi{ind}); %length of time domain sign
n2 = 2^nextpow2(TD_signal_leng); % length of signal in power of two
tranx = fft(digi{ind},n2); %FFT
half_tranx = tranx(1:n2/2); %illiminate mirror part
freq_period = fs*(0:(n2/2)-1)/n2; %create freq label

w{i} = freq_period;
w{i+length(digi)} = half_tranx;
  end

  end