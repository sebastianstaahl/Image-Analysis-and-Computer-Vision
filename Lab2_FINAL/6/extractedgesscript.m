close all;
clear all;

house=godthem256;
[curves_zerocross,curves_mag] =extractedge(house,4,20,'same');
figure(1);
subplot(1,2,1);
overlaycurves(house,curves_mag)
title('without magnitude threshold, scale:4, threshold:20')
subplot(1,2,2);
overlaycurves(house,curves_zerocross)
title('without magnitude threshold, scale:4, threshold:20')

tools=few256;
% variances 0.0001, 1.0, 4.0, 16.0 and 64.0.
[curves_zerocrosst,curves_magt] =extractedge(tools,4,24,'same');
figure(2);
subplot(1,2,1);
overlaycurves(tools,curves_magt)
title('without magnitude threshold, scale:4, threshold:24')
subplot(1,2,2);
overlaycurves(tools,curves_zerocrosst)
title('without magnitude threshold, scale:4, threshold:24')
