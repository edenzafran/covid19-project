%{
Description: For use with main script problem2.m     
Name: Eden Zafran
Date: 12/12/20
%}

function [t,y] = RK4( f, tspan, y0)
% RK4 Numerically solves the differential equation using the fourth-order
% Runge-Kutta algorithm
% Inputs:
%       f: function handle of f(t,y)
%       tspan: the time period for simulation (should be a 1x2 array that
%       contains start time & end time)
%       y0: the initial conditions for the differential equation
% Outputs:
%       t: corresponding time sequence as a T x 1 vector
%       y: the solution of the differential equation as a T x n matrix,
%       where T is the number of time steps and n is the dimension of y

% set fixed step size
h = 0.1;
% pre-allocate array for t (values of t to evaluate function over)
t = tspan(1):h:tspan(2);
% pre-allocate array for y
numT = length(t);
dimY = length(y0);
y = zeros( numT, dimY);
% initial conditions
y(1,:) = y0;
% # of steps to take
nSteps = length(t)-1;
% initialize counter
n = 1;

while n <= nSteps
    
    % get current values of y & t
    t_n = t(n);
    y_n = y(n,:).';
    
    % rk method
    k_n1 = h*f(t_n,y_n);
    k_n2 = h*f((t_n + 0.5*h), (y_n + 0.5*k_n1));
    k_n3 = h*f((t_n + 0.5*h), (y_n + 0.5*k_n2));
    k_n4 = h*f((t_n + h),(y_n + k_n3));
    
    % calculate y_nplus1 and store in output array
    y_nplus1 = y_n + ((k_n1 + 2*k_n2 + 2*k_n3 + k_n4)/6);
    y(n+1,:) = y_nplus1;
    
    %increment k
    n = n + 1;
end
end

