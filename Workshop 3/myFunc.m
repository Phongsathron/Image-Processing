function myFunc()

f = [
    1 1 1 1 1 1 1 1;
    1 1 1 1 1 1 1 1;
    1 1 1 1 1 1 0 0;
    1 1 1 1 1 0 0 0;
    1 1 1 1 0 0 0 0;
    1 1 1 0 0 0 0 0;
    1 1 0 0 0 0 0 0;
    1 0 0 0 0 0 0 0;
];

w = [
    -1 -1 -1;
    -1 8 -1;
    -1 -1 -1;
];

an = conv2(f, w, 'valid');
pad_an = padarray(f, [3 3], 'replicate');

an
pad_an
