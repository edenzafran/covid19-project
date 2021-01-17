%{
Name of script: problem1.m
                Main Component Analysis with PCA
Description: Implements Principal Component Analysis on COVID-19 data from
             27 countries. Reduces data from 6 variables to 2 variables and
             creates a biplot.
Inputs: myPCA.m
Outputs: Graph of normalized data projected onto the principal components.
Method: Principal Component Analysis (PCA)

Name: Eden Zafran
Date: 11/30/20
%}
clc; clear all; close all;

%% Load dataset (covid_countries.csv)
data = readmatrix("covid_countries.csv");
% removes first 2 columns in covid_countries that are "NaN" (country names)
data(:,1) = [];
data(:,1) = [];

%% Call myPCA function w/ data
[coeffOrth, pcaData] = myPCA(data);

%% Visualize first 2 principal component eigenvectors & projected data w/biplot
% 2D vector subspace
pcaData2D = pcaData(:, 1:2);
% take eigenvectors that correspond to 2 largest eigenvalues
E2D = coeffOrth(:, 1:2);
vbls = { 'Infections', 'Deaths', 'Cures', 'Mortality Rate (%)', 'Cure Rate (%)', 'Infection Rate (%)'};
biplot(E2D, 'Scores', pcaData2D, 'Varlabels', vbls);
title('Principal Component Analysis of COVID-19 Data')