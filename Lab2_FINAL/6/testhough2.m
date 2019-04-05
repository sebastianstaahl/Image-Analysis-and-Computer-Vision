close all;
clear all;
tic
% few256, phonecalc256 and godthem256.
testimage1 =godthem256;
%testimage1 =phonecalc256;
%testimage2 = binsubsample(testim);
%figure(77);
%showgrey(few256);
N=size(testimage1,2);

%testimage1=zeros(N,N);

ntheta= 181;  %-90 0 90
%from -sqrt(2)D to sqrt(2)D. i.e. the length of the diagonal . 757 gonzales 
nrho=   2*2*(N-1);

%############################################
% VERBOSE = 0 : Only the number of polygons
%           1 : The length of each polygon
%           2 : The coordinates
%#############################################

magnitude=sqrt(Lv(testimage1,4,'same'));
D = sqrt(size(magnitude, 1)^2 + size(magnitude, 2)^2);
nlines=14;
[linepairs acc]=houghedgeline(testimage1, 4, 8, nrho, ntheta, nlines, 2);

ourtcurves=zeros(2,4*nlines);

figure(22);
showgrey(binsepsmoothiter(acc, 0.5, 1));
title('Acc space godthem256')
%figure(3);
%overlaycurves(acc,linepairs);

for i= 1:size(linepairs,2)


x0 = linepairs(1,i)*cos(linepairs(2,i));
y0 = linepairs(1,i)*sin(linepairs(2,i));
dx = D^2*(-sin(linepairs(2,i)));
dy = D^2*(cos(linepairs(2,i)));  


outcurves(1, 4*(i-1) + 1) = 0; % level, not significant
outcurves(2, 4*(i-1) + 1) = 3; % number of points in the curve

outcurves(2, 4*(i-1) + 2) = x0-dx;
outcurves(1, 4*(i-1) + 2) = y0-dy;

outcurves(2, 4*(i-1) + 3) = x0;
outcurves(1, 4*(i-1) + 3) = y0;

outcurves(2, 4*(i-1) + 4) = x0+dx;
outcurves(1, 4*(i-1) + 4) = y0+dy; 


end
%figure(1);

%figure(32);
%showgrey(testimage1);
figure(2);
overlaycurves(magnitude, outcurves);
axis([1 size(magnitude, 2) 1 size(magnitude, 1)]);
title('with increment 1- overlayed hough lines, scale: 4, threshold: 8, 14 lines')


for i= 1:size(linepairs,2)
    a=linepairs(2,i);
    rh=linepairs(1,i);
   disp(i)
   disp(rh)
   disp(a)
   disp(radtodeg(a)) 
end
toc