%%------Parameters------
%Constant
kb = 1.38*10^(-23); %Boltzmann constant
B=0.01; %Magnetic field
h = 6.62607004*10^(-34); %(SI)Planck's Constant
hbar = h/(2*pi); %reduced Planckps constant

%Atoms
m = 1.66*85.47*10^(-27); %atomic mass
N = 1000; %number of atoms

%Laser
lamb = 780*10^(-9); %(meter)Laser beam wavelength
k = 2*pi/lamb; %wave number
I0 = 1.67*10^(3); %Watt/m^2  
I = 2.6*I0; %light intensity 
s = I/I0;
T = 2*pi*6.0666*10^(6); %(Hz)
delt = -5*T; %5倍一下将信号震荡：4，3 开始不收敛


%%------Distribution of atoms with speeds------
%From the distribution, velocity at range -150 to 150
Temp = 120;
vlow = -40;
vhigh = 40;

v = MaxBolz(vlow,vhigh,N,Temp);
dx=(rand(length(v),1)-0.5)*(0.01); %random position(1D) from -0.005 to 0.005

%%------Cooling atoms in a period of time------
dt=5e-4; %observing period
n=20;
time=[dt:dt:dt*n]; %Total cooling time
vcooled = zeros(length(v),n);
position = zeros(length(v),n);
for i=1:1:length(v)
 for t=dt:dt:dt*n
     F1 = posForce(v(i),dx(i),m,k,T,delt,s,B); %+Force
     F2 = negForce(v(i),dx(i),m,k,T,delt,s,B); %-Force
     v(i)=v(i)+dt.*(F1 + F2);
     vcooled(i,floor(t/dt))=v(i);
     dx(i)= dx(i)+dt.*v(i)+(1/2)*(F1 + F2)*dt^2;
     position(i,floor(t/dt))=dx(i); 
 end
end


%%------Visualization------
for i=1:1:length(v)
    hold on
    subplot(2,1,1)
    plot(time,vcooled(i,:));
end
hold off
xlabel('time');
ylabel('speed');
title('MOT 1D : Speed of 1000 Rb atoms');

for i=1:1:length(v)
    hold on
    subplot(2,1,2)
    plot(time,position(i,:));
end
hold off
xlabel('t');
ylabel('z');
title('Location of 1000 atoms along z-axis');

