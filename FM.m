%FM
clc;
clear all;
close all;

%messege
ma = 7;
mf = 4;
t = 0:.001:1;
messege = ma*sin(2*pi*mf*t);
subplot(4,1,1);
plot(t, messege, "LineWidth", 1);
axis([0 1 -5 ma+5]);
title('Messege Signal');
grid on;

%Carrier
ca = 10;
cf = 30;
carrier = ca*sin(2*pi*cf*t);
subplot(4,1,2);
plot(t, carrier, "LineWidth", 1);
axis([0 1 -5 ca+5]);
title('Carrier Signal');
grid on;

%modulation;
modulation_index =10;
modulated = ca*sin(2*pi*cf*t+messege);
subplot(4,1,3);
plot(t, modulated, "LineWidth", 1);
axis([0 1 -10 ca+10]);
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
