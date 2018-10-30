t = 0:.5:10; %days vector
A = 1000; %given parameters
Q = 400;
a = 50;
y = zeros(1,length(t)); %creates vector of matching length
yi = 0; %initial y
y(1) = yi; %sets initial y
for i = 2:length(t) %for loop to use previous values
dy = (((3*(Q/A)* (cos(t(i))).^2) - (a/A)*(1 + y(i)).^1.5)); %the change in y for any given time
yf = yi + (.5 * dy); %euler method for y
y(i) = yf;
yi = yf;
end
dy = 3*Q/A*(cos(t)).^2-a/A*(1+y).^1.5; %same as before but independent of i
A = [t;y]; %Creates matrix
fprintf('Time(days)\tHeight of water\n');%title for table
fprintf('%.1f         %f\n',A);%parameters for table
plot(t,y,t,dy,'--')%creates plot
legend('y vs time','dy/dt vs time')%labels plot
xlabel('Time (days)')
ylabel('Height (units)')
title('Height of water and Change in height with respect to Time')
