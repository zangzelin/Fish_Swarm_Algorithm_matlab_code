function [ newlocation,wucha] = findindfood( location,maxpation, step,feelbound ,NET, wucha)
% �˹������ʳ�����������˹����λ��location������maxpation������step����֪����feelbound���������NET���͵�ǰ���wucha
% ������ʳ������wucha��λ��newlocation

newlocation = [ 0 0 ];
for i = 1: maxpation
    newlocathion1 = location + rand(1,2)*feelbound*2-feelbound;	%���������λ��
    newfoodlevel = getfoodlevel( newlocathion1,NET );%���Բ�����λ�õ���Ӧ�Ⱥ���
    if newfoodlevel<wucha && newlocathion1(1)>0 ... % �����µ�λ���Ƿ�����Ҫ���������Ҫ�����¼�ĵ�λ�ã�������Ҫ�������²����µ�λ�ã�ֱ�������þ���������Ҫ��
			&& newlocathion1(1)<180 && newlocathion1(2)>0 ...
			&& newlocathion1(2)<180 
        
		newlocation= location+(newlocathion1-location)*step; %�����µ�λ��
        wucha = getfoodlevel( newlocation,NET );%�������
        
        break;
    end
end 

end

