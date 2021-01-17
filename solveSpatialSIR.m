%{
Description: For use with main script problem2.m
             function that integrates f / solves derivatives of state
Name: Eden Zafran
Date: 12/12/20
%}

function [t, x] = solveSpatialSIR( tFinal, initialCondition, alpha, beta, gamma, odeSolver)
% solveSpatialSIR solves the spatial SIR model
% Inputs:
%   tFinal: end time for the simulation (assuming start is t = 0)
%   initialCondition: a MxNx3 matrix that sums to 1 in third dimension
%   odeSolver: a function handle for an ode45-compatible solver
% Outputs:
%   t: a vector of the time-steps
%   x: MxNx3xlegth(t) matrix representing the state vs. time

% find size of original data
S = size(initialCondition);
M = S(1);
N = S(2);

% wrap function in anonymous function
dSIRdt =  @(t,x) dynamicsSIR( x, M, N, alpha, beta, gamma);

% make initialCondition into a vector for passing into odeSolver
initialCondition = initialCondition(:);

% solve using the passed in solver
[t,y] = odeSolver( dSIRdt, [0, tFinal], initialCondition);

% size of y matrix (2D) is (length(t) x M x N x 3)
% reshape from 2D matrix to 4D matrix
yInt = reshape( y, [length(t), M, N, 3]);
% re-arrange order of data back to match original M x N x 3 x length(t) (4D)
x = permute( yInt, [2, 3, 4, 1]);


end