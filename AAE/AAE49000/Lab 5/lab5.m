clc
clear
close All

fileID = fopen('Session  9-30-2021 11 57 26 AM.csv');
tline = fgets(fileID);

data1 = textscan(fileID,'%f %s%f%f','delimiter',',');

fclose(fileID);

[scannum, timestrain, strain1, strain2] = deal(data1{:});

timestrain = linspace(0,340.278,length(strain1));


fileID2 = fopen('Test1.steps.tracking.csv');
tline = fgets(fileID2);

data2 = textscan(fileID2,'%f%f%f%f%f%f%f%f%f','delimiter',',');

fclose(fileID2);



[time, cyctime, totcyc, elapcyc, step, cyccount,position, load,strain ] = deal(data2{:});


i1 = linspace(0,1,length(strain1));
i2 = linspace(0,1,length(load));


figure()
hold on 
grid on 
grid minor

title("transverse strain vs normal strain")
xlabel("normal strain \mu \epsilon");
ylabel("transverse strain \mu \epsilon")

startval = 1;
endval = 3000;

normalstrain = strain1(startval:endval);
transstrain = strain2(startval:endval);

plot(normalstrain,transstrain,'k','LineWidth',2);

P = polyfit(normalstrain,transstrain,1);
yfit = P(1)*normalstrain+P(2);
plot(normalstrain,yfit,'r-.','LineWidth',1);

legendstr = sprintf("linear fit line with slope %.3f",-P(1));
legend("strain vs strain",legendstr);

avgslope = mean((-strain2./strain1));


strain1 = strain1(1:end - 3177);

figure()
hold on 
grid on 
grid minor

title("Actual Stress Strain Curve for Glass Fiber Specimen")
xlabel("strain (\mu \epsilon)");
ylabel("stress (MPa)")
plot(strain1,(load*1000/(24.54/1000*2.86/1000))/(10^6),'k','LineWidth',2);


figure()
hold on 
grid on 
grid minor


cutoff = 7000;
start = 2800;
strain1 = strain1(start:cutoff);

title("Linear Stress Strain Curve for Glass Fiber Specimen")
xlabel("strain (\mu \epsilon)");
ylabel("stress (MPa)")

strain1 = strain1 - 1600;
%conver to N then divide by cross sectional area 
stress = load(start:cutoff)*1000/(24.54/1000*2.86/1000);
plot(strain1,stress/(10^6),'k','LineWidth',2);

P = polyfit(strain1,stress/(10^6),1);
yfit = P(1)*strain1+P(2);
plot(strain1,yfit,'r-.','LineWidth',1);

legendstr = sprintf("linear fit line with slope %.3g (Pa)",P(1)*10^12);
legend("stress strain",legendstr);

