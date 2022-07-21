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
Temp = 100;
vlow = -35;
vhigh = 35;

vx = MaxBolz(vlow,vhigh,N,Temp);
dx=(rand(length(vx),1)-0.5)*(0.01); %random position(1D) from -0.005 to 0.005
vy = MaxBolz(vlow,vhigh,N,Temp);
dy=(rand(length(vy),1)-0.5)*(0.01);
vz = MaxBolz(0,vhigh,N,Temp); %laser main direction
dz=(rand(length(vz),1)-0.5)*(0.01);

%%------Cooling atoms in a period of time------
dt=5e-4; %observing period
n=20;
time=[dt:dt:dt*n]; %Total cooling time
vxcooled = zeros(length(vx),n);
vycooled = zeros(length(vy),n);
vzcooled = zeros(length(vz),n);
xposition = zeros(length(vz),n);
yposition = zeros(length(vy),n);
zposition = zeros(length(vz),n);
for i=1:1:length(vx)
 for t=dt:dt:dt*n
     Fx1 = posForce(vx(i),dx(i),m,k,T,delt,s,B); 
     Fx2 = negForce(vx(i),dx(i),m,k,T,delt,s,B); 
     Fy1 = posForce(vy(i),dy(i),m,k,T,delt,s,B); 
     Fy2 = negForce(vy(i),dy(i),m,k,T,delt,s,B); 
     Fz1 = posForce(vz(i),dz(i),m,k,T,delt,s,B); 
     Fz2 = negForce(vz(i),dz(i),m,k,T,delt,s,B); 
     vx(i)=vx(i)+dt.*(Fx1 + Fx2);
     vy(i)=vy(i)+dt.*(Fy1 + Fy2);
     vxcooled(i,floor(t/dt))=vx(i);
     vycooled(i,floor(t/dt))=vy(i);
     if (dx(i)^(2)+dy(i)^(2))^(1/2) > 0.0005
     vz(i)=vz(i)+dt.*(Fz1 + Fz2);
     vzcooled(i,floor(t/dt))=vz(i);
     
     dx(i)= dx(i)+dt.*vx(i)+(1/2)*(Fx1 + Fx2)*dt^2;
     dy(i)= dy(i)+dt.*vy(i)+(1/2)*(Fy1 + Fy2)*dt^2;
     dz(i)= dz(i)+dt.*vz(i)+(1/2)*(Fz1 + Fz2)*dt^2;
     else
     vz(i) = -vz(i);
     vzcooled(i,floor(t/dt))=vz(i);

     dx(i)= dx(i)+dt.*vx(i)+(1/2)*(Fx1 + Fx2)*dt^2;
     dy(i)= dy(i)+dt.*vy(i)+(1/2)*(Fy1 + Fy2)*dt^2;
     dz(i)= dz(i)+dt.*vz(i);
     end
     xposition(i,floor(t/dt))=dx(i); 
     yposition(i,floor(t/dt))=dy(i); 
     zposition(i,floor(t/dt))=dz(i); 
 end
end
%%------Velocity------


%%------Visualization------
subplot(2,1,1)
for i=1:1:length(vz)
    hold on
    plot3(xposition(i,:),yposition(i,:),zposition(i,:));
end
hold off
xlabel('x');
ylabel('y');
zlabel('z');
title('Location of 1000 atoms 3D');

for i=1:1:length(vz)
    hold on
    subplot(2,1,2)
    plot(time,zposition(i,:));
end
hold off
xlabel('t');
ylabel('z');
title('Location of 1000 atoms along z-axis');




