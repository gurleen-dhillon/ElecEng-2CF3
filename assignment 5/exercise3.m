%exercise 3 - Gurleen Dhillon - dhillg25 - 400301955
clear all; close all %#ok<CLALL> reset everything

% phase velocity
c = 299792458;        % speed of light
eps_r = 1.0;          % relative permittivity for last digit of student#
vp = c / sqrt(eps_r); % phase velocity

% sine parameters
A = 5;
f = 10^7;
lamda = vp/f;
omega = 2*pi*f;
T = (2*pi)/omega;

% spatial and temporal axes
dz = (3 * lamda); z = linspace(-dz, +dz, 1001);
dt = (3 * T); t = linspace(-dt, +dt * 2, 4501);

% function for the waves
sinusoid = @(tau) A*cos(omega*tau);
s = @(tau) (1+erf(omega*tau))/2;
wave = @(z, ti) sinusoid(ti - z / vp).* s(ti - z / vp);
% function for the superposition
superPosition = @(z, ti) wave(+z, ti) + wave(-z,ti);

% plot1
subplot(3, 1, 1)                                  % 3x1 grid, 1st plot
line1 = animatedline('Color', 'red');             % line in the plot
title("sinusoid traveling in +z direction")       % title
xlabel("z [m]"); ylabel("amplitude")              % axis labels
xlim(z([1 end])); ylim([-A A])                    % axis limits

%plot2
subplot(3, 1, 2)                                  % 3x1 grid, 2nd plot
line2 = animatedline('Color', 'blue');            % line in the plot
title("sinusoid traveling in -z direction")       % title
xlabel("-z [m]"); ylabel("amplitude")             % axis labels
xlim(z([1 end])); ylim([-A A])                    % axis limits

%plot3
subplot(3, 1, 3)                                  % 3x1 grid, 3rd plot
line3 = animatedline('Color', 'magenta');         % line in the plot
title("superposition of sinusoids traveling in +z and -z directions") % title
xlabel("z [m]"); ylabel("amplitude")             % axis labels
xlim(z([1 end])); ylim([-2*A 2*A])                % axis limits

% animation instructions
for ti = t
    clearpoints(line1)
    clearpoints(line2)
    clearpoints(line3)
    addpoints(line1, z, wave(+z, ti)) %plot1
    addpoints(line2, z, wave(-z, ti)) %plot2
    addpoints(line3, z, superPosition(+z, ti)) %plot3
    drawnow limitrate
end