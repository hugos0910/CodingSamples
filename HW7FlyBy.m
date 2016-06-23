format long; format compact; clc; clear;

% Planetary Flyby
CF      = 1.496*10^8;      % AU to km
r_start = 1;               % AU
mu_Sun  = 1.327*10^11;     % km^3/s^2
mu_Mars = 4.28096*10^4;    % km^3/s^2
R_Mars  = 3393;            % km
a_Mars  = 1.5237;          % AUs
T       = 1.5*365*24*3600; % s 
v_s     = 3.569;           % km/s
v_Mars  = sqrt(mu_Sun/(a_Mars*CF))
rp      = 4828 + R_Mars;   % km
% Part 1
a_km    = (T^2*mu_Sun/(4*pi^2))^(1/3); % km
a_AU    = a_km/CF;                        % AU
e    = 1 - r_start/a_AU;

% Part 2
v_ScSun = sqrt(mu_Sun*(2/(a_Mars*CF) - 1/(a_AU*CF)));
alpha   = asin(sqrt(mu_Sun*a_km*(1-e^2))/(a_Mars*CF*v_ScSun));

% Part 3
v_ScM = sqrt((v_ScSun*cos(alpha))^2+(v_ScSun*sin(alpha)-v_Mars)^2);
v_MSun = sqrt(mu_Sun/(a_Mars*CF)); % velocity of Mars w.r.t sun
% v_ScM = v_ScSun - v_MSun;
% v_ScM = 4.511;
% delta = 2*asin(1/(1+(v_ScM/v_s)^2*(rp/R_Mars)));
delta = 2*asin(1/(1+(v_ScM/v_s)^2*(rp/R_Mars)));

% Part 4
v_SO = abs(v_ScM) + v_Mars;

% Part 5
a_New = 1/(2/(a_Mars*CF) - v_SO^2/mu_Sun); % km
T_New = sqrt(4*pi^2*a_New^3/mu_Sun);  % s
T_New = T_New/(3600*24*365); % year

