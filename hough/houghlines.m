function lines = houghlines(f, theta, rho, rr, cc, fillgap, minlength)
%   HOUGHLINES extracts line segments based on the the Hough transform.
%   LINES = HOUGHLINES(F, THETA, RHO, RR, CC, FILLGAP, MINLENGTH)

if nargin < 6
    fillgap = 10;
end
if nargin < 7
    minlength = 20;
end

numlines = 0; lines = struct;
for k = 1:length(rr)
    rbin = rr(k); cbin = cc(k);
    % Get all pixels associated with Hough transform cell.
    [r, c] = houghpixels(f, theta, rho, rbin, cbin);
    if isempty(r)
        continue;
    end
    
    % Rotate the pixels locations about (1, 1) so that they lie 
    % approximately along a vertical line.
    omega = (90 - theta(cbin))*pi/180;
    T = [ cos(omega) sin(omega);...
         -sin(omega) cos(omega)];
    xy = [r - 1 c - 1]*T;
    x = sort(xy(:, 1));
    
    % Find the gaps larger than the threshold.
    diff_x = [diff(x); Inf];
    idx = [0; find(diff_x > fillgap)];
    for p = 1:length(idx) - 1;
        x1 = x(idx(p) + 1);
        x2 = x(idx(p + 1));
        linelength = x2 - x1;
        if linelength >= minlength
            point1 = [x1 rho(rbin)];
            point2 = [x2 rho(rbin)];
            
            % Rotate the end-point locations back to the original angle.
            Tinv = inv(T);
            point1 = point1*Tinv;
            point2 = point2*Tinv;
            numlines = numlines + 1;
            lines(numlines).point1 = point1 + 1;
            lines(numlines).point2 = point2 + 1;
            lines(numlines).length = linelength;
            lines(numlines).theta = theta(cbin);
            lines(numlines).rho = rho(rbin);
        end
    end
end
