fileID = fopen('DATA011.CSV','r');
tline = fgets(fileID);

data = textscan(fileID, '%f%f%f%f%f%f%f%f%f%f%f', 'Delimiter', ' ');
fclose(fileID);

time = cell2mat(data(1));
filtposMSL = cell2mat(data(2));
filtposAGL = cell2mat(data(3));
filtvel = cell2mat(data(4));
filtacc = cell2mat(data(5));
posMSL = cell2mat(data(6));
posAGL = cell2mat(data(7));
vel = cell2mat(data(8));
acc = cell2mat(data(9));
chutearm = cell2mat(data(10));
chuterelease = cell2mat(data(11));

figure();
hold on
grid on
plot(time(20:end),filtposMSL(20:end));
plot(time(20:end),posMSL(20:end));
legend("filtered","raw");
xlabel("time in seconds");
ylabel("position MSL in meters");
title("position vs time")

figure();
hold on
grid on
plot(time(20:end),3.28084*filtposAGL(20:end));
plot(time(20:end),3.28084*posAGL(20:end));
legend("filtered","raw");
xlabel("time in seconds");
ylabel("position AGL in feet");
title("position AGL vs time")

figure();
hold on
grid on
plot(time(20:end),filtvel(20:end));
plot(time(20:end),vel(20:end));
legend("filtered","raw");
xlabel("time in seconds");
ylabel("velocity meters/second");
title("velocity vs time")

figure();
hold on
grid on
plot(time(20:end),filtacc(20:end));
plot(time(20:end),acc(20:end));
legend("filtered","raw");
xlabel("time in seconds");
ylabel("acceleration in meters/second^2");
title("acceleration vs time")

figure();
hold on
grid on
plot(time,chuterelease);
plot(time,chutearm);
legend("chuterelease","chutearm");
xlabel("time in seconds");
ylabel("flight state");
title("flight states vs time")