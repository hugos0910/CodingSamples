%-----------------------------------------------------------------%
% Author     : Hugo Chiang
% Date       : 11 April 2016
% Class      : TAM532 Viscous Flow
% Instructor : Leonardo Chamorrow
% Abstract   : This algorithm is used to calculate the shear layer  
%              development of a laminar flow.  1 corresponds to the
%              "top" flow while 2 corresponds to the "bottom" flow.
%
%              Case 1,2,3 varies secondary fluid velocity
%              Case 4,5,6 varies secondary fluid dynamic viscosity          
%              Case 7,8,9 varies secondary fluid density
%
%-----------------------------------------------------------------%
clc; clear; format short; format compact
fig = 1;

% Select case
Case = 1;
if  Case == 1
%----------------------------Case 1---------------------------------%
% Fluid properties
U1     = 50;                              % m/s
lambda = 0;
U2     = lambda*U1;                       % m/s
mu1    = 1.983e-5;                        % kg/m-s
mu2    = 1.983e-5;                        % kg/m-s
rho1   = 1.225;                           % kg/m3
rho2   = 1.225;                           % kg/m3
nu1    = mu1/rho1;                        % m^2/s
nu2    = mu2/rho2;                        % m^2/s
rho_mu = (rho2*mu2)/(rho1*mu1);

% Initial conditions
Top_firstDeriv  = 0.5873;
Bot_firstDeriv  = Top_firstDeriv;
Top_secondDeriv = 0.1996;
Bot_secondDeriv = (1/sqrt(rho_mu))*Top_secondDeriv;

% Integration
[eta1,f1] = ode45(@TAM532_BlasiusFunc, 0:0.001:20, [0 Top_firstDeriv Top_secondDeriv]);
[eta2,f2] = ode45(@TAM532_BlasiusFunc, 0:-0.001:-20, [0 Bot_firstDeriv Bot_secondDeriv]);

%----------------------------Case 2---------------------------------%
elseif Case == 2
% Fluid properties
U1     = 50;                              % m/s
lambda = 0.5015;
U2     = lambda*U1;                       % m/s
mu1    = 1.983e-5;                        % kg/m-s
mu2    = 1.983e-5;                        % kg/m-s
rho1   = 1.225;                           % kg/m3
rho2   = 1.225;                           % kg/m3
nu1    = mu1/rho1;                        % m^2/s
nu2    = mu2/rho2;                        % m^2/s
rho_mu = (rho2*mu2)/(rho1*mu1);

% Initial conditions
Top_firstDeriv  = 0.7657;
Top_secondDeriv = 0.1219;
Bot_firstDeriv  = Top_firstDeriv;
Bot_secondDeriv = (1/sqrt(rho_mu))*Top_secondDeriv;

% Integration
[eta1,f1] = ode45(@TAM532_BlasiusFunc, 0:0.001:20, [0 Top_firstDeriv Top_secondDeriv]);
[eta2,f2] = ode45(@TAM532_BlasiusFunc, 0:-0.001:-20, [0 Bot_firstDeriv Bot_secondDeriv]);
%----------------------------Case 3---------------------------------%
elseif Case == 3
% Fluid properties
U1    = 50;                               % m/s
lambda = 0.8;
U2     = lambda*U1;                       % m/s
mu1    = 1.983e-5;                        % kg/m-s
mu2    = 1.983e-5;                        % kg/m-s
rho1   = 1.225;                           % kg/m3
rho2   = 1.225;                           % kg/m3
nu1    = mu1/rho1;                        % m^2/s
nu2    = mu2/rho2;                        % m^2/s
rho_mu = (rho2*mu2)/(rho1*mu1);

% Initial conditions
Top_firstDeriv  = 0.9020172;
Top_secondDeriv = 0.05352672;
Bot_firstDeriv  = Top_firstDeriv;
Bot_secondDeriv = (1/sqrt(rho_mu))*Top_secondDeriv;

% Integration
[eta1,f1] = ode45(@TAM532_BlasiusFunc, 0:0.001:20, [0 Top_firstDeriv Top_secondDeriv]);
[eta2,f2] = ode45(@TAM532_BlasiusFunc, 0:-0.001:-20, [0 Bot_firstDeriv Bot_secondDeriv]);

%----------------------------Case 4---------------------------------%
elseif Case == 4
% Fluid properties
U1     = 50;                              % m/s
lambda = 0.8;
U2     = lambda*U1;                       % m/s
mu1    = 1.983e-5;                        % kg/m-s
mu2    = 1.983e-5;                        % kg/m-s
rho1   = 1.225;                           % kg/m3
rho2   = 1.225;                           % kg/m3
nu1    = mu1/rho1;                        % m^2/s
nu2    = mu2/rho2;                        % m^2/s
rho_mu = (rho2*mu2)/(rho1*mu1);

% Initial conditions
Top_firstDeriv  = 0.902016;
Top_secondDeriv = 0.053526;
Bot_firstDeriv  = Top_firstDeriv;
Bot_secondDeriv = (1/sqrt(rho_mu))*Top_secondDeriv;

% Integration
[eta1,f1] = ode45(@TAM532_BlasiusFunc, 0:0.001:20, [0 Top_firstDeriv Top_secondDeriv]);
[eta2,f2] = ode45(@TAM532_BlasiusFunc, 0:-0.001:-20, [0 Bot_firstDeriv Bot_secondDeriv]);

%----------------------------Case 5---------------------------------%
elseif Case == 5
% Fluid properties
U1     = 50;                              % m/s
lambda = 0.8;
U2     = lambda*U1;                       % m/s
mu1    = 1.983e-5;                        % kg/m-s
mu2    = 1e-4;                            % kg/m-s
rho1   = 1.225;                           % kg/m3
rho2   = 1.225;                           % kg/m3
nu1    = mu1/rho1;                        % m^2/s
nu2    = mu2/rho2;                        % m^2/s
rho_mu = (rho2*mu2)/(rho1*mu1);

% Initial conditions
Top_firstDeriv  = 0.8634;
Top_secondDeriv = 0.0736;
Bot_firstDeriv  = Top_firstDeriv;
Bot_secondDeriv = (1/sqrt(rho_mu))*Top_secondDeriv;

% Integration
[eta1,f1] = ode45(@TAM532_BlasiusFunc, 0:0.001:20, [0 Top_firstDeriv Top_secondDeriv]);
[eta2,f2] = ode45(@TAM532_BlasiusFunc, 0:-0.001:-20, [0 Bot_firstDeriv Bot_secondDeriv]);

%----------------------------Case 6---------------------------------%
elseif Case == 6
% Fluid properties
U1     = 50;                              % m/s
lambda = 0.8;
U2     = lambda*U1;                       % m/s
mu1    = 1.983e-5;                        % kg/m-s
mu2    = 1e-3;                            % kg/m-s
rho1   = 1.225;                           % kg/m3
rho2   = 1.225;                           % kg/m3
nu1    = mu1/rho1;                        % m^2/s
nu2    = mu2/rho2;                        % m^2/s
rho_mu = (rho2*mu2)/(rho1*mu1);

% Initial conditions
Top_firstDeriv  = 0.8256;
Top_secondDeriv = 0.0928;
Bot_firstDeriv  = Top_firstDeriv;
Bot_secondDeriv = (1/sqrt(rho_mu))*Top_secondDeriv;

% Integration
[eta1,f1] = ode45(@TAM532_BlasiusFunc, 0:0.001:20, [0 Top_firstDeriv Top_secondDeriv]);
[eta2,f2] = ode45(@TAM532_BlasiusFunc, 0:-0.001:-20, [0 Bot_firstDeriv Bot_secondDeriv]);
%----------------------------Case 7---------------------------------%
elseif Case == 7
% Fluid properties
U1     = 50;                              % m/s
lambda = 0.2;
U2     = lambda*U1;                       % m/s
mu1    = 1.983e-5;                        % kg/m-s
mu2    = 1.983e-5;                        % kg/m-s
rho1   = 1.225;                           % kg/m3
rho2   = 1.225;                           % kg/m3
nu1    = mu1/rho1;                        % m^2/s
nu2    = mu2/rho2;                        % m^2/s
rho_mu = (rho2*mu2)/(rho1*mu1);

% Initial conditions
Top_firstDeriv  = 0.647439;
Top_secondDeriv = 0.17506;
Bot_firstDeriv  = Top_firstDeriv;
Bot_secondDeriv = (1/sqrt(rho_mu))*Top_secondDeriv;

% Integration
[eta1,f1] = ode45(@TAM532_BlasiusFunc, 0:0.001:20, [0 Top_firstDeriv Top_secondDeriv]);
[eta2,f2] = ode45(@TAM532_BlasiusFunc, 0:-0.001:-20, [0 Bot_firstDeriv Bot_secondDeriv]);
%----------------------------Case 8---------------------------------%
elseif Case == 8
% Fluid properties
U1     = 50;                              % m/s
lambda = 0.2;
U2     = lambda*U1;                       % m/s
mu1    = 1.983e-5;                        % kg/m-s
mu2    = 1.983e-5;                        % kg/m-s
rho1   = 1.225;                           % kg/m3
rho2   = 0.5;                           % kg/m3
nu1    = mu1/rho1;                        % m^2/s
nu2    = mu2/rho2;                        % m^2/s
rho_mu = (rho2*mu2)/(rho1*mu1);

% Initial conditions
Top_firstDeriv  = 0.7290;
Top_secondDeriv = 0.1390;
Bot_firstDeriv  = Top_firstDeriv;
Bot_secondDeriv = (1/sqrt(rho_mu))*Top_secondDeriv;

% Integration
[eta1,f1] = ode45(@TAM532_BlasiusFunc, 0:0.001:20, [0 Top_firstDeriv Top_secondDeriv]);
[eta2,f2] = ode45(@TAM532_BlasiusFunc, 0:-0.001:-20, [0 Bot_firstDeriv Bot_secondDeriv]);

%----------------------------Case 9---------------------------------%
elseif Case == 9
% Fluid properties
U1     = 50;                              % m/s
lambda = 0.2;
U2     = lambda*U1;                       % m/s
mu1    = 1.983e-5;                        % kg/m-s
mu2    = 1.983e-5;                        % kg/m-s
rho1   = 1.225;                           % kg/m3
rho2   = 0.25;                           % kg/m3
nu1    = mu1/rho1;                        % m^2/s
nu2    = mu2/rho2;                        % m^2/s
rho_mu = (rho2*mu2)/(rho1*mu1);

% Initial conditions
Top_firstDeriv  = 0.78558;
Top_secondDeriv = 0.11239;
Bot_firstDeriv  = Top_firstDeriv;
Bot_secondDeriv = (1/sqrt(rho_mu))*Top_secondDeriv;

% Integration
[eta1,f1] = ode45(@TAM532_BlasiusFunc, 0:0.001:20, [0 Top_firstDeriv Top_secondDeriv]);
[eta2,f2] = ode45(@TAM532_BlasiusFunc, 0:-0.001:-20, [0 Bot_firstDeriv Bot_secondDeriv]);
end
%------------------------Post Processing----------------------------%
x = linspace(0,10,length(eta1))';
% Find eta1 that corresponds to 0.99 of U1
[~,I1]     = min(abs(0.99*1-f1(:,2)));
eta1_delta1 = eta1(I1);

% Find eta1 that corresponds to 0.99 of U1
[~,I2]     = min(abs(1.01*lambda-f2(:,2)));
eta2_delta2 = eta2(I2);

% Calculate boundary layer thickness
delta1 = eta1_delta1*sqrt(nu1*x / U1);
delta2 = eta2_delta2*sqrt(nu2*x / U2);

% Calculate displacement thickness
deltas1 = sqrt(nu1*x / U1)*trapz(eta1,1-f1(:,2));
deltas2 = sqrt(nu2*x / U2)*trapz(abs(eta2),lambda-abs(f2(:,2)));

% Calculate momentum thickness
theta1 = sqrt(nu1*x / U1)*trapz(eta1,f1(:,2).*(1-f1(:,2)));
theta2 = sqrt(nu2*x / U2)*trapz(abs(eta2),abs(f2(:,2)).*...
    (lambda-abs(f2(:,2))));

% Calculate shape factor
SF1 = deltas1./theta1;
SF2 = deltas2./theta2;

% Build solution matrix
Sol = horzcat(x,delta1,delta2,deltas1,deltas2,theta1,theta2,SF1,SF2,...
    eta1,eta2,f1(:,2),f2(:,2));

% Export data
% save(sprintf('CASE%d.txt',Case), 'Sol', '-ascii');