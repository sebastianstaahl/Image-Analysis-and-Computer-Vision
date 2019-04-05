function prob= mixture_prob( image,K, L, mask )
rows = size(image, 1);

cols= size(image, 2);
nopixels=rows * cols;

re_shape=reshape(image,nopixels, 3);
Ivec = im2double(re_shape);

% Randomly initialize the K components using masked pixels

    % This function uses a mask to identify pixels from an image that are used 
    % to estimate a mixture of K Gaussian components. The mask has the same size 
    % as the image. A pixel that is to be included has a mask value 1 otherwise 0.

mask_reshape=reshape(mask,nopixels,1);

masked_image=Ivec(find(mask_reshape==1),:);


%initialize: for every masked pixel and every center K
sz_masked_im=size(masked_image,1);
p=zeros(sz_masked_im,K);

%initilize K gaussian kernels for every masked pixel
g=zeros(sz_masked_im,K);

wkgk=zeros(sz_masked_im, K);

[segmentation centers] = kmeans_segm(masked_image, K, 10*L, 1421);
%Centers corresponds to the means of our clusters i.e. mu k
%initlize our weights that tells us how much we have of each colour
 w=zeros(K,1);
 

for k = 1:K
    
    w(k) = sum(find(segmentation(:,1) == k));
end
N=sum(w,1);

w=w/N;

%initlize covariance matrices
cov = cell(K,1);

dim=3; %3D gaussian

cov(:) = {rand*(3/100)*eye(dim)};
 

% Iterate L times
for i =1:L    

    % Expectation: Compute probabilities P_ik using masked pixels
for k = 1:K
  % pixel center sigma
  
  diff = bsxfun(@minus,masked_image, centers(k,:));
  g(:,k)=((2*pi)^3*abs(det(cov{k})))^(-0.5)*exp(-0.5*sum(diff*inv(cov{k}).*diff,2));
  wkgk(:,k)=w(k)*g(:,k);
  
end

sum_wkgk= sum(wkgk,2);

for k = 1:K
p(:,k)=wkgk(:,k)./sum_wkgk;
end

% Maximization: Update weights, means and covariances using masked pixels
% 1. update the weights
for k = 1:K
   prob_pixels_k=p(:,k);
   w(k)=sum(prob_pixels_k,1)/sz_masked_im;
   
  sum_p_k=sum(p(:,k),1);
  centers(k,:)=p(:,k)'*masked_image/sum_p_k;   
   
end

for k = 1:K
    
diff=bsxfun(@minus,masked_image,centers(k,:));
%cov{k}=(p(:,k)*diff*diff')/sum(p(:,k),1);
num=diff'*bsxfun(@times,diff,p(:,k));
den=sum(p(:,k),1);
cov{k}=num/den;
end
end

% Compute probabilities p(c_i) in Eq.(3) for all pixels I.
g_fin=zeros(nopixels,K);
  for k = 1:K
    diff = bsxfun(@minus, Ivec, centers(k, :));
    g_fin(:, k) = 1 / sqrt(det(cov{k}) * (2 * pi)^3) * exp(-0.5*sum((diff * inv(cov{k}) .* diff), 2))*w(k);
  
  end

prob = sum(g_fin, 2);
prob = reshape(prob, rows, cols, 1);
end
















