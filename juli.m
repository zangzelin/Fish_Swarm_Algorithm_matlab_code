function [ output_args ] = juli( a,b )
% 用于计算两点间的距离，输入为a,b,两个二维的点
% 输出为亮点的位置差

juli = sqrt((a(1)-b(1))^2+(a(2)-b(2))^2);

output_args = juli;


end

