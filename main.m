% 本代码使用鱼群算法解决二维的搜索问题
% 根据图片中的影子长度的信息对图片拍摄的地点进行确定
% 首先建立数学模型，描述影子与经纬度的关系
% 然后通过搜索算法对拍摄的位置进行确定
% 输入的数据时储存于q2.txt文件中的不同时间的影子的长度，与时间日期数据
% @author: Jon Zang，杭州，15168307480，zangzelin@gmail.com
% date:2016-9-23


clc 
clear all

%% 读入数据
xlsfile = 'q2.txt';                                          %打开文件，输入数据
data =xlsread(xlsfile);
NET = [];
NET.FEN= data(:,1); 
NET.MIAO= data(:,2); 
NET.X= data(:,3); 
NET.Y= data(:,4); 

%% 求解信息的初始化
init_shadow();

%用来验证信息初始化是否成功的代码
% for i = 60:150
%     for j = 3:60
%         point = [i j];
%         foodlevel(i,j) =  getfoodlevel(point , NET);
%     end
% end

%% 鱼群参数设置

%鱼的数量
fish.N = 20;
%鱼的活动范围，搜索区间二维
fish.d1max = 180;
fish.d2max = 180;
fish.d1min = 0 ;
fish.d2min = 0;
%鱼的移动步长
fish.step = 0.8;
fish.maxpation = 15;
fish.feelbound = 10;

%% 主程序

%放置人工鱼
X1=rand(fish.N,1)*(fish.d1max-fish.d1min )+fish.d1min;%横坐标
X2=rand(fish.N,1)*(fish.d2max -fish.d2min)+fish.d2min;%纵坐标
for i = 1:fish.N 
WUCHA(i,1) = getfoodlevel( [X1(i,1)  X2(i,1)],NET ) ;
end
X=[X1 X2  WUCHA ];%初始位置记录

fish.fishlist=X;%当前位置
%觅食
figure();
plot(109 ,19,'*');
hold on
axis([0,180,0,180]);

for i = 1:50
    wuchahe = 0;
    for j = 1:fish.N   
        location = fish.fishlist(j,1:2);%导入人工鱼的位置
        wucha =fish.fishlist(j,3) ;%计算误差
        %更新人工鱼的位置
		[newlocation , wucha1 ]= findindfood( location,fish.maxpation, fish.step ,fish.feelbound ,NET, wucha);
        %在图中描绘此此收敛
		if i > 1
            if newlocation ~= [0 0]
                arrow(location,newlocation-location);
            end
        end
		
        hold on
        if newlocation ~= [0 0]
		%对此次收敛进行记录
        fish.fishlist(j,1:2) = newlocation;
         fish.fishlist(j,3) = wucha1;
        end 
        wuchahe =wucha1+wuchahe;
    end
	%记录误差
    wuchajilu(i) = wuchahe;
end
   
%%
%画图
plot(109 ,19,'*');
hold on
axis([0,180,0,180]);
for j = 1:fish.N   
        location = fish.fishlist(j,1:2);
        wucha =fish.fishlist(j,3) ;
        plot(location(1),location(2),'dr');  hold on
       
end
    

