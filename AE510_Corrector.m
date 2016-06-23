%-----------------------------------------------------------------%
% Author     : Hugo Chiang
% Date       : 11 December 2015
% Class      : AE510 Advance Gas Dynamics
% Instructor : J.C. Dutton
% Abstract   : This function calculates the coorector flow properties
%              at the interior points of a C-D nozzle flowfield 
%              properties using the MacCormack method.
%-----------------------------------------------------------------%
function [rho_C,u_C,p_C] = AE510_Corrector(A,dA,g,dx,dt,rho,u,p,...
    rho_P,rhom_P,u_P,um_P,p_P,pm_P)
    % Backward Difference
    drho = rho_P - rhom_P;
    du   = u_P   - um_P;
    dp   = p_P   - pm_P;
    
    drhodt = -(u_P*(drho/dx)+rho_P*(du/dx)+(rho_P*u_P/A)*dA);
    dudt   = -(((g+1)/(2*g))*(1/rho_P)*(dp/dx)+u_P*(du/dx));
    dpdt   = -(u_P*(dp/dx)+g*p_P*(du/dx)+(g*u_P*p_P/A)*dA);
 
    % Obtain predictor values
    rho_C = 0.5*(rho + rho_P + dt*drhodt);
    u_C   = 0.5*(u + u_P + dt*dudt);
    p_C   = 0.5*(p + p_P + dt*dpdt);
    
end