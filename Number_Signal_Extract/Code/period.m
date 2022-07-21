function op = period(y)
 
nonZero = find(y);
j_p=1;
j_r=1;
press = zeros(1,10);
release = zeros(1,10);
for i = 2:length(nonZero)-1
    a =nonZero(i)-nonZero(i-1);
    if a>2500 %2500
        press(j_p) = nonZero(i) ;  
        j_p = j_p+1;
    end 
end
    
    if ~(press(10)==0)
       for i = 11:length(nonZero)-1
          b = abs(nonZero(i)-nonZero(i+1));
            if b>1000 %1000
                release(j_r) = nonZero(i) ;  
                j_r = j_r+1;
            end  
       end 
    end
    release(10) = nonZero(length(nonZero));
    
    for i =1:10
        op(1,i) = press(i);
        op(2,i) = release(i);
    end
    
end