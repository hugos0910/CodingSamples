%-----------------------------------------------------------------%
% Author     : Hugo Chiang
% Date       : 11 December 2015
% Class      : AE510 Advance Gas Dynamics
% Instructor : J.C. Dutton
% Abstract   : This function calculates the predictor flow properties
%              at the interior points of a C-D nozzle flowfield 
%              properties using the MacCormack method.
%-----------------------------------------------------------------%
function [rho_P,u_P,p_P] = AE510_Predictor(A,dA,g,dx,dt,rho,rhop,u,up,p,pp)
    % Forward Difference
    drho = rhop - rho;
    du   = up   - u;
    dp   = pp   - p;

    drhodt = -(u*(drho/dx)+rho*(du/dx)+(rho*u/A)*dA);
    dudt   = -(((g+1)/(2*g))*(1/rho)*(dp/dx)+u*(du/dx));
    dpdt   = -(u*(dp/dx)+g*p*(du/dx)+(g*u*p/A)*dA);

    % Obtain predictor values
    rho_P = rho + dt*drhodt;
    u_P   = u + dt*dudt;
    p_P   = p + dt*dpdt;
end

