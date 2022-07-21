function [num] = MainRun(file,axes1,~)

[y,fs] = audioread(file);

%innitial setting
    d = 1/fs;
    t = 0:d:(length(y)*d)-d;
    
plot(axes1(1),t,y)
xlabel(axes1(1),'时间','Fontsize',8);
ylabel(axes1(1),'幅度','Fontsize',8)
    
 roam = y;
 %filter(noise clearing)

 for i = 1:length(y) 
     if (abs(y(i))<0.016)
         y(i)=0;
     end
 end

  handles.digi = seperate(y,roam);
  
%FFT
handles.freq = freqpick(handles.digi,fs);
handles.zhou = fftm(handles.digi,fs);


%number converting
num = tonummber(handles.freq);

plot(axes1(2),t,y)
xlabel(axes1(2),'时间','Fontsize',8);
ylabel(axes1(2),'幅度','Fontsize',8)

end