function angle=dom_orientation(img)
%dom_orientationdominant orientation estimation in a normalized patch. 
[height, width] = size(img);
hist_bins = 120;
[dx, dy] = gaussderiv(img, 1);
orient = atan2(dy, dx);orient = orient(:);
mag = sqrt(dx.^2 + dy.^2);
Gy = gauss(-height/2:height/2-1, height/3);
G = Gy' * gauss(-width/2:width/2-1, width/3);

mags_w = mag .* G;
mags_w = mags_w(:);

hist = zeros(hist_bins, 1);
orients = (hist_bins*(orient+pi)/(2*pi)) + 1;

nans = (isnan(orients));
orients(nans) = []; mags_w(nans) = [];

for i = 1:size(orients)
    ind = floor(orients(i));
    fract = orients(i) - ind;
    if ind > hist_bins
        continue
    end
    
    hist(ind) = hist(ind) + (1-fract) * mags_w(i);
    if ind + 1 > hist_bins
        hist(1) = hist(1) + (fract) * mags_w(i);
    else
        hist(ind + 1) = hist(ind + 1) + (fract) * mags_w(i);
    end
end
hist_smooth = conv(hist', gauss(-3:3, 1), 'same');
[x, angle]=max(hist_smooth);
angle=(((angle-1)/hist_bins)*2*pi)-pi;
end

