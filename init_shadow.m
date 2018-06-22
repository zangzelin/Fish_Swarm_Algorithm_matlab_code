%% 时间变换

for i = 1:21
NET.min(i) = ((NET.FEN(i)-12)*60+NET.MIAO(i));

end

%% 计算影长
for i = 1:21
    a = [0,0];
    b = [NET.X(i),NET.Y(i)];
    NET.yingchang2(i) = juli(a,b);
end

%% 计算影角
for i = 1:21
    b = [NET.X(i),NET.Y(i)];
    NET.yingjiao(i) = acosd((1+NET.yingchang2(i)^2-juli([0,1],b))/(2*NET.yingchang2(i)));
    
end

%% 参数计算
NET.N = 108;%4yue18ri
pi = 3.1415926;
NET.b=2*pi*(NET.N-1)/365/3.14*180;
NET.delta=(0.006918-0.399912*cosd(NET.b)+0.070257*sind(NET.b)-0.006758*cosd(2*NET.b)+0.000907*sind(2*NET.b)-0.002697*cosd(3*NET.b)+0.00148*sind(3*NET.b));
NET.delta =NET.delta/3.14*180;
NET.chiwei = NET.delta;%计算赤纬