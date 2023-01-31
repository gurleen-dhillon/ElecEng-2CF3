%exercise 3 - Gurleen Dhillon - dhillg25 - 400301955
clear all; close all %#ok<CLALL> reset everything

%parameters
R = 1.8;
L = 286;
G = 0.65;
C = 115;
F = 1,000,000,000;
W = F*(2*pi);

%plot equations
Z = sqrt((R + i*W*L)/(G + i*W*C));
y = sqrt((R + i*W*L)*(G + i*W*C));
a = real(y); %a
b = imag(y); %b
c = W/b;     %c
d = real(Z); %d
e = imag(Z); %e


%a
subplot(5, 1, 1)
fplot(a, [1*F 10*F], 'red')
title("attenuation constant") %title
xlabel('frequency (GHz)');

%b
subplot(5, 1, 2)
fplot(b, [1*F 10*F], 'blue')
title("phase constant")
xlabel('frequency (GHz)');

%c
subplot(5, 1, 3)
fplot(c, [1*F 10*F], 'green')
title("phase velocity")
xlabel('frequency (GHz)'); 

%d
subplot(5, 1, 4)
fplot(d, [1*F 10*F], 'magenta')
title("real part of characteristic impedance")
xlabel('frequency (GHz)');

%e
subplot(5, 1, 5)
fplot(e, [1*F 10*F], 'black')
title("imaginary part of characteristic impedance")
xlabel('frequency (GHz)');

