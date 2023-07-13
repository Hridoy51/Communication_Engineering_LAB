%AM
clc;
clear all;
close all;

%messege
ma = 3;
mf = 2;
t = 0:.001:1;
messege = ma*sin(2*pi*mf*t);
subplot(4,1,1);
plot(t, messege, "LineWidth", 1);
axis([0 1 -5 ma+5]);
title('Messege Signal');
grid on;

%Carrier
ca = 3;
cf = 5;
carrier = ca*sin(2*pi*cf*t);
subplot(4,1,2);
plot(t, carrier, "LineWidth", 1);
axis([0 1 -5 ca+5]);
title('Carrier Signal');
grid on;

%modulation
modulated = (ca+messege).*sin(2*pi*cf*t);
subplot(4,1,3);
plot(t, modulated, "LineWidth", 1);
axis([0 1 -10 ca+10]);
title('Modulated Signal');
grid on;
%demodulation
carrier = carrier/ca;
demodulated = (modulated./carrier)-ca;
subplot(4,1,4);
plot(t, demodulated, "LineWidth", 1);
axis([0 1 -5 ca+5]);
title('Demodulated Signal');
grid on;
