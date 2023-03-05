clear all;
close all;

bits = [1 0 0 0 0 0 0 0 0 1];


#modulation
bitrate  = 1;
voltage  = 5;
samplingRate = 1000;
samplingTime = 1/samplingRate;
endTime = length(bits)/bitrate;
time = 0:samplingTime:endTime;
index = 1;
count=0;
for i=1:length(bits)
  if(bits(i)==0)
  count+=1;
endif
if(bits(i)==1)
count=0;
endif
if(count==8)
bits(i-1) = -1;
bits(i) = 1;
bits(i-3) = 1;
bits(i-4) = -1;
count=0;
endif
endfor
pre = 1;
if(bits(1)==1)
pre = -pre;
endif
for i=1:length(time)
if(bits(index)==1)
modulation(i) = voltage*(pre);
endif
if(bits(index)==0)
modulation(i) = 0;
endif
if(bits(index)==-1)
modulation(i) = voltage*pre;
endif
if(bitrate*time(i)>=index)
index=index+1;
if(index<=length(bits) && bits(index)==1)
pre = -pre;
endif
endif
endfor
plot(time, modulation, "LineWidth", 1);
axis([0 endTime -voltage-5 voltage+5]);
grid on;


%demodulation
index = 1;
pre = voltage;
for i=1:length(modulation)
if(modulation(i) == 0)
demodulation(index) = 0;
endif
if(modulation(i)!=0)
if(pre==modulation(i))
demodulation(index)=-1;
else
demodulation(index)=1;
endif
endif
if(bitrate*time(i)>=index)
if(modulation(i)!=0)
pre  = modulation(i);
endif
index+=1;
endif
endfor
for i=1:length(demodulation)
  if(demodulation(i)==-1)
    demodulation(i)=0;
    demodulation(i+1)=0;
  endif
endfor
disp(demodulation);

