%噪音过滤（带通滤波）
function [y1] = Dfilter(y,Fs)
%基础参数
Fs2=Fs/2;
fp=700;
fs=1650;
Wp=fp/Fs2;
Ws=fs/Fs2;
%buttord
[b,a]=butter(5,[Wp,Ws]);
N=length(y);
y1=filter(b,a,y);
end

