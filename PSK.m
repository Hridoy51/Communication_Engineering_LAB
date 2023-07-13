clear all;
close all;

bits = [1 0 1 1 0 0 1];

#modulation
bitrate  = 1;
samplingRate = 1000;
samplingTime = 1/samplingRate;
endTime = length(bits)/bitrate;
f = 2;
a = 3;


time = 0:samplingTime:endTime;
signal = a*sin(2*pi*f*time);

modulation = signal;

subplot(3,1,1);
plot(time, signal, "LineWidth", 1);
axis([0 endTime -5 a+5]);
title('Carrier Signal');
grid on;

index = 1;
for i=1:length(time)
  if(bits(index)==1)
    modulation(i) = -modulation(i);
  endif
  if(bitrate*time(i)>=index)
  index=index+1;
  endif
endfor
subplot(3,1,2);
plot(time, modulation, "LineWidth", 1);
axis([0 endTime -5 a+5]);
title('Modulated');
grid on;


%demodulation
index = 1;
for i=1:length(modulation)
  if(modulation(i) != signal(i))
    demodulation(index) = 1;
   else
    demodulation(index) = 0;
  endif
  if(bitrate*time(i)>=index)
  index+=1;
endif
endfor
disp(demodulation);

