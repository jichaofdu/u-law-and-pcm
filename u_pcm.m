%       	均匀量化PCM
%       	参数a为原函数
%       	参数n为量化电平数目，为偶数
%           a_quan是经过均匀量化后的输出函数
function [a_quan]=u_pcm(a,n)
    a_quan = a;
    aMax = max(a);
    aMin = min(a);
    %作均匀量化
    gapLayer = (aMax - aMin) / n;                    % n为量化电平数，二者作除法得到量化间隔d         
    targetValue = double(n);
    for i=1:n
        targetValue(i) = gapLayer * (i-1) - ((n - 1) / 2) * gapLayer; % q为不同阶层的的量化电平 q[i]为第i个高度的量化电平 从最底层算起
    end
    for i=1:n    
        a_quan((targetValue(i) - gapLayer/2 <= a) & (a <= targetValue(i) + gapLayer/2)) = targetValue(i);    %把某个量化电平上下2分之1的量化间隔之间的数值，全都划归到这个量化电平的数值上来 
    end
end
