d2 = [.0006;.0192;.0433;.0687;.0921;.1169;.1415;.1651;.1899;.2154]; %observed mean squared displacement of cells
t = [1;11;21;31;41;51;61;71;81;91]; %observed elapsed times
a = fminsearch(@fSSR_VL,[2,2],[],t,d2); %calls fSSR function script into fminsearch
fprintf('The estimated values of S (in um/min) and P (in min) are:\n') %formatting
fprintf('%f and %f, respectively\n',a(1),a(2))