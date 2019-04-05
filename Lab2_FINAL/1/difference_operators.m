close all;
clear;


%the simple difference operator
simplediff_x = [-1 0 1];
simplediff_y = [-1 0 1]';

% central difference operator
centraldiff_x = [-0.5 0 0.5];
centraldiff_y = [-0.5; 0; 0.5];

%Robert’s diagonal operator http://homepages.inf.ed.ac.uk/rbf/HIPR2/roberts.htm
roberts_diag_x = [1 0; 0 -1];
roberts_diag_y = [0 1; -1 0];

% sobel operator
sobel_delta_x_kernel = [-1 0 1; -2 0 2; -1 0 1];
sobel_delta_y_kernel = [1 2 1; 0 0 0; -1 -2 -1];

tools = few256;

%size of original image tools
[tools_x_sz, tools_y_sz] = size(tools);
display('Size in x dir:');
display(tools_x_sz);
display('Size in y dir:');
display(tools_y_sz);


% ssimple diff
figure(1)
simple_dxtools = conv2(tools, simplediff_x, 'valid');
simple_dytools = conv2(tools, simplediff_y, 'valid');
subplot(1,2,1)
showgrey(simple_dxtools);
title('SDO: x dir');
subplot(1,2,2)
showgrey(simple_dytools);
title('SDO: y dir');

[simple_dxtools_x_sz,simple_dxtools_y_sz]=size(simple_dxtools);



% CDO 1
figure(2)
CDO_dxtools = conv2(tools, centraldiff_x, 'valid');
CDO_dytools = conv2(tools, centraldiff_y, 'valid');
subplot(1,2,1)
showgrey(CDO_dxtools);
title('CDO: x dir');
subplot(1,2,2)
showgrey(CDO_dytools);
title('CDO: y dir');

[CDO_dxtools_x_sz,CDO_dxtools_y_sz]=size(CDO_dxtools);


%Roberts diag 
figure(4)
rob_dxtools = conv2(tools, roberts_diag_x, 'valid');
rob_dytools = conv2(tools, roberts_diag_y, 'valid');
subplot(1,2,1)
showgrey(rob_dxtools);
title('ROB: x dir');
subplot(1,2,2)
showgrey(rob_dytools);
title('ROB: y dir');
[rob_dxtools_x_sz,rob_dxtools_y_sz]=size(rob_dxtools);

%Sobel
figure(5)
sob_dxtools = conv2(tools, sobel_delta_x_kernel, 'valid');
sob_dytools = conv2(tools, sobel_delta_y_kernel, 'valid');
subplot(1,2,1)
showgrey(sob_dxtools);
title('SOB: x dir');
subplot(1,2,2)
showgrey(sob_dytools);
title('SOB: y dir');

[SOB_dxtools_x_sz, SOB_dxtools_y_sz]=size(sob_dxtools);




%Rob v2
figure(6)
rob_pos = [-1 0; 0 1];
rob_neg = [0 -1; 1 0];


rob2_dxtools = conv2(tools, rob_pos, 'valid');
rob2_dytools = conv2(tools, rob_neg, 'valid');
subplot(1,2,1)
showgrey(rob2_dxtools);
title('ROB2: x dir');
subplot(1,2,2)
showgrey(rob2_dytools);
title('ROB2: y dir');

%figure(7);
%showgrey([1,1,3;-10,-20,-4]);

figure(8);
showgrey(tools);