function [s] = s_phi(phi0,a,e,N)

x=linspace(0,phi0,round(N*phi0));
dx=x(2)-x(1);
f=sqrt(1-e^2*(sin(x)).^2);

s=a*dx*sum(f);

end