close all;
clear;
%pic = phonecalc128;
%pic = blocks1;
%pic = kloss128;
%pic = male128;
%pic= few128;
%pic= nallo128;
pic = male128;

figure(1);
psf1 = gaussfft(pic, 1.0);
psf_correct = discgaussfft(pic, 1.0);
%v1=variance(psf1);
%v1_correct = variance(psf_correct);
%disp(v1);
%disp(v1_correct);
showgrey(psf1);
title('variance= 1.0'); 

figure(2);
psf2 = gaussfft(pic, 4.0);
v4=variance(psf2);
showgrey(psf2);
title('variance= 4.0'); 

figure(3);
psf3 = gaussfft(pic, 16.0);
v16=variance(psf3);
showgrey(psf3);
title('variance= 16.0'); 

figure(4);
psf4 = gaussfft(pic, 64.0);
v64=variance(psf4);
showgrey(psf4);
title('variance= 64.0');

figure(5);
psf5 = gaussfft(pic, 256.0);
v256=variance(psf5);
showgrey(psf5);
title('variance= 256.0');