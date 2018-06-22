function [ newlocation,wucha] = findindfood( location,maxpation, step,feelbound ,NET, wucha)
% 人工鱼的觅食函数，输入人工渔的位置location，耐心maxpation，步长step，感知区域feelbound，网络参数NET，和当前误差wucha
% 返回觅食后的误差wucha和位置newlocation

newlocation = [ 0 0 ];
for i = 1: maxpation
    newlocathion1 = location + rand(1,2)*feelbound*2-feelbound;	%产生随机的位置
    newfoodlevel = getfoodlevel( newlocathion1,NET );%测试产生的位置的适应度函数
    if newfoodlevel<wucha && newlocathion1(1)>0 ... % 测试新的位置是否满足要求，如果满足要求则记录心的位置，不满足要求则重新产生新的位置，直到耐心用尽或者满足要求
			&& newlocathion1(1)<180 && newlocathion1(2)>0 ...
			&& newlocathion1(2)<180 
        
		newlocation= location+(newlocathion1-location)*step; %计算新的位置
        wucha = getfoodlevel( newlocation,NET );%计算误差
        
        break;
    end
end 

end

