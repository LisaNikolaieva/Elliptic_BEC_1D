function [HPsi] = HPsi(kk,Fi,Psi)

HPsi=ifftn(0.5*kk.*fftn(Psi))+(Fi).*Psi;

end