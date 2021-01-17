%{
Description: For use with main script problem2.m
             function that computes f / derivative of the state (variables)        
Name: Eden Zafran
Date: 12/12/20
%}


function dxdt = dynamicsSIR( x, M, N, alpha, beta, gamma)
% dynamicsSIR computes the rate of change of the model
% Inputs:
%       x: vectorized state
%       M, N: size of the grid
%       alpha, beta, gamma: model parameters
% Output:
%       dxdt: vectorized time derivative of state

% reshape x from vectorized state
reshapedx = reshape(x, [M, N, 3]);
S = reshapedx(:,:, 1);
I = reshapedx(:,:, 2);

dxdtMatrix = zeros( M, N, 3);

% calculate dX/dt and dY/dt

for i = 1:M
    for j = 1:N
        %dS_dt (susceptible)
        dxdtMatrix(i,j,1) = -( beta*(I(i,j)) + alpha*weightI(i,j,I))*S(i,j);
        %dI_dt (infected)
        dxdtMatrix(i,j,2) = (beta*(I(i,j)) + alpha*weightI(i,j,I))*S(i,j) - gamma*I(i,j);
        %dR_dt (recovered)
        dxdtMatrix(i,j,3) = gamma*(I(i,j));
    end
end

% vectorize time derivative of state
dxdt = dxdtMatrix(:);

end