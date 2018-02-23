function [ roots ] = nth_roots_of_complex( x, y, n )

%This function computes all the nth roots of a user-defined complex number 
% in z = x + iy form. In other words, this program finds all roots of 
% the equation (x + iy)^(1/n) when x, y, and n are given.
%
%---------------------------------------------------------------------

z = x + 1i*y;                       %complex number                  

r = abs(z);                         %calculate r
theta = atan2(imag(z), real(z));    %calculate theta

theta_increment = 2*pi/n;           %calculate +2kpi

r_n = r^(1/n);                      %calculate nth root of r
                                    % and theta/n for use in
theta_n = theta/n;                  % nth root equation

roots = zeros(n,1);                 %create 1xn array of zeros
for j = 1:n                         %compute roots and assign to array
    k = j - 1;
    angle = theta_n + (k*theta_increment);
    roots(j) = r_n*(cos(angle) + (1i*sin(angle)));
    
    polar(angle, abs(r_n), 'bo');   %plot roots on polar plot
    hold on
end

hold off
