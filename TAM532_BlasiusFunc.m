%-----------------------------------------------------------------%
% Author     : Hugo Chiang
% Date       : 11 April 2016
% Class      : TAM532 Viscous Flow
% Instructor : Leonardo Chamorrow
% Abstract   : This is the Blasius function used to calculate the  
%              f derivatives.  This will be fed into ode45 for 
%              integration.
%
%-----------------------------------------------------------------%
function df = TAM532_BlasiusFunc(eta,f) 
% f() is array of f and its derivatives:  f = f(1)  f' = f(2) f" = f(3) 
df = zeros(3,1); 
% df() is array of the derivatives of f() 
df(1) = f(2);           
df(2) = f(3); 
df(3) = -f(1)*f(3)/2;
end

