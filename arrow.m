function  arrow(P,V,color)
 %��ά�ռ��л���ͷ
 %���룺P=[x0,y0],V=[a,b]
 %����P��x0��y0��Ϊ��㣬�ԣ�x0+a��y0+b��Ϊ�յ㻭����ͷ
 %���Խ�һ���޸�Ϊ��ά�ռ䵽��ͷ,��������PΪ��ʼ��,VΪ�յ�ļ�ͷͼ��
 
 color = 'k'; 																	%������ɫ

 x0 = P(1);y0 = P(2);														%ȷ����ʼ��
 a = V(1); b = V(2); 														%ȷ��������
 l = max(norm(V), eps)/10;											%���㳤��
 u = [x0 x0+a]; v = [y0 y0+b]; 										%��������
 hchek = ishold;

 plot(u,v,color)																%������ͷ��Ҫ����
 hold on 
 h = l - min(.2*l, .2) ;v = min(.2*l/sqrt(3), .2/sqrt(3) );	%�����ͷ�����˵���ֹ
 a1 = (a*h -b*v)/l;
 b1 = (b*h +a*v)/l; 

 plot([x0+a1, x0+a], [y0+b1, y0+b], color) 					%������ͷ��һ��

 a2 = (a*h +b*v)/l; 
 b2 = (b*h -a*v)/l; 

 plot([x0+a2, x0+a], [y0+b2, y0+b], color)					%������ͷ������һ��
 if hchek == 0 
     hold off 
 end