m = [.1;.2;.3;.4;.5;.6;.7;.8]; %data
n12 = [.02926;.05733;.08323;.10631;.12626;.14309;.15703;.16843];
n14 = [.03007;.05894;.08561;.10941;.13003;.14749;.16199;.17389];
n16 = [.03058;.05994;.08709;.11135;.13241;.15027;.16515;.17739];
p12 = polyfit(m,n12,3); %fitting curves
p14 = polyfit(m,n14,3);
p16 = polyfit(m,n16,3);
f12 = polyval(p12,.56); %solving function values using fitted curves
f14 = polyval(p14,.48);
f16 = polyval(p16,.42);
s12 = f12 * 100/(5.6*12); %calculating sigmas
s14 = f14 * 100/(4.8*14);
s16 = f16 * 100/(4.2*16);
ratio = [5.6/12;4.8/14;4.2/16]; %compiles ratios
sigma = [s12;s14;s16]; %compiles sigmas
xval = 0:.01:1; %potential aspect ratios
p = polyfit(ratio,sigma,2); %polynomial relating aspect ratio to stress
y = polyval(p,xval); %potential vertical stersses
plot(xval,y,ratio,sigma,'o') %plot
legend('Potential Values','Calculated Values')
xlabel('Aspect Ratio') %formatting
ylabel('Sigma (tonnes/m^2)')
title('Vertical Stress as a Function of Aspect Ratio')
fprintf('If a = 5.6 and b = 12, the vertical stress is %f at a depth 10m\n',s12)
fprintf('below the corner of a rectangular footing that is subjected to 100 tons.\n')
fprintf('When (a,b) = (4.8,14) or (4.2,16), the vertical stress is:\n')
fprintf('%f and %f, respectively (with fixed parameters).\n',s14,s16)