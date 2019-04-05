function [ Lhatvvv ] = LVVVtilde( pic,shape )

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


%Derivate in Lxxx
mask_dxxx_padded=conv2(mask_dx_padded,mask_dx_padded,'same');
Lxxx=filter2(mask_dxxx_padded,pic,shape);

%Lxxy
mask_dxxy_padded=conv2(mask_dxx_padded,mask_dy_padded,'same');
Lxxy=filter2(mask_dxxy_padded,pic,shape);

%Lxyy
mask_dxyy_padded=conv2(mask_dx_padded,mask_dyy_padded,'same');
Lxyy=filter2(mask_dxyy_padded,pic,shape);

%Lyyy
mask_dyyy_padded=conv2(mask_dy_padded,mask_dyy_padded,'same');
Lyyy=filter2(mask_dyyy_padded,pic,shape);

Lhatvvv=Lx.^3.*Lxxx+3.*Lx.^2.*Ly.*Lxxy+3*Lx.*Ly.^2.*Lxyy+Ly.^3.*Lyyy;


end

