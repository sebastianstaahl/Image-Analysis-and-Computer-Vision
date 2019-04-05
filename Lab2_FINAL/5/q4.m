clear all;
close all;
%house=godthem256;
house=few256;
scales=[0.0001,1,4,16,64];
figure(1);

for n= drange(1:5)
    subplot(2,3,n);
    f=LVVtilde(discgaussfft(house,scales(n)),'same');
    Lvvtilde=contour(LVVtilde(discgaussfft(house,scales(n)),'same'),[0,0]);
    axis('image');
    axis('ij');
    title(sprintf('GEO scale %f',scales(n)));
   
end
tools=few256;
figure(2);
for n= drange(1:5)
    subplot(2,3,n);
    showgrey(LVVVtilde(discgaussfft(tools, scales(n)), 'same')<0);

    title(sprintf('GEO showgrey scale %f',scales(n)));
   
end
showgrey(tools);

figure(3);
for n= drange(1:5)
    subplot(2,3,n);
   
    showgrey(LVVVtilde(discgaussfft(house, scales(n)), 'same')<0);

    title(sprintf('GEO showgrey scale %f',scales(n)));
   
end

figure(4);
for n= drange(1:5)
    subplot(2,3,n);
    f=LVVtilde(discgaussfft(house,scales(n)),'same');
    Lvvtilde=contour(LVVtilde(discgaussfft(tools,scales(n)),'same'),[0,0]);
    axis('image');
    axis('ij');
    title(sprintf('GEO scale %f',scales(n)));
   
end
subplot(2,3,6);
showgrey(tools);