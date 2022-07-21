function vn = MaxBolz(vlow,vhigh,N,Temp) %return speed vector with the distribution
    m = 1.66*85.47*10^(-27); %atomic mass
    kb = 1.38*10^(-23); %Boltzmann consta
    v = vlow:(vhigh-vlow)/N:vhigh;
    prob = (4/pi^(1/2))*((m/(2*kb*Temp))^(3/2)).*((2.781).^(-m*v.^(2)/(2*kb*Temp))).*v.^2;
    f = round(N*prob,0); %probability of each value of speed
    j = 1;
    for i = 1:length(v)
      copyind = f(i);
      while copyind >-1
        if copyind ~= 0
            vn(j) = v(i);
            j = j+1;
            copyind = copyind - 1;
        else
            break
        end
      end
    end

end