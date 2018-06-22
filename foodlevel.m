%编程时用作测试的函数，并没实际作用

point = [70,40]
 for i = 1:21
            
            cha = (point(1)-120)*4;
            shijiao =(min(i)+cha)/60*15;
            h(i) = asind(sind(point(2))*sind(chiwei)+cosd(point(2))*cosd(chiwei)*cosd(shijiao));
            %yingchang(i) = 3/tand(h(i));
            banggao(i) = tand(h(i))*yingchang2(i);
            % f(i) = acosd((sind(h(i))*sind(point(2))-sind(chiwei))/(cosd(h(i))*cosd(point(2))));
            
        end
        
        m = mean(banggao);
        
        for i =1:21
            wucha(i) = abs(m/tand(h(i))-yingchang2(i));
        end
        wuchab= mean(wucha)
