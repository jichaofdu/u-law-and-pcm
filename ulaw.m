%	 u��ѹ������
%	 ����yΪ���뺯��
%    ����uΪѹ������u��ֵ
%    u�ɵĹ�ʽΪ��   ��log(1 + u * |x|) / log(1 + u���� * sgn��x)
function [z] = ulaw(y,u)
    z = (log(1 + u * abs(y)) / log(1 + u)) .* sign(y);
end