clear;
close all;


office = office256;


add = gaussnoise(office, 16);
sap = sapnoise(office, 0.1, 255);

figure(1);
subplot(2,2,1);
showgrey(add);
title('gaussnoise');


subplot(2,2,2);
showgrey(sap);
title('sapnoise');


%%
%Gaussian smoothing
psf_gauss = gaussfft(add, 1);

psf_sap = gaussfft(sap, 1);


figure(2);
gauss_t_list = [0.1,0.5,1,2,5,10,20,50];
for i = 1:length(gauss_t_list)
    if mod(i,2) == 0
        subplot(4,2,i);
        showgrey(gaussfft(add, gauss_t_list(i)));
        title('Gaussian smoothing on Gauss noise with t=X');
    elseif mod(i,2) == 1
        subplot(4,2,i);
        showgrey(gaussfft(sap, gauss_t_list(i)));
        title('Gaussian smoothing on Sap noise with t=X');
    end    
end

%subplot(1,2,1);
%showgrey(psf_gauss);
%title('Gaussian smoothing on gauss noise with t=1');

%subplot(1,2,2);
%showgrey(psf_sap);
%title('Gaussian smoothing on sap noise with t=1');

%%
%Median filtering
height_gauss = size(add, 1);
height_sap = size(sap, 1);

figure(3);

subplot(2,2,1);
showgrey(medfilt(add, 4));
title('Medfilt on gaussian noise, wheight=wwitdh=4');

subplot(2,2,2);
showgrey(medfilt(sap, 4));
title('Medfilt on sap noise, wheight=wwitdh=4');

subplot(2,2,3);
showgrey(medfilt(add, 8));
title('Medfilt on gaussian noise, wheight=wwitdh=8');

subplot(2,2,4);
showgrey(medfilt(sap, 8));
title('Medfilt on sap noise, wheight=wwitdh=8');


%%
%Ideal
filtim_gauss_001 = ideal(add, 0.5);
filtim_sap_001 = ideal(sap, 0.5);

filtim_gauss_01 = ideal(add, 0.2);
filtim_sap_01 = ideal(sap, 0.2);

filtim_gauss_03 = ideal(add, 0.1);
filtim_sap_03 = ideal(sap, 0.1);

figure(4);
subplot(3,2,1);
showgrey(filtim_gauss_001);
title('Gaussian noise, cut-off=0.5');

subplot(3,2,2);
showgrey(filtim_sap_001);
title('Sap noise, cut-off=0.5');

subplot(3,2,3);
showgrey(filtim_gauss_01);
title('Gaussian noise, cut-off=0.2');

subplot(3,2,4);
showgrey(filtim_sap_01);
title('Sap noise, cut-off=0.2');

subplot(3,2,5);
showgrey(filtim_gauss_03);
title('Gaussian noise, cut-off=0.1');

subplot(3,2,6);
showgrey(filtim_sap_03);
title('Sap noise, cut-off=0.1');