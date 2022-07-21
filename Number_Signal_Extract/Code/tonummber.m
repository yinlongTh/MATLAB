function q = tonummber(input)

for i = 1:length(input)
if input(1,i)<=700 && input(2,i)<=1260
    q(i) = '1';
elseif input(1,i)<700 && input(2,i)>1260 && input(2,i)<1390
    q(i) = '2';
elseif input(1,i)<700 && input(2,i)<1530 && input(2,i)>1390
    q(i) = '3';
elseif input(1,i)<700 && input(2,i)>1530
    q(i) = 'A';
elseif input(1,i)>700 && input(1,i)<800 && input(2,i)<1260
    q(i) = '4';
elseif input(1,i)>700 && input(1,i)<800 && input(2,i)>1260 && input(2,i)<1390
    q(i) = '5';
elseif input(1,i)>700 && input(1,i)<800 && input(2,i)<1530 && input(2,i)>1390
    q(i) = '6';
elseif input(1,i)>700 && input(1,i)<800 && input(2,i)>1530
    q(i) = 'B';
    
elseif input(1,i)<900 && input(1,i)>800 && input(2,i)<1260
    q(i) = '7';
elseif input(1,i)<900 && input(1,i)>800 && input(2,i)>1260 && input(2,i)<1390
    q(i) = '8';
elseif input(1,i)<900 && input(1,i)>800 && input(2,i)<1530 && input(2,i)>1390
    q(i) = '9';
elseif input(1,i)<900 && input(1,i)>800 && input(2,i)>1530
    q(i) = 'C';
    
elseif input(1,i)>900 && input(2,i)<1260
    q(i) = '*';
elseif input(1,i)>900 && input(2,i)>1260 && input(2,i)<1390
    q(i) = '0';
elseif input(1,i)>900 && input(2,i)<1530 && input(2,i)>1390
    q(i) = '#';
elseif input(1,i)>900 && input(2,i)>1530
    q(i) = 'D';

else 
    q(i) = 'NaN';
end
    
end

end