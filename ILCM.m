%  A robust infrared small target detection algorithm based on human visual system
% ��LCM�㷨��ȵĲ�֮ͬ��
% 1 �ֿ��ʡʱ��
% 2 ʹ��ƽ��ֵȡ�����ֵ
function out = ILCM( img)
img=double(img);
[row, col]=size(img);
bs=8;
step=bs/2;
r=mod(row-bs,step);
c=mod(col-bs,step);
padr=0;
if (r ~= 0)
    padr=step-r;
end
padc=0;
if (c ~= 0)
    padc=step-c;
end
imgpad=padarray(img,[padr padc],'replicate','post');
[rr,cc]=size(imgpad);
a=(rr - bs)/step+1;
b=(cc - bs)/step+1;
M=zeros(a,b);
Ln=zeros(a,b);
for i=1:a
    for j=1:b
        block=imgpad(step*(i-1)+1:step*(i-1)+bs,step*(j-1)+1:step*(j-1)+bs);
        Ln(i,j)=max(max(block));%���ֵ
        M(i,j)=mean2(block); %ƽ��ֵ
    end
end
Mi=imdilate(M,[1 1 1;1 0 1;1 1 1]);% 8�����ƽ��ֵ�����ֵ 
out=Ln.*M./Mi;
end


