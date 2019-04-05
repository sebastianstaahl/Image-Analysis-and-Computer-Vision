function [linepair acc] = houghedgeline(pic, scale, gradmagnthreshold, nrho, ntheta, nlines, verbose)

curves=extractedge(pic,scale,gradmagnthreshold, 'same');
magnitude=sqrt(Lv(discgaussfft(pic, scale),scale,'same'));

[linepair acc]=houghline(curves,magnitude,nrho, ntheta, gradmagnthreshold, nlines, verbose);
disp(size(linepair))
end

