clear all;
close all;

bits = [1 0 1 1 0 0 1];

#modulation
bitrate  = 1;
voltage  = 5;
sign =1;
samplingRate = 1000;
samplingTime = 1/samplingRate;
endTime = length(bits)/bitrate;
time = 0:samplingTime:endTime;
index = 1;
if(bits(index)==1)
  sign = -1;
endif

for i=1:length(time)
  modulation(i) = sign*voltage;
  if(bitrate*time(i)>=index)
  index=index+1;
  if(index<=length(bits) && bits(index)==1)
  sign = -sign;
  endif
  endif
endfor
plot(time, modulation, "LineWidth", 1);
axis([0 endTime -voltage-5 voltage+5]);
grid on;

%demodulation
index = 1;
last = voltage;

for i=1:length(modulation)
  if(modulation(i) == last)
    demodulation(index) = 0;

  else
    demodulation(index) = 1;
endif
  if(bitrate*time(i)>=index)
  last = modulation(i);
  index+=1;

endif
endfor
disp(demodulation);

