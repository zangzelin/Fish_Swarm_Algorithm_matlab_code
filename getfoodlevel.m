function [ wuchab ] = getfoodlevel( point,NET )
%获取当前位置的适应度函数
% 输入网络参数和当前点的位置，返回适应度函数
	for i = 1:21
		%计算该参数在每个点的适应度，存入banggao矩阵
		cha = (point(1)-120)*4;
		shijiao =(NET.min(i)+cha)/60*15;
		h(i) = asind(sind(point(2))*sind(NET.chiwei)+cosd(point(2))*cosd(NET.chiwei)*cosd(shijiao));
		%yingchang(i) = 3/tand(h(i));
		banggao(i) = tand(h(i))*NET.yingchang2(i);
		% f(i) = acosd((sind(h(i))*sind(point(2))-sind(chiwei))/(cosd(h(i))*cosd(point(2))));
		
	end
	m = mean(banggao);%求取适应度的平均值
	
	for i =1:21
		wucha(i) = abs(m/tand(h(i))-NET.yingchang2(i));%计算总的误差并且返回
	end
	
	wuchab= mean(wucha);

end

