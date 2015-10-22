%	 u律压缩函数
%	 参数y为输入函数
%    参数u为压缩函数u的值
%    u律的公式为：   （log(1 + u * |x|) / log(1 + u）） * sgn（x)
function [z] = ulaw(y,u)
    z = (log(1 + u * abs(y)) / log(1 + u)) .* sign(y);
end