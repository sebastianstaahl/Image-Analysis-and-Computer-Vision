close all;
clear;

threshold_10=10;
threshold_15=15;
threshold_20=20;
threshold_40=40;
threshold_50=50;
threshold_90=90;

%the simple difference operator
simplediff_x = [-1 0 1];
simplediff_y = [-1 0 1]';

% central differences order?
centraldiff_x = [-0.5 0 0.5];
centraldiff_y = [-0.5; 0; 0.5];

% central differences 2nd order
centraldiff_2nd_x = [1 -2 1];
centraldiff_2nd_y = [1; -2; 1];

%Robert’s diagonal operator http://homepages.inf.ed.ac.uk/rbf/HIPR2/roberts.htm
roberts_diag_x = [1 0; 0 -1];
roberts_diag_y = [0 1; -1 0];

% sobel operator
sobel_delta_x_kernel = [-1 0 1; -2 0 2; -1 0 1];
sobel_delta_y_kernel = [1 2 1; 0 0 0; -1 -2 -1];

%pic = few256;
pic = few256;
tools= godthem256;  %discgaussfft(pic,2);

%size of original image tools
[tools_x_sz, tools_y_sz] = size(tools);
display('Size in x dir:');
display(tools_x_sz);
display('Size in y dir:');
display(tools_y_sz);


% ssimple diff
figure(1)
simple_dxtools = conv2(tools, simplediff_x, 'same');
simple_dytools = conv2(tools, simplediff_y, 'same');

simple_grandmagtools=sqrt(simple_dxtools .^2 +simple_dytools .^2);

subplot(3,3,1);
showgrey((simple_grandmagtools-5)>0);
title('simple_grandmagtools-5')

subplot(3,3,2);
showgrey((simple_grandmagtools-10)>0);
title('simple_grandmagtools-10')

subplot(3,3,3);
showgrey((simple_grandmagtools-20)>0);
title('simple_grandmagtools-20')

subplot(3,3,4);
showgrey((simple_grandmagtools-40)>0);
title('simple_grandmagtools-40')

subplot(3,3,5);
showgrey((simple_grandmagtools-60)>0);
title('simple_grandmagtools-60')
subplot(3,3,6);
showgrey((simple_grandmagtools-75)>0);

title('simple_grandmagtools-75')
% CDO 1
figure(2)
CDO_dxtools = conv2(tools, centraldiff_x, 'same');
CDO_dytools = conv2(tools, centraldiff_y, 'same');

CDO_grandmagtools=sqrt(CDO_dxtools .^2 +CDO_dytools .^2);
%showgrey((CDO_grandmagtools-threshold)>0);
subplot(3,3,1);
showgrey((CDO_grandmagtools-5)>0);
title('CDO threshold 5')
subplot(3,3,2);
showgrey((CDO_grandmagtools-10)>0);
title('CDO threshold 10')
subplot(3,3,3);
showgrey((CDO_grandmagtools-20)>0);
title('CDO threshold 20')
subplot(3,3,4);
showgrey((CDO_grandmagtools-30)>0);
title('CDO threshold 30')
subplot(3,3,5);
showgrey((CDO_grandmagtools-50)>0);
title('CDO threshold 50')
subplot(3,3,6);
showgrey((CDO_grandmagtools-60)>0);
title('CDO threshold 60')




%CDO 2nd order 
%figure(3)
%CDO2_dxtools = conv2(tools, centraldiff_2nd_x, 'same');
%CDO2_dytools = conv2(tools, centraldiff_2nd_y, 'same');

%CDO2_grandmagtools=sqrt(CDO2_dxtools .^2 +CDO2_dytools .^2);
%showgrey((CDO2_grandmagtools-threshold)>0);

%subplot(3,3,1);
%showgrey((CDO2_grandmagtools-threshold_10)>0);

%subplot(3,3,2);
%showgrey((CDO2_grandmagtools-threshold_15)>0);

%subplot(3,3,3);
%showgrey((CDO2_grandmagtools-threshold_20)>0);

%subplot(3,3,4);
%showgrey((CDO2_grandmagtools-threshold_40)>0);

%subplot(3,3,5);
%showgrey((CDO2_grandmagtools-threshold_50)>0);

%subplot(3,3,6);
%showgrey((CDO2_grandmagtools-threshold_90)>0);


%title('CDO 2');

%Roberts diag 
figure(4)
rob_dxtools = conv2(tools, roberts_diag_x, 'same');
rob_dytools = conv2(tools, roberts_diag_y, 'same');

rob_grandmagtools=sqrt(rob_dxtools .^2 +rob_dytools .^2);
%showgrey((rob_grandmagtools-threshold)>0);


subplot(3,3,1);
showgrey((rob_grandmagtools-5)>0);
title('ROB threshold 5')

subplot(3,3,2);
showgrey((rob_grandmagtools-10)>0);
title('ROB threshold 10')

subplot(3,3,3);
showgrey((rob_grandmagtools-threshold_20)>0);
title('ROB threshold 20')

subplot(3,3,4);
showgrey((rob_grandmagtools-threshold_50)>0);
title('ROB threshold 50')

subplot(3,3,5);
showgrey((rob_grandmagtools-70)>0);
title('ROB threshold 70')
subplot(3,3,6);
showgrey((rob_grandmagtools-100)>0);
title('ROB threshold 100')



%Sobel
figure(5)
sob_dxtools = conv2(tools, sobel_delta_x_kernel, 'same');
sob_dytools = conv2(tools, sobel_delta_y_kernel, 'same');

sob_grandmagtools=sqrt(sob_dxtools .^2 +sob_dytools .^2);
%showgrey((sob_grandmagtools-threshold)>0);

subplot(3,3,1);
showgrey((sob_grandmagtools-threshold_10)>0);
title('SOB threshold 10')

subplot(3,3,2);
showgrey((sob_grandmagtools-30)>0);
title('SOB threshold 30')

subplot(3,3,3);
showgrey((sob_grandmagtools-threshold_90)>0);
title('SOB threshold 90')

subplot(3,3,4);
showgrey((sob_grandmagtools-150)>0);
title('SOB threshold 150')

subplot(3,3,5);
showgrey((sob_grandmagtools-200)>0);
title('SOB threshold 200')

subplot(3,3,6);
showgrey((sob_grandmagtools-250)>0);
title('SOB threshold 250 ')



%Rob v2
figure(6)
rob_pos = [-1 0; 0 1];
rob_neg = [0 -1; 1 0];

rob_pos_dxtools = conv2(tools, rob_pos, 'same');
rob_neg_dytools = conv2(tools, rob_neg, 'same');


rob2_grandmagtools=sqrt(rob_pos_dxtools .^2 +rob_neg_dytools .^2);
%showgrey((rob2_grandmagtools-threshold)>0);

subplot(3,3,1);
showgrey((rob2_grandmagtools-threshold_10)>0);

subplot(3,3,2);
showgrey((rob2_grandmagtools-threshold_15)>0);

subplot(3,3,3);
showgrey((rob2_grandmagtools-threshold_20)>0);

subplot(3,3,4);
showgrey((rob2_grandmagtools-threshold_40)>0);

subplot(3,3,5);
showgrey((rob2_grandmagtools-threshold_50)>0);
subplot(3,3,6);
showgrey((rob2_grandmagtools-threshold_90)>0);

title('ROB v2');
%{

figure(8);
subplot(2,2,1);
histogram(simple_grandmagtools);
title('simple grandmagtools');

subplot(2,2,2);
histogram(sob_grandmagtools);
title('sob grandmagtools');

subplot(2,2,3);
histogram(CDO_grandmagtools);
title('CDO grandmagtools');

subplot(2,2,4);
histogram(rob_grandmagtools);
title('ROB grandmagtools');

%}





