function [ segmentation,centers ] = kmeans_segm( image,K,L,seed )


image_float = im2double(image);
image_w= size(image, 1);
image_h= size(image, 2);


nopixels=image_w*image_h;
Ivec = reshape(image_float, nopixels, 3);
%figure(1);
%histogram(Ivec)
%disp(Ivec)



cluster_centers = zeros(K, 3);
%disp(size(Ivec));

rng(seed);
%colours = rand(K, 3);
%Dark
%colours_first=[255 50 0; 255 255 255];
%Light
%colours_first=[255 240 0; 255 255 255];

%colours_first=[255 150 0; 255 255 255];

%indx = round(rand(K,1)*size(image,1));
center_coords = randsample(nopixels, K);
%center_coords= round(rand(K,1)*size(image,1));
for k = 1 : K
   cluster_centers(k, :) = Ivec(center_coords(k), :);
end
%disp(cluster_centers)
%cluster_centers(K-1, :)=colours_first(1);
%cluster_centers(K-2, :)=colours_first(2);


D = pdist2(cluster_centers, Ivec, 'euclidean');
%disp(size(D))
% Iterate L times
for l = 1 : L
[Y,I] = min(D,[],1);
%disp(I)
for k=1:K
pixels_closest_center_K = find(I == k); 
cluster_centers(k,:)=mean(Ivec(pixels_closest_center_K , :));
end
D = pdist2(cluster_centers, Ivec, 'euclidean');
%disp('hej!')
end

[Y,I] = min(D,[],1);

segmentation = reshape(I, image_w, image_h);

centers = cluster_centers;

end

