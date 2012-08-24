function b = casteljau(p, i, j, t)
if j == 0
    b = p(i);
else
    b = casteljau(p, i, j - 1, t) * (1 - t) + casteljau(p, i + 1, j - 1, t) * t;
end
