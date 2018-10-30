function output = InvestWorth_VL(P, i, n) %sets function name
Year = (1:n)'; %creates a vector of years
Money = P .*(1 + i) .^Year; %calculates money for a given year
output = table(Year,Money); %creates table
end %closes function
