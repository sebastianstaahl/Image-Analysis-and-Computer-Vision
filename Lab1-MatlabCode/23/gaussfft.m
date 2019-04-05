function [convolved_Image,tmp] = gaussfft( pic,t )
[h,w] = size(pic);
[X, Y] = meshgrid(-h*0.5:h*0.5-1, -w*0.5:w*0.5-1);

%sample the continous kernel
gauss_kernel = (1/(2*pi*t))*exp(-(X.^2+Y.^2)/(2*t));

%transform the kernel into fourier domain
Ghat = fft2(gauss_kernel);

%transform image into fourier domain
Ihat = fft2(pic);
%convolution
convolved_Image = fftshift(ifft2(Ihat.*Ghat));


tmp=Ihat.*Ghat;  
end

