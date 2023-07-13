%PM
clc;
clear all;
close all;

%messege
ma = 1;
mf = 2;
t = 0:.001:3;
messege = ma*sin(2*pi*mf*t);
subplot(4,1,1);
plot(t, messege, "LineWidth", 1);
title('Messege Signal');
grid on;

%Carrier
ca = 1;
cf = 30;
carrier = ca*cos(2*pi*cf*t);
subplot(4,1,2);
plot(t, carrier, "LineWidth", 1);
title('Carrier Signal');
grid on;

%modulation;
kp =10;
modulated = ca*cos(2*pi*cf*t+kp*messege);
subplot(4,1,3);
plot(t, modulated, "LineWidth", 1);
title('Modulated Signal');
grid on;
%demodulation
x = abs(diff(modulated));
%pkg install -forge signal
pkg load signal
[a,b] = butter(10,0.03);
demodulated = filter(a,b,x);
subplot(4,1,4);
plot(demodulated);
title('Demodulated Signal');
grid on;
