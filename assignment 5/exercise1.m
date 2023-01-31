%exercise 1 - Gurleen Dhillon - dhillg25 - 400301955
clear all; close all %#ok<CLALL> reset everything

% phase velocity
c = 299792458;        % speed of light
eps_r = 1.0;          % relative permittivity for last digit of student#
vp = c / sqrt(eps_r); % phase velocity

% Gaussian pulse parameters
alpha = 10.0 ^ 8;     % pulse witch for last digit of student#
A = 5;

% spatial and temporal axes
dz = (3 * vp) / sqrt(2 * alpha); z = linspace(-dz, +dz, 1001);
dt = 6 / sqrt(2 * alpha); t = linspace(-dt, +dt, 2001);

% function for a Gaussian pulse centered at the origin
gauss = @(tau) A * exp(-alpha * tau.^2);
% function for the corresponding wave over all points z at single time ti
wave = @(z, ti) gauss(ti - z / vp);
% function for the superposition wave over all points z at single time ti
superPosition = @(z, ti) gauss(ti - z/vp) + gauss(ti + z/vp);

% plot1
subplot(3, 1, 1)                                  % 3x1 grid, 1st plot
line1 = animatedline('Color', 'red');             % line in the plot
title("Gaussian pulse traveling in +z direction") % title
xlabel("z [m]"); ylabel("amplitude")              % axis labels
xlim(z([1 end])); ylim([0 A])                     % axis limits

%plot2
subplot(3, 1, 2)                                  % 3x1 grid, 2nd plot
line2 = animatedline('Color', 'blue');            % line in the plot
title("Gaussian pulse traveling in -z direction") % title
xlabel("-z [m]"); ylabel("amplitude")             % axis labels
xlim(z([1 end])); ylim([0 A])                     % axis limits

%plot3
subplot(3, 1, 3)                                  % 3x1 grid, 3rd plot
line3 = animatedline('Color', 'magenta');         % line in the plot
title("Superposition of the gaussian pulses traveling in -z and +z directions") % title
xlabel("z [m]"); ylabel("amplitude")              % axis labels
xlim(z([1 end])); ylim([0 2*A])                   % axis limits

% animation instructions
for ti = t
    clearpoints(line1)
    clearpoints(line2)
    clearpoints(line3)
    addpoints(line1, z, wave(+z, ti)) %plot1
    addpoints(line2, z, wave(-z, ti)) %plot2
    addpoints(line3, z, superPosition(z, ti)) %plot3
    drawnow limitrate
end