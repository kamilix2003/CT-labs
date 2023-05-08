% MATLAB code for Implementation of
% Fourier Series up to 'n' Harmonics in MATLAB:
clear all
clc      
disp("Implementation of Fourier Seriesup to 'n' Harmonics in MATLAB | GeeksforGeeks")
syms x
 
f=sin(x);
I=[0,1];
k=3;
 
% Lower limit of Integration
a=I(1); 
 
 % Upper limit of Integration
b=I(2);
l=(b-a)/2;
a0=(1/l)*(int(f,a,b));
Fx=a0/2;
 
% Calculating the nth Harmonic
for n=1:k   
%To creates a new figure window
% using default property values
    figure; 
    an(n)=(1/l)*(int(f*cos(n*pi*x/l),a,b));
    bn(n)=(1/l)*(int(f*sin(n*pi*x/l),a,b));
    Fx=Fx+((an(n))*cos(n*pi*x/l))+((bn(n))*sin(n*pi*x/l));
     
    % To evaluate Each element of
     % Fx to at least 4-Significant digits
    Fx=vpa(Fx,4);       
     
    % To plot the curve Fx (Fourier series upto
    % nth Harmonic) in the given interval [a,b]
    ezplot(Fx,[a,b]);  
     
    % To add a second line plot (Given Function/f) without deleting
    % the existing line plot (Fourier series upto nth Harmonic/Fx)
    hold on;             
    ezplot(f,[a,b]);     
     
    % To plot the curve f (Given Function)
    % in the given interval [a,b]
    title(["The Fourier series upto ", num2str(n)," Harmonics is:"]);
     
    % To create a legend with descriptive labels
    % for both of the plotted lines (f & Fx)
    legend("Fourier series","Given Function"); 
    
   % To set the hold state to off
    hold off;            
end
disp(strcat('The Fourier series upto ', num2str(n),' Harmonics is:',char(Fx)))