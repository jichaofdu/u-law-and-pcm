%           �Ǿ���������u��
%       	����a��ԭ����
%       	n����������	
%		    uΪu���еĲ���u
%           a_quan�Ǿ����Ǿ�����������������
function [a_quan]=ula_pcm(a,n,u)
    aMax = max(a);
    aMin = min(a);
    %��1������u��ת��(ѹ����
    a_quan = ulaw(a,u);   
    %��2��������������
    gapLayer = (aMax - aMin) / n;                    % nΪ������ƽ��������Ϊ���ֵ����Сֵ֮������������õ��������d         
    targetValue = double(n);
    for i=1:n
        targetValue(i) = gapLayer * (i-1) - ((n - 1) / 2) * gapLayer; % qΪ��ͬ�ײ�ĵ�������ƽ q[i]Ϊ��i���߶ȵ�������ƽ ����ײ�����
    end
    for i=1:n    
        a_quan((targetValue(i) - gapLayer/2 <= a_quan) & (a_quan <= targetValue(i) + gapLayer/2)) = targetValue(i);    %��ĳ��������ƽ����2��֮1���������֮�����ֵ��ȫ�����鵽���������ƽ����ֵ���� 
    end
    %��3������ѹ����չ
    a_quan = inv_ulaw(a_quan,u);                      
end
