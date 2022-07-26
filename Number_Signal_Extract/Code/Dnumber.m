function [tel] = Dnumber(f,y)
a1=(697+770)/2;
a2=(770+852)/2;
a3=(852+941)/2;
a4=(1209+1336)/2;
a5=(1336+1447)/2;
a6=(1477+1633)/2;
k1=f(y==max(y(f<=1000)));
k2=f(y==max(y(f>1100)));
if(k1<a1)
    if(k2<a4)
        tel=1;
    elseif(k2<a5)
        tel=2;
    elseif(k2<a6)
        tel=3;
    else
        tel='A';
    end
elseif(k1<a2)
    if(k2<a4)
        tel=4;
    elseif(k2<a5)
        tel=5;
    elseif(k2<a6)
        tel=6;
    else
        tel='B';
    end
elseif(k1<a3)
    if(k2<a4)
        tel=7;
    elseif(k2<a5)
        tel=8;
    elseif(k2<a6)
        tel=9;
    else
        tel='C';
    end
else
    if(k2<a4)
        tel='*';
    elseif(k2<a5)
        tel=0;
    elseif(k2<a6)
        tel='#';
    else
        tel='D';
    end
end
end

