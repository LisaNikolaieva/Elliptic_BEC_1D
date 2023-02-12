global DO_PARALLEL
DO_PARALLEL = 1;

 e=0.995; %[0.94, 0.955, 0.965, 0.975, 0.984, 0.987, 0.992, 0.994]
NN0 = 1e4;
a_ph=0.5*100*1e-6;
l_r=0.2*5*1e-6;                     % m
l_z=l_r;

mult = 1;%01

%% Physical parameters
hbar=1.06e-34;
k_b=1.380649e-23;                                           % J/K

a_s=5.3112e-9;                  % m     Rb87 s-wave scattering length
mass=87/6.02*1e-26;             % kg    Rb87 mass



%%
omega_r = hbar/(mass*l_r^2);      % Hz
omega_z = hbar/(mass*l_z^2);      % Hz


%%
t_mult=1/omega_r;
x_mult=l_r;
Psi_mult=1/sqrt(l_r);
No=1/(x_mult*Psi_mult^2);

gamma=mult*2*a_s*(NN0-1)/l_r;



a=a_ph/x_mult;
b=sqrt(1-e^2)*a;

%% Grid
N=256;
L=s_phi(2*pi,a,e,N);
x=linspace(0,L,N);


k = [ (0:N/2)*2*pi/L -(N/2-1 :-1:1)*2*pi/L];


if DO_PARALLEL
    x= gpuArray(x);
    k =gpuArray(k);
end

dx=x(3)-x(2);
kk=k.^2;  

%% Initial conditions

Psi=0.45+0.03*cos(2*2*pi*x/L);             % initial approximation
Psi=Psi.*sqrt(No/(sum(abs(Psi).^2)*dx));   % normalization
sum(abs(Psi).^2)*dx

%% kappa
phi=linspace(0,pi/2,N);
s=phi*0;
kp=kappa_phi(phi,a,e);
for i=2:N
s(i)=s_phi(phi(i),a,e,N);
end
kappa=interp1(s,kp,x(1:N/4));
kappa=[kappa, kappa(end:-1:1), kappa, kappa(end:-1:1)];
kappa=circshift(kappa,(N/8));


if DO_PARALLEL
    kappa = gpuArray(kappa);
end
    

%% ITP parameters

dt_itp = -1;%-5;  % time step for ITP
eD_itp = exp(0.5 * dt_itp* (0.5)*kk ); % linear operator for ITP


