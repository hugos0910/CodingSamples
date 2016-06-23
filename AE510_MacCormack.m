%-----------------------------------------------------------------%
% Author     : Hugo Chiang
% Date       : 11 December 2015
% Class      : AE510 Advance Gas Dynamics
% Instructor : J.C. Dutton
% Abstract   : Homework 7.  This HW assignment solved the flowfield
%              properties of a C-D nozzle using MacCormack method
%-----------------------------------------------------------------%
clc; clear; format long; format compact;

% Inputs
x          = linspace(0,1,51); x = x';% # of horizontal partitions
[m,n]      = size(x);
A          = 1+10*(x-0.5).^2; A = A'; % Nozzle contour
dA         = 20*x-10;                 % Derivative of the nozzle contour
gamma      = 1.4;                     % Gas constant
K          = 1.0;                     % Stability criterion constant
dx         = (x(m)-x(1))/(m-1);       % Grid size (constant)
time_iter  = 500;                     % Number of iterations desired
fig        = 1;                       % Figure counter

% Initialize flow property matrices
rho = zeros(m,time_iter+1);
u   = zeros(m,time_iter+1);
p   = zeros(m,time_iter+1);
T   = zeros(m,time_iter+1);

rho_P = zeros(m,n); % Predictor
u_P   = zeros(m,n);
p_P   = zeros(m,n);

rho_C = zeros(m,n); % Corrector
u_C   = zeros(m,n);
p_C   = zeros(m,n);

dt  = zeros(n,m);
% Initial values
% Inlet BC (fixed values)
rho(1,:) = 0.985999;
u(1,:)   = 0.183697;
p(1,:)   = 0.980454;
T(1,:)   = p(1,:)./rho(1,:);

% Outlet BC
rho(m,1) = 0.01;
u(m,1)   = 2.0;
p(m,1)   = 0.01;
T(m,1)   = p(m)/rho(m);


% Interpolation for interior points
rho_M = (rho(m,1)-rho(1,1))/(x(m)-x(1)); % Density slope
u_M = (u(m,1)-u(1,1))/(x(m)-x(1)); % Velocity slope
p_M = (p(m,1)-p(1,1))/(x(m)-x(1)); % Pressure slope
T_M = (T(m,1)-T(1,1))/(x(m)-x(1)); % Temperature slope
for i = 2:m
    rho(i,1) = rho_M*(x(i)-x(1)) + rho(1,1);
    u(i,1) = u_M*(x(i)-x(1)) + u(1,1);
    p(i,1) = p_M*(x(i)-x(1)) + p(1,1);
    T(i,1) = T_M*(x(i)-x(1)) + T(1,1);
end
  
for iter = 1:time_iter
    % Time step calculation
      a  = sqrt(T(:,iter)*(1+(gamma-1)/2));
      dtt = (K*dx)./(u(:,iter)+a);
      dt(iter) = min(dtt);
    % Predictor
    rho_P(1) = rho(1,iter);
    u_P(1)   = u(1,iter);
    p_P(1)   = p(1,iter);
    for i = 2:m-1
        [rho_P(i),u_P(i),p_P(i)] = ...
            AE510_Predictor(A(i),dA(i),gamma,dx,dt(iter),...
            rho(i,iter),rho(i+1,iter),u(i,iter),u(i+1,iter),...
            p(i,iter),p(i+1,iter));
    end
    T_P = p_P./rho_P;
    rho_P;
    % Corrector
    rho_C(1) = rho(1,iter);
    u_C(1)   = u(1,iter);
    p_C(1)   = p(1,iter);
    for i = 2:m-1
        [rho_C(i),u_C(i),p_C(i)] = ...
            AE510_Corrector(A(i),dA(i),gamma,dx,dt(iter),rho(i,iter),...
            u(i,iter),p(i,iter),rho_P(i),rho_P(i-1),u_P(i),u_P(i-1),...
            p_P(i),p_P(i-1));
    end

    % Extrapolation to obtain properties at exit
    rho_M = (rho_C(m-2)-rho_C(m-1))/(x(m-2)-x(m-1)); % Density slope
    u_M = (u_C(m-2)-u_C(m-1))/(x(m-2)-x(m-1)); % Velocity slope
    p_M = (p_C(m-2)-p_C(m-1))/(x(m-2)-x(m-1)); % Pressure slope
   
    rho_C(m) = rho_M*(x(m)-x(m-1)) + rho_C(m-1);
    u_C(m) = u_M*(x(m)-x(m-1)) + u_C(m-1);
    p_C(m) = p_M*(x(m)-x(m-1)) + p_C(m-1);
    
    T_C = p_C./rho_C;
    
    % Construct flowfield property matrices
    rho(:,iter+1) = rho_C;
    u(:,iter+1)   = u_C;
    p(:,iter+1)   = p_C;
    T(:,iter+1)   = T_C;
    
end

% Build solutions matrices for increments of 100 iteration steps
rho_Sol = horzcat(rho(:,1),rho(:,101),rho(:,201),rho(:,301),...
    rho(:,401),rho(:,501));
u_Sol   = horzcat(u(:,1),u(:,101),u(:,201),u(:,301),...
    u(:,401),u(:,501));
p_Sol   = horzcat(p(:,1),p(:,101),p(:,201),p(:,301),...
    p(:,401),p(:,501));
T_Sol   = horzcat(T(:,1),T(:,101),T(:,201),T(:,301),...
    T(:,401),T(:,501));
%%
% Analytical Solution
% Solve Mach number
syms M
for i = 1:m
    eqn = (1/M)*((2/(gamma+1))*(1+((gamma-1)/2)*M^2))...
        ^((gamma+1)/(2*(gamma-1))) == A(i);
    Mach = solve(eqn,M);
    Mach = double(Mach);
    if i <= 26;
        M_Ana(i) = Mach(1);
    else i > 26;
        M_Ana(i) = Mach(2);
    end
end
M_Ana = M_Ana';

% Solve other flowfield properties
rho_Ana = (1+((gamma-1)/2)*M_Ana.^2).^-(1/(gamma-1));
p_Ana   = rho_Ana.^gamma;
T_Ana   = p_Ana.^((gamma-1)/gamma);
u_Ana   = M_Ana.*sqrt(T_Ana*(1+(gamma-1)/2));

% Plotting
[row,col] = size(rho_Sol);

figure(fig); fig = fig+1;
plot(x,rho_Sol(:,1)); grid on; hold on;
plot(x,rho_Sol(:,5)); grid on; hold on;
plot(x,rho_Ana);
hold off;
title('\rho vs x','FontSize',20)
xlabel('x','FontSize',16)
ylabel('\rho Density','FontSize',16)
legend('0','500','Analytical')

figure(fig); fig = fig+1;
plot(x,u_Sol(:,1)); grid on; hold on;
plot(x,u_Sol(:,5)); grid on; hold on;
plot(x,u_Ana);
hold off;
title('u vs x','FontSize',20)
xlabel('x','FontSize',16)
ylabel('u Velocity','FontSize',16)
legend('0','500','Analytical','Location','SouthEast')

figure(fig); fig = fig+1;
plot(x,p_Sol(:,1)); grid on; hold on;
plot(x,p_Sol(:,5)); grid on; hold on;
plot(x,p_Ana);
hold off;
title('P vs x','FontSize',20)
xlabel('x','FontSize',16)
ylabel('P Pressure','FontSize',16)
legend('0','500','Analytical')

figure(fig); fig = fig+1;
plot(x,T_Sol(:,1)); grid on; hold on;
plot(x,T_Sol(:,5)); grid on; hold on;
plot(x,T_Ana);
hold off;
title('T vs x','FontSize',20)
xlabel('x','FontSize',16)
ylabel('T Temperature','FontSize',16)
legend('0','500','Analytical')

% Export Data
% Ana = horzcat(x,rho_Ana,u_Ana,p_Ana,T_Ana);
% B = horzcat(x,rho_Sol,u_Sol,p_Sol,T_Sol);
% save B.out B -ASCII
% save Ana.out Ana -ASCII



