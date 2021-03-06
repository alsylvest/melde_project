function [antenna_factor] = antenna_factor(num_elements, k, d, amplitude, phase)
%Antenna Array: Computes the antenna array pattern with uniform spacing
n = 0:(num_elements-1);
af = zeros(1, 360);
for theta = 1:360
    phi_exp = phase + (amplitude .* (k * d * cosd(theta)));
    af(theta) = sum(exp(1i .* n .* phi_exp)); 
end
af = af ./ max(abs(af));
theta = (pi/180) .* (1:360);
%polarplot(theta, abs(af));
antenna_factor = af;
end