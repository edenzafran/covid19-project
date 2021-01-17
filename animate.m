%{
Description: For use with main script project_105344247_p2.m
Name: Eden Zafran
Date: 12/12/20
UID: 105344247
%}

function animate(X)
% A function that shows the change in the ratio of susceptible,
% infected, and recovered individuals in the grid as an image.
%
% Inputs:
%   X: an M*N*3*length(t) matrix, where each point in the M*N space
%       corresponds to a single grid with 3 numbers between 0 and 1 showing
%       the SIR result. this 3D matrix is repeated for each time step
%       making it a 4D matrix.
% Outputs: N/A
S = size(X);
M = S(1);
N = S(2);
endTime = S(4);
% display image at every 10th time step
timeSteps = 0:1:endTime;
figure();

% save video of animation to current folder
v = VideoWriter('SIR_Model_RK4Solver');
open(v)

for  t = 1:10: length(timeSteps)
    
    color = zeros(M,N,3);
    
    % set colors to datasets
    color(:,:,1) = X(:,:,2,t);   % red
    color(:,:,2) = X(:,:,3,t);   % green
    color(:,:,3) = X(:,:,1,t); % blue
    image(color);
    title('Spatial S.I.R. Model of Spead of Disease in a Fixed Population');
    colorbar;
    % pause 0.1s between each frame
    pause(0.1);
    
    % get content of current frame
    frame = getframe(gcf);
    % save frame into video writer
    writeVideo(v,frame);   
end
end
