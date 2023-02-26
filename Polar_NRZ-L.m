clear all;
close all;

bits = [1 0 1 1 0 0 1];

#modulation
bitrate  = 1;
voltage  = 5;
samplingRate = 1000;
samplingTime = 1/samplingRate;
endTime = length(bits)/bitrate;
time = 0:samplingTime:endTime;
index = 1;
for i=1:length(time)
  if(bits(index)==1)
    modulation(i) = voltage;
  else
    modulation(i) = -voltage;
  endif
  if(bitrate*time(i)>=index)
  index=index+1;
  endif
endfor
plot(time, modulation, "LineWidth", 1);
axis([0 endTime -voltage-5 voltage+5]);
grid on;


%demodulation
index = 1;
for i=1:length(modulation)
  if(modulation(i) == voltage)
    demodulation(index) = 1;
    endif
  if(modulation(i) == -voltage)
    demodulation(index) = 0;
endif
  if(bitrate*time(i)>=index)
  index+=1;
endif
endfor
disp(demodulation);

