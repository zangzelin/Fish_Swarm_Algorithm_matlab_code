function [ wuchab ] = getfoodlevel( point,NET )
%��ȡ��ǰλ�õ���Ӧ�Ⱥ���
% ������������͵�ǰ���λ�ã�������Ӧ�Ⱥ���
	for i = 1:21
		%����ò�����ÿ�������Ӧ�ȣ�����banggao����
		cha = (point(1)-120)*4;
		shijiao =(NET.min(i)+cha)/60*15;
		h(i) = asind(sind(point(2))*sind(NET.chiwei)+cosd(point(2))*cosd(NET.chiwei)*cosd(shijiao));
		%yingchang(i) = 3/tand(h(i));
		banggao(i) = tand(h(i))*NET.yingchang2(i);
		% f(i) = acosd((sind(h(i))*sind(point(2))-sind(chiwei))/(cosd(h(i))*cosd(point(2))));
		
	end
	m = mean(banggao);%��ȡ��Ӧ�ȵ�ƽ��ֵ
	
	for i =1:21
		wucha(i) = abs(m/tand(h(i))-NET.yingchang2(i));%�����ܵ����ҷ���
	end
	
	wuchab= mean(wucha);

end

