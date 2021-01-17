%{
Description: For use with main script problem2.m
Name: Eden Zafran
Date: 12/12/20
%}

function plotTimeSeries(t, X, x, y)
% plotTimeSeries: a function that plots and saves the local S.I.R distribution at spatial coordianate (x, y).
% Inputs:
%   t: a vector of time steps
%   X: an M*N*3*length(t) matrix, where each point in the M*N space
%       corresponds to a local S.I.R. model with states whose values
%       are between 0 and 1. This 3D matrix is repeated for each time step,
%       making it a 4D matrix.
%   x: the spatial x-coordinate on the grid
%   y: the spatial y-coordinate on the grid
% Outputs: N/A

% plot percentage of susceptible population
h = figure(1); subplot(3,1,1); 
hold on
plotter1 = zeros(length(t), 1);
for q = 1 : length(t) 
    plotter1(q) = X( x, y, 1, q);
end
plot(t, plotter1, 'b-');
xlabel('Time');
ylabel('Susceptible');
s = sprintf('Susceptible at (%d,%d)', x,y);
title(s);
hold off

% plot percentage of infected population
hold on
figure(1); subplot(3,1,2);
plotter2 = zeros(length(t), 1);
for q = 1 : length(t) 
    plotter2(q) = X( x, y, 2, q);
end
plot(t, plotter2, 'r-');
xlabel('Time');
ylabel('Infected');
s = sprintf('Infected at (%d,%d)', x,y);
title(s);
hold off

% plot percentage of recovered population
hold on
figure(1); subplot(3,1,3);
plotter3 = zeros(length(t), 1);
for q = 1 : length(t) 
    plotter3(q) = X( x, y, 3, q);
end
plot(t, plotter3, 'g-');
xlabel('Time');
ylabel('Recovered');
s = sprintf('Recovered at (%d,%d)', x,y);
title(s);
hold off

% save png file to current folder
filename = sprintf('time_series_%d_%d.png', x,y);
saveas(h, filename);
end