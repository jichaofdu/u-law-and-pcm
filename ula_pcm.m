%           非均匀量化：u律
%       	参数a是原函数
%       	n是量化级数	
%		    u为u律中的参数u
%           a_quan是经过非均匀量化后的输出函数
function [a_quan]=ula_pcm(a,n,u)
    aMax = max(a);
    aMin = min(a);
    %第1步：作u律转换(压缩）
    a_quan = ulaw(a,u);   
    %第2步：作均匀量化
    gapLayer = (aMax - aMin) / n;                    % n为量化电平数，分子为最大值与最小值之差，二者作除法得到量化间隔d         
    targetValue = double(n);
    for i=1:n
        targetValue(i) = gapLayer * (i-1) - ((n - 1) / 2) * gapLayer; % q为不同阶层的的量化电平 q[i]为第i个高度的量化电平 从最底层算起
    end
    for i=1:n    
        a_quan((targetValue(i) - gapLayer/2 <= a_quan) & (a_quan <= targetValue(i) + gapLayer/2)) = targetValue(i);    %把某个量化电平上下2分之1的量化间隔之间的数值，全都划归到这个量化电平的数值上来 
    end
    %第3步：作压缩扩展
    a_quan = inv_ulaw(a_quan,u);                      
end
