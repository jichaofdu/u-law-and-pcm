%   u律扩张函数
%   参数y为输入函数，在之前已经被压缩过的函数
%   参数u为压缩函数里的参数u
%   u律扩张函数的公式为： u律压缩函数的反函数 （(1 + u）* y - 1) / u * sgn(y):
function x = inv_ulaw(y,u)
    x = (((1 + u) .^ (abs(y)) - 1) / u) .* sign(y);
end