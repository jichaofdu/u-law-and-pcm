%       	��������PCM
%       	����aΪԭ����
%       	����nΪ������ƽ��Ŀ��Ϊż��
%           a_quan�Ǿ���������������������
function [a_quan]=u_pcm(a,n)
    a_quan = a;
    aMax = max(a);
    aMin = min(a);
    %����������
    gapLayer = (aMax - aMin) / n;                    % nΪ������ƽ���������������õ��������d         
    targetValue = double(n);
    for i=1:n
        targetValue(i) = gapLayer * (i-1) - ((n - 1) / 2) * gapLayer; % qΪ��ͬ�ײ�ĵ�������ƽ q[i]Ϊ��i���߶ȵ�������ƽ ����ײ�����
    end
    for i=1:n    
        a_quan((targetValue(i) - gapLayer/2 <= a) & (a <= targetValue(i) + gapLayer/2)) = targetValue(i);    %��ĳ��������ƽ����2��֮1���������֮�����ֵ��ȫ�����鵽���������ƽ����ֵ���� 
    end
end
