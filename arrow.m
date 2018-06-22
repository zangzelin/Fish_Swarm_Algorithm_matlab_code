function  arrow(P,V,color)
 %二维空间中画箭头
 %输入：P=[x0,y0],V=[a,b]
 %将以P（x0，y0）为起点，以（x0+a，y0+b）为终点画出箭头
 %可以进一步修改为三维空间到箭头,或者是以P为起始点,V为终点的箭头图像
 
 color = 'k'; 																	%设置颜色

 x0 = P(1);y0 = P(2);														%确定初始点
 a = V(1); b = V(2); 														%确定结束点
 l = max(norm(V), eps)/10;											%计算长度
 u = [x0 x0+a]; v = [y0 y0+b]; 										%计算向量
 hchek = ishold;

 plot(u,v,color)																%画出箭头主要部分
 hold on 
 h = l - min(.2*l, .2) ;v = min(.2*l/sqrt(3), .2/sqrt(3) );	%计算箭头的两端的起止
 a1 = (a*h -b*v)/l;
 b1 = (b*h +a*v)/l; 

 plot([x0+a1, x0+a], [y0+b1, y0+b], color) 					%画出箭头的一边

 a2 = (a*h +b*v)/l; 
 b2 = (b*h -a*v)/l; 

 plot([x0+a2, x0+a], [y0+b2, y0+b], color)					%画出箭头的另外一边
 if hchek == 0 
     hold off 
 end