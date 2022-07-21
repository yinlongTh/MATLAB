kb = 1.38*10^(-23); 
B=0.01; 
h = 6.62607004*10^(-34);
hbar = h/(2*pi);

%Atoms
m = 1.66*85.47*10^(-27);

%Laser
lamb = 780*10^(-9); 
k = 2*pi/lamb; 
I0 = 1.67*10^(3);   
I = 2.6*I0; 
s = I/I0;
T = 2*pi*6.0666*10^(6); %(Hz)
delt = -5*T; 

v = [-100:1:100];
dx=(rand(length(v),1)-0.5)*(0.01);


for i=1:1:length(v)
     F1 = posForce(v(i),dx(i),m,k,T,delt,s,B); %+Force
     F2 = negForce(v(i),dx(i),m,k,T,delt,s,B); %-Force
     F(i) = F1 + F2;
end

plot(v,F(:));
xlabel('speed');
ylabel('Force');
