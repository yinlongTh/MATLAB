function f = negForce(v,dx,m,k,T,delt,s,B)
h=1.05e-34;
u=9.27e-24;
w=delt+k.*v+u.*B.*dx./h;

f = -(0.5*h.*k.*T.*s./(1+s+(2*w./T).^2))/m;
end
