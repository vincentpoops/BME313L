t = [140;141;142;143;144;145;146;147;148;149;150]; %given values
C = [15.72;15.53;15.19;16.56;16.21;17.39;17.36;17.42;17.60;17.75;18.95];
O = [15.49;16.16;15.35;15.13;14.20;14.23;14.29;12.74;14.74;13.68;14.51];
f = MySimpsons_VL(t,C); %solutions using simpson's 1/3 rule
g = MySimpsons_VL(t,O);
h = trapz(t,C); %solutions using trapezoidal rule
i = trapz(t,O);
fprintf('The CO2 and O2 consumed calculated using the Simpson''s 1/3 rule is\n%f and %f, respectively\n',f,g) %outputs result
fprintf('The CO2 and O2 consumed calculated using the trapezoidal rule is \n%f and %f, respectively\n',h,i)