%Subsampling & smoothing
img = phonecalc256;
gaussian_smoothing = img;
low_pass_filter_smoothing = img;
N = 5;

for i = 1 : N
    
    if i > 1  % generate subsampled versions
        gaussian_smoothing = gaussfft(gaussian_smoothing, 0.5);
        low_pass_filter_smoothing = ideal(low_pass_filter_smoothing, 0.5);
        img = rawsubsample(img);
        gaussian_smoothing = rawsubsample(gaussian_smoothing);
        low_pass_filter_smoothing = rawsubsample(low_pass_filter_smoothing);         
    end
    
    %Plot subsampling
    figure(2);
    subplot(3, N, i)
    showgrey(img);
    title('Sub sample');
    %Plot Gaussian smoothing & subsampling
    subplot(3, N, i+N)
    showgrey(gaussian_smoothing);
    title('Gaussian smoothing and subs.');
    %Plot ideal low pass filter smoothing & subsampling
    subplot(3, N, i+2*N)
    showgrey(low_pass_filter_smoothing);
    title('Ideal smoothing and subs.');

end
