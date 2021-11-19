clear,clc,close all

%read data from labview file
Fid1 = fopen('Specimen 3/Electrode/Experimental_Electrode_Voltage_Data_39uA_Current.txt','r');
tline = fgets(Fid1);
elecdata = textscan(Fid1, '%f%f', 'Delimiter', ' ');
fclose(Fid1);

%separate data into matrices
vol_time = elecdata{1,1};
voltage = elecdata{1,2};

%read data from instron file
Fid2 = fopen('Specimen 3/Instron/Test1.steps.tracking.csv','r');
tline = fgets(Fid2);
instrondata = textscan(Fid2, '%f%f%f%f%f%f%f%f%f', 'Delimiter', ',');
fclose(Fid2);

str_time = instrondata{1,1};
strain = instrondata{1,9};

%calculate resistance using ohms law
resistance = voltage./(39*10^(-6));

%find baseline resistance lazy way
R0 = 0;
ctr = 0;
for x = 30:60
    R0 = R0 + resistance(x);
    ctr = ctr + 1;
end

%R0 is average of first few readings
R0 = R0 / ctr;

%%%
%%% First subplot 
%%%
subplot(2,3,[1,2,3]);
hold on
grid on
grid minor

yyaxis right
ylabel("strain [\mu \epsilon]", 'FontSize', 18)
plot(str_time,strain.*10000,'b','Linewidth',.01)
xlabel("time (seconds)")

yyaxis left
xlim([0 1050])
normDeltaR = 100*(resistance(20:end)-R0)./R0;
plot(vol_time(20:end),normDeltaR,'r','Linewidth',2)
ylabel("\Delta R/R_0 [%]", 'FontSize', 16)


legend("Resistance","Strain");
title("Change in Resistance and Strain vs Time for Wet Mixed TPU");
subtitle("Cyclic Loading up to 1% Engineering Strain at 0.01Hz")

ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';

%%%
%%% Second subplot 
%%%
subplot(2,3,4);
hold on
grid on
grid minor
xlim([30 130])
ylim([-15 15])

normDeltaR = 100*(resistance(20:end)-R0)./R0;
plot(vol_time(20:end),normDeltaR,'r','Linewidth',.01)
ylabel("\Delta R/R_0 [%]", 'FontSize', 16)

yyaxis right
plot(str_time,strain.*10000,'b','Linewidth',.01)
xlabel("time (seconds)")

title("1st cycle");
legend("Resistance","Strain");

ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';

%%%
%%% third subplot 
%%%
subplot(2,3,5);
hold on
grid on
grid minor
xlim([530 630])
ylim([-15 15])

normDeltaR = 100*(resistance(20:end)-R0)./R0;
plot(vol_time(20:end),normDeltaR,'r','Linewidth',.01)

yyaxis right
plot(str_time,strain.*10000,'b','Linewidth',.01)
xlabel("time (seconds)")

title("5th cycle");
legend("Resistance","Strain");

ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';

%%%
%%% fourth subplot 
%%%
subplot(2,3,6);
hold on
grid on
grid minor
xlim([930 1030])
ylim([-15 15])

normDeltaR = 100*(resistance(20:end)-R0)./R0;
plot(vol_time(20:end),normDeltaR,'r','Linewidth',.01)

yyaxis right
plot(str_time,strain.*10000,'b','Linewidth',.01)
xlabel("time (seconds)")

yyaxis right
ylabel("strain [\mu \epsilon]", 'FontSize', 18)

title("10th cycle");
legend("Resistance","Strain");

ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';

