function [kappa] = kappa_phi(phi,a,e)

kappa=1/a*sqrt(1-e^2)./(((sin(phi)).^2+sqrt(1-e^2)*(cos(phi)).^2).^(3/2));


end