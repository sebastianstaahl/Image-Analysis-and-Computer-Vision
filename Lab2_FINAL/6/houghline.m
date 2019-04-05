function [linepar, acc] = houghline(curves, magnitude, nrho, ntheta, threshold, nlines, verbose)

%Skriv om..
%{
1.linepar is a list of (?, ?) parameters for each line segment,
2.acc is the accumulator matrix of the Hough transform,
3.curves are the polygons from which the 
transform is to be computed,
4. magnitude is an image with one intensity value per pixel
5.nrho is the number of accumulators in the ? direction,
6. ntheta is the number of accumulators in the ? direction
7. threshold is the lowest value allowed for the given magnitude
8. nlines is the number of lines to be extracted,
9. verbose denotes the degree of extra information and figures
 that will be shown.
    %}
    
% Check if input appear to be valid
    
% Allocate accumulator space (ptheta space)
acc = zeros(nrho, ntheta);

% Define a coordinate system in the accumulator space SEE: p.756 book GW
D = sqrt(size(magnitude, 1)^2 + size(magnitude, 2)^2); %D max distance bwteen oposite coorners in the image
%D=256;
%changed D to 
%rho_dir_y = linspace(-nrho/2, nrho/2, nrho);  
rho_dir_y = linspace(-D, D, nrho); 

thetamax=pi/2;
theta_dir_x=linspace(-thetamax,thetamax, ntheta); 



% Loop over all the input curves (cf. pixelplotcurves)
no_curves=0;
trypointer=1;
insize = size(curves, 2); % antal kurvor

while trypointer <=insize
    no_curves = no_curves+1;
    poly_len = curves(2, trypointer);
    trypointer = trypointer + 1;

% For each point on each curve
    for curvidx = 1 : poly_len
        x=curves(2, trypointer); % we get the coords of each point on each curve
        y=curves(1, trypointer);
        trypointer= trypointer+ 1;

% Check if valid point with respect to threshold
        if (magnitude(round(x), round(y)) > threshold)
        % Optionally, keep value from magnitude image
        %????????????????????????????
            %deltaS=1;   %6.2 letting the increment always be equal to one. A
           %deltaS=log(mag);      %monotonically increasing func eg log and ln
          
           % Loop over a set of theta values
        for theta_idx = 1 : ntheta
            
            
            % Compute rho for each theta value
            theta_1 = theta_dir_x(theta_idx); 
            rho_1=x*cos(theta_1)+ y*sin(theta_1);
                
            % Compute index values in the accumulator space
            [dummy, rho_idx_pl] = min(abs(rho_dir_y - rho_1)); % p. 756 the found rho values are then rounded of fto the nearest allowed cellvalue along rho axis
            %rho_idx_pl=find(rho_dir_y<rho,1,'last');
            %rho_idx   
            %we will not compute a pint whihc fits perfectly into the
                %grid. instead we find the closest point
            
            % Update the accumulator
            %acc(rho_idx_pl, theta_idx) = acc(rho_idx_pl, theta_idx) +log(magnitude(round(x),round(y))); %how many lines vote for this point in acc space
            acc(rho_idx_pl, theta_idx) = acc(rho_idx_pl, theta_idx) + 1; %how many lines vote for this point in acc space
        end
        
        
        end
    end
end




%{
If you unable to achieve enough accuracy without getting too many multiple responses, it might
be advantageous to smoothen the histogram with a call to binsepsmoothiter.m, before detecting
local maxima.
%}
%acctmp = binsepsmoothiter(acc,0,10);

% Extract local maxima from the accumulator
[pos, value] = locmax8(acc);
[dummy, indexvector] = sort(value);
nmaxima = size(value, 1);


linepar = zeros(2, nlines);
% Delimit the number of responses if necessary
% Compute a line for each one of the strongest responses in the accumulator
for line_idx = 1:nlines
    rhoidxacc = pos(indexvector(nmaxima - line_idx + 1), 1);
    thetaidxacc = pos(indexvector(nmaxima - line_idx + 1), 2);
    rho=rho_dir_y(rhoidxacc); %plocka rho vardte p? den platsen
    theta=theta_dir_x(thetaidxacc);
    if theta == 0
      theta = 1e-7;
    end
        linepar(:,line_idx)=[rho;theta];
end
% Overlay these curves on the gradient magnitude image
% Return the output data
end

