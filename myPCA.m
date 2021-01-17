%{
Description: For use with main script problem1.m 
Name: Eden Zafran
Date: 12/12/20
%}

function [coeffOrth, pcaData] = myPCA(data)
% myPCA analyzes the principal components of given COVID-19 statistical data from multiple countries - covid_countries.csv
% Inputs:
%   data: A nxp matrix representing only the numerical parts of the dataset
% Outputs:
%   coeffOrth: a pxp matrix whose columns are the eigenvectors corresponding to the sorted eigenvalues
%   pcaData: a nxp matrix representing the data projected onto the principal components


%%% ---  normalize data --- %%%
% size of matrix
dataSize = size(data);
% # of rows (countries) in matrix data
numRows = dataSize(1,1);
% # of columns (variables) in matrix data
numColumns = dataSize(1,2);

% compute mean of values in each column
dataMean = mean(data);
%compute std of values in each column
dataStd = std(data);

% preallocate new matrix for normalized values
dataNorm = zeros(numRows, numColumns);
% replace each element of data with (element - mean)/std to get dataNorm 
for m = 1 : numColumns
    for n = 1 : numRows
        dataNorm(n,m) = (data(n,m) - dataMean(m))/dataStd(m);
    end
end

%%% ---  covariance matrix computation --- %%%
dataCovMatrix = cov(dataNorm);

%%% ---  compute eigenvalues/ eigenvectors from covariance matrix --- %%%
[dataEigvectors, ~]  = eig(dataCovMatrix);
dataEigvalues = eig(dataCovMatrix);
% take abs so there are no negative eigenvalues
dataEigvalues = abs(dataEigvalues);

%%% ---  sort eigenvalues/vectors from largest to smallest --- %%%
[~, I] = sortrows(dataEigvalues, 'descend');
coeffOrth = dataEigvectors(:,I);

%%% ---  project dataNorm onto space spanned by eigenvectors --- %%%
pcaData = dataNorm*coeffOrth;
end