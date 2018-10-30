function output = my_maclaurin_VL(x,e)
N = 1 / (1 - x); %equation being compared to
n = 0; %initializes counter
M = 1; %initializes series
Result(1) = M; %sets first value of result
error = abs((N - M)/N); %calculates initial error
TrueError(1) = error; %puts error in vector
ApproxError(1) = 1; %starts approxerror vector
while error > e %loop to repeat series
n = n + 1; %updates counter
M = M + x^n; %adds next value to series
Result(end+1) = M; %stores result in vector
error = abs((N - M)/N); %calculates error
TrueError(end+1) = error; %stores error in vector
ApproxError(end+1) = (Result(end)-Result(end-1))/Result(end); %calculates approximate error
end %closes loop
Terms = (1:(n+1))'; %makes all the vectors vertical to be used in a table
TrueError = TrueError';
Result = Result';
ApproxError = ApproxError';
table(Terms,Result,TrueError,ApproxError) %creates table
disp('Number of terms used: ') %displays how many terms were used
disp(n+1)
end %closes function
