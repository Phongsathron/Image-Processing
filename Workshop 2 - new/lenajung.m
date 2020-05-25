function [lmax, lmin, lmean, b] = lenajung(f)
% lenajung is ...

lmax = max(f(:));
lmin = min(f(:));
lmean = mean(f(:));

b = imbinarize(f);