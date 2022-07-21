function [num] = LiveRun(y,fs,axes2)
roam=y;
y=Dfilter(y,fs);
framelength = 200;                                          % set length of window  
framenumber = fix(length(y)/framelength);                  
for i = 1:framenumber                                      % enframe   
    framesignal = y((i-1)*framelength+1:i*framelength);
    E(i) = 0;                                                 
    for j = 1:framelength                                  % calcuate energy of each frame   
        E(i) = E(i)+framesignal(j)^2;    
    end  
end
L=length(E);
 for i=1:1:L
     E1(200*(i-1)+1:1:200*i)=E(i);
 end
 plot(axes2(2),E)
 
 E2=E1;
 E2(find(E1>6))=1;
 E2(find(E1<=6))=0;
 E3=diff(E2);
 p=find(E3==1|E3==-1);
 Lp=length(p);
 if mod(Lp,2)==0
 else
     p=p(1:1:Lp-1);
 end
 Lp=length(p);
 p=reshape(p,[2,Lp/2]);
  num='';
  
 for i=1:1:min(10,Lp/2)
     x=y(p(1,i):p(2,i));
     N=length(x);
     n=0:1:N-1;
     y=fft(x,N);
     y1=abs(y)/N*2;
     f=n*fs/N;
     f=f(1:fix(N/2));
     y2=y1(1:fix(N/2));
%      plot(axes(i),f,y2)
%      title(axes(i),['第',num2str(i),'个按键音频谱图'],'Fontsize',8);
%      xlabel(axes(i),'频率/Hz','Fontsize',6);
%      ylabel(axes(i),'幅度','Fontsize',8)
%      grid on
     tel=Dnumber(f,y2);
     num=[num,num2str(tel)];
 end
 end




