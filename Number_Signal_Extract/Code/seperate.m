function n = seperate(y,roam)
  x = period(y);
 for j = 1:10
 as=1;
for i = x(1,j):x(2,j)
   
    number(1,as)=roam(i) ;
    as = as+1;
end
n{j} = number;

 end
 end