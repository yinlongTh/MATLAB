function w = freqpick(digi,fs)
 
  for i = 1:length(digi) %10
     
ind = i;

%Doing FFT to see main freq
TD_signal_leng = length(digi{ind}); %length of time domain sign
n2 = 2^nextpow2(TD_signal_leng); % length of signal in power of two
tranx = fft(digi{ind},n2); %FFT
half_tranx = tranx(1:n2/2); %illiminate mirror part
freq_period = fs*(0:(n2/2)-1)/n2; %create freq label

inputind = 1;

for j = 1:length(freq_period)
    if abs(half_tranx(j))>3 && freq_period(j)>= 696 && freq_period(j) <= 1650
        dummy(inputind) = freq_period(j);
        inputind = inputind + 1;
    end 
end

w(1,i) = (min(dummy));
for a = 1:length(dummy)
    if a>1
if abs(dummy(a)-dummy(a-1))>300
w(2,i) = dummy(a);
end
    end
end

  end
end