%{
Name of script: problem2.m
                Solving the Spatial S.I.R Model
Description: Solves the Spatial S.I.R Model 
Inputs: RK4.m, ode45.m, dynamicsSIR.m, solveSpatialSIR.m, plotTimeSeries.m,
        animate.m
Outputs: Times solving SIR model using ODE45 as the differential equation
        solver against a custom RK4 solver & displays to command window.
        Plots local SIR model at specified point in space & saves graph to
        current folder. Creates animation of spatial SIR model and saves to
        current folder.

Name: Eden Zafran
Date: 11/30/20
%}
clc; clear all; close all;

%% Load dataset (InitialValues.mat) & Initialize Model Parameters
data = load('InitialValues.mat');
initialCondition = data.initialConditions;     % extracts MxNx3 array
initialConditionSize = size(initialCondition);
M = initialConditionSize(1);
N = initialConditionSize(2);
% other dimension is 3

alpha = 0.1;
beta = 0.05;
gamma = 0.1;
tFinal = 60;

%% Solve Spatial SIR system w RK4
% pass RK4 solver
tic;
[trk4, xrk4] = solveSpatialSIR( tFinal, initialCondition, alpha, beta, gamma, @RK4);
RK4runtime = toc;
% output runtime of RK4 solver
fprintf('RK4 Solver Runtime: %.4f seconds.\n', RK4runtime);

%% Solve Spatial SIR system w ODE45
% pass ode45
tic;
[tode, xode] = solveSpatialSIR( tFinal, initialCondition, alpha, beta, gamma, @ode45);
ode45runtime = toc;
% output runtime of ODE45 solver
fprintf('ODE45 Solver Runtime: %.4f seconds.\n', ode45runtime);

%% Call plotTimeSeries function RK4 solved system
t = trk4;
X = xrk4;

%%% ---- replace this x and y with the desired grid coordinates --- %%%
x = 1; 
y = 1;
plotTimeSeries(t, X, x, y)

%% Call animate function on RK4 solved system to generate 2d animation
animate(X)