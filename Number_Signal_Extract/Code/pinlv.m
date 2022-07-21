function b=pinlv(file)

[y,fs] = audioread(file);

%innitial setting
    d = 1/fs;
    t = 0:d:(length(y)*d)-d;
    
 roam = y;
 %filter(noise clearing)

 for i = 1:length(y) 
     if (abs(y(i))<0.016)
         y(i)=0;
     end
 end

digi = seperate(y,roam);
  
%FFT
b = freqpick(digi,fs);
end