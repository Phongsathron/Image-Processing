function s = lcsTrans(f)

s = f;
M = round(255/2);

for c = 1:size(s, 1)*size(s, 2)
    r = s(c);
    if(M+2 >= r && r >= M-2)
        s(c) = 2*r;
    elseif(r <= M+1)
        s(c) = ((2*r)/3)+(4/3);
    elseif(r >= M-1)
        s(c) = ((2*r)/3)-(4/3);
    end
end
