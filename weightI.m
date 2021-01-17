%{
Description: For use with main script project_105344247_p2.m   
Name: Eden Zafran
Date: 12/12/20
UID: 105344247
%}

function [weight] = weightI(m,n,I)
% Weighting function that describes the proximity of neighbors in the spatial SIR
% model (with a fixed number of rows/columns) and weights the infection rate.
% Inputs:
%   m: row number
%   n: column number
% Outputs: Weighted infection rate.

% from problem statement
rows = 50;
columns = 75;

if (m == 1 && n == 1)
    % bottom left corner node
    weight = 1*( I(m,n+1) + I(m+1,n) ) + (1/sqrt(2))*I(m+1,n+1);
else
    if (m == rows && n == 1)
        % bottom right corner node
        weight = 1*( I(m-1,n) + I(m,n+1)) + (1/sqrt(2))*I(m-1,n+1);
    else
        if (m == 1 && n == columns)
            % top left corner node
            weight = 1*( I(m,n-1) + I(m+1,n)) + (1/sqrt(2))*I(m+1,n-1);
        else
            if (m == rows && n == columns)
                %top right corner node
                weight = 1*( I(m,n-1) + I(m-1,n)) + (1/sqrt(2))*I(m-1,n-1);
            else
                if (m == 1)
                    % left side
                    weight = 1*( I(m,n-1) + I(m,n+1) + I(m+1,n)) + (1/sqrt(2))*(I(m+1,n-1) + I(m+1,n+1));
                else
                    if (m == rows)
                        % right side
                        weight = 1*( I(m,n-1) + I(m,n+1) + I(m-1,n)) + (1/sqrt(2))*(I(m-1,n-1) + I(m-1,n+1));   
                    else
                        if(n == 1)
                            % bottom edge
                            weight = 1*( I(m+1,n) + I(m-1,n) + I(m,n+1)) + (1/sqrt(2))*(I(m-1,n+1) + I(m+1,n+1));
                        else
                            if (n == columns)
                                %top edge
                                weight = 1*( I(m+1,n) + I(m-1,n) + I(m,n-1)) + (1/sqrt(2))*(I(m-1,n-1) + I(m+1,n-1));
                            else
                                % interior cell
                                weight = 1*( I(m+1,n) + I(m-1,n) + I(m, n+1) + I(m, n-1)) + (1/sqrt(2))* ( I(m+1,n+1) + I(m+1,n-1) + I(m-1,n+1) + I(m-1,n-1) );
                            end
                        end
                    end
                end
            end
        end
    end
end

            

end

