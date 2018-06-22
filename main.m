% ������ʹ����Ⱥ�㷨�����ά����������
% ����ͼƬ�е�Ӱ�ӳ��ȵ���Ϣ��ͼƬ����ĵص����ȷ��
% ���Ƚ�����ѧģ�ͣ�����Ӱ���뾭γ�ȵĹ�ϵ
% Ȼ��ͨ�������㷨�������λ�ý���ȷ��
% ���������ʱ������q2.txt�ļ��еĲ�ͬʱ���Ӱ�ӵĳ��ȣ���ʱ����������
% @author: Jon Zang�����ݣ�15168307480��zangzelin@gmail.com
% date:2016-9-23


clc 
clear all

%% ��������
xlsfile = 'q2.txt';                                          %���ļ�����������
data =xlsread(xlsfile);
NET = [];
NET.FEN= data(:,1); 
NET.MIAO= data(:,2); 
NET.X= data(:,3); 
NET.Y= data(:,4); 

%% �����Ϣ�ĳ�ʼ��
init_shadow();

%������֤��Ϣ��ʼ���Ƿ�ɹ��Ĵ���
% for i = 60:150
%     for j = 3:60
%         point = [i j];
%         foodlevel(i,j) =  getfoodlevel(point , NET);
%     end
% end

%% ��Ⱥ��������

%�������
fish.N = 20;
%��Ļ��Χ�����������ά
fish.d1max = 180;
fish.d2max = 180;
fish.d1min = 0 ;
fish.d2min = 0;
%����ƶ�����
fish.step = 0.8;
fish.maxpation = 15;
fish.feelbound = 10;

%% ������

%�����˹���
X1=rand(fish.N,1)*(fish.d1max-fish.d1min )+fish.d1min;%������
X2=rand(fish.N,1)*(fish.d2max -fish.d2min)+fish.d2min;%������
for i = 1:fish.N 
WUCHA(i,1) = getfoodlevel( [X1(i,1)  X2(i,1)],NET ) ;
end
X=[X1 X2  WUCHA ];%��ʼλ�ü�¼

fish.fishlist=X;%��ǰλ��
%��ʳ
figure();
plot(109 ,19,'*');
hold on
axis([0,180,0,180]);

for i = 1:50
    wuchahe = 0;
    for j = 1:fish.N   
        location = fish.fishlist(j,1:2);%�����˹����λ��
        wucha =fish.fishlist(j,3) ;%�������
        %�����˹����λ��
		[newlocation , wucha1 ]= findindfood( location,fish.maxpation, fish.step ,fish.feelbound ,NET, wucha);
        %��ͼ�����˴�����
		if i > 1
            if newlocation ~= [0 0]
                arrow(location,newlocation-location);
            end
        end
		
        hold on
        if newlocation ~= [0 0]
		%�Դ˴��������м�¼
        fish.fishlist(j,1:2) = newlocation;
         fish.fishlist(j,3) = wucha1;
        end 
        wuchahe =wucha1+wuchahe;
    end
	%��¼���
    wuchajilu(i) = wuchahe;
end
   
%%
%��ͼ
plot(109 ,19,'*');
hold on
axis([0,180,0,180]);
for j = 1:fish.N   
        location = fish.fishlist(j,1:2);
        wucha =fish.fishlist(j,3) ;
        plot(location(1),location(2),'dr');  hold on
       
end
    

