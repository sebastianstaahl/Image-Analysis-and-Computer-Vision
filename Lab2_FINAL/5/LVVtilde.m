function [ Lhatvv ] = LVVtilde( pic,shape )

delta_1storder_kernel_x =[-0.5 0 0.5];
delta_1storder_kernel_y=delta_1storder_kernel_x';

%Padding so that all kernel get the same shape
mask_dx_padded=zeros(5,5);
mask_dy_padded=zeros(5,5);

mask_dx_padded(3,2:4)=delta_1storder_kernel_x;
mask_dy_padded(2:4,3)=delta_1storder_kernel_y;

%first order derivatives in x and y dir
Lx=filter2(mask_dx_padded,pic,shape);
Ly=filter2(mask_dy_padded,pic,shape);


delta_2order_kernel_x =[1 -2 1];
delta_2order_kernel_y=delta_2order_kernel_x';


%Padding so that all kernel get the same shape
mask_dxx_padded=zeros(5,5);
mask_dyy_padded=zeros(5,5);

mask_dxx_padded(3,2:4)=delta_2order_kernel_x;
mask_dyy_padded(2:4,3)=delta_2order_kernel_y;

Lxx=filter2(mask_dxx_padded,pic,shape);
Lyy=filter2(mask_dyy_padded,pic,shape);

%Derivate in x and y dir

maskdxdy= conv2(mask_dx_padded,mask_dy_padded,'same'); % convolve the filters
Lxy=filter2(maskdxdy,pic,shape); % convolution on image with the deltaxy filter


Lhatvv=Lx.^2.*Lxx+2.*Lx.*Ly.*Lxy+Ly.^2.*Lyy;

end

