clear,clc,close all

%read data from labview file
Fid1 = fopen('Experimental_Electrode_Voltage_Data_30uA_Current.txt','r');
tline = fgets(Fid1);
elecdata = textscan(Fid1, '%f%f', 'Delimiter', ' ');
fclose(Fid1);

%separate data into matrices
time = elecdata{1,1};
voltage = elecdata{1,2};

%calculate resistance using ohms law
resistance = voltage./(30*10^(-6));

%find baseline resistance lazy way
R0 = 0;
ctr = 0;
for x = 30:60
    R0 = R0 + resistance(x);
    ctr = ctr + 1;
end

%R0 is average of first few readings
R0 = R0 / ctr;

%read data from microstrain daq
Fid2 = fopen('Strain.txt','r');
tline = fgets(Fid2);
strain = textscan(Fid2, '%f%s%f%f', 'Delimiter', ' ');
fclose(Fid2);

scan = strain{1,1};
straintimestr = strain{1,2};

straintime = zeros(length(straintimestr),1);

%convert time to seconds in strain file
for x = 1:length(straintimestr)
    string = straintimestr{x,1};
    straintime(x) = str2double(string(end-6)) * 60 + str2double(string(end-4)) * 10 ...
        + str2double(string(end-3)) * 1 + str2double(string(end-1)) * .1 ...
        + str2double(string(end)) * .01;
end

microstrain = strain{1,3};
highlevel = strain{1,4};

figure();
hold on
grid on
grid minor

normDeltaR = 100*(resistance(20:end)-R0)./R0;
plot(time(20:end) + 5.65,normDeltaR,'r','Linewidth',2)
ylabel("\Delta R/R_0 [%]", 'FontSize', 16)
ylim([-2,13])

yyaxis right
ylabel("strain [\mu \epsilon]", 'FontSize', 18)
plot(straintime,microstrain,'b','Linewidth',2)
xlabel("time (seconds)")
ylim([-1000,3550])

legend("Resistance","Strain");
title("Change in Resistance and Strain vs Time for Wet Mixed TPU");

xlim([0,200])

ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';


%find max value of strain measurement
[M1,I1] = max(microstrain);

%find max value of change in resistance
[M2,I2] = max(100*(resistance-R0)./R0);

fprintf("Max strain at time %.3fs with %d ustrain\n",straintime(I1),M1);
fprintf("Max normalized delta R at time %.3fs with %.3f delta R\n",time(I2),M2);


figure()
hold on
grid on
grid minor

straintruncated = microstrain(1:end-5632);
title("Change in Resistance vs Strain for Wet Mixed TPU");
xlabel("strain [\mu \epsilon]", 'FontSize', 18)
ylabel("\Delta R/R_0 [%]", 'FontSize', 16)

cutoffidx = 9550;
plot(straintruncated(1:cutoffidx),normDeltaR(1:cutoffidx),'r','Linewidth',2)
plot(straintruncated(cutoffidx:end),normDeltaR(cutoffidx:end),'b','Linewidth',2)
legend("Loading","Unloading");


