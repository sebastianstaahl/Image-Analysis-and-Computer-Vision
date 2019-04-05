phone = phonecalc128;
few = few128;
nallo = nallo128;

threshold = 10^(-10);

figure(1);

showgrey(phone);


pow1 = pow2image(phone, threshold); 
pow1_rand = randphaseimage(phone);  

pow2 = pow2image(few, threshold);
pow2_rand = randphaseimage(few);

pow3 = pow2image(nallo, threshold);
pow3_rand = randphaseimage(nallo);

subplot(3,3,1)
showgrey(phone);
title('original images');

subplot(3,3,2)
showgrey(pow1);
title('phases preserved');

subplot(3,3,3)
showgrey(pow1_rand);
title('magnitudes preserved');

subplot(3,3,4)
showgrey(few);

subplot(3,3,5)
showgrey(pow2);

subplot(3,3,6)
showgrey(pow2_rand);

subplot(3,3,7)
showgrey(nallo);

subplot(3,3,8)
showgrey(pow3);

subplot(3,3,9)
showgrey(pow3_rand);
