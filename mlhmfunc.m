% 2018 An infrared small target detection method based on multiscale local homogeneity measure
%% hwlcmfunc.m ���� rlcm: Infrared Small Target Detection Utilizing the Multiscale Relative Local Contrast Measure
% �̶���СĿ����ǰK���ֵ   Ŀ���Ĵ�С�ǹ̶���Ŀ�������ֵ����K�Ƕ�߶ȣ�K�����Ƕ�߶ȣ�
 % C./((IBimax - IBimin).*sigma + alfa);
% 1: sigma��Ŀ���ı�׼��
% 2: C��Ŀ����뱳����ĶԱȶ�
% 3: (IBimax - IBimin)��8�����������ǰK���ֵ�ľ�ֵ�����ֵ - 8�����������ǰK���ֵ�ľ�ֵ����Сֵ
%% mlhmfunc.m
% Ŀ���ĳߴ��Ƕ�߶�
%  C./(sigma + alfa); Ŀ���Ĵ�С�Ƕ�߶�
% 1: sigma��Ŀ���ı�׼��
% 2: C��Ŀ����뱳����ĶԱȶ�
% 1 2 3
% 8   4
% 7 6 5
function re = mlhmfunc(img)
img = double(img);
W3 = subfunc(img, 3);
W5 = subfunc(img, 5);
W7 = subfunc(img, 7);
W9 = subfunc(img, 9);
tt = cat(3, W3, W5, W7, W9);
re = max(tt, [], 3);
end
function W = subfunc(img, r)
[row, col] = size(img);
%% 1: ����Ŀ���ı�׼��
sigma = stdfilt(img, ones(r));
%% 2: ����Ŀ����뱳����ĶԱȶ�
opt=ones(r); 
opt = opt / sum(opt(:));
mt=imfilter(img, opt, 'replicate');
op1=zeros(r*3);
op2=zeros(r*3);
op3=zeros(r*3);
op4=zeros(r*3);
op5=zeros(r*3);
op6=zeros(r*3);
op7=zeros(r*3);
op8=zeros(r*3);
op1(1:r,1:r)=1; op1 = op1/sum(op1(:));
op2(1:r,r+1:2*r)=1; op2 = op2/sum(op2(:));
op3(1:r,2*r+1:3*r)=1; op3 = op3/sum(op3(:));
op4(r+1:2*r, 2*r+1:3*r)=1;   op4 = op4/sum(op4(:));
op5(2*r+1:3*r, 2*r+1:3*r)=1;   op5 = op5/sum(op5(:));
op6(2*r+1:3*r, r+1:2*r)=1;   op6= op6/sum(op6(:));
op7(2*r+1:3*r, 1:r)=1;   op7 = op7/sum(op7(:));
op8(r+1:2*r, 1:r)=1;   op8 = op8/sum(op8(:));
mb=zeros(row,col,8);
mb(:,:,1)=imfilter(img,op1, 'replicate');
mb(:,:,2)=imfilter(img,op2, 'replicate');
mb(:,:,3)=imfilter(img,op3, 'replicate');
mb(:,:,4)=imfilter(img,op4, 'replicate');
mb(:,:,5)=imfilter(img,op5, 'replicate');
mb(:,:,6)=imfilter(img,op6, 'replicate');
mb(:,:,7)=imfilter(img,op7, 'replicate');
mb(:,:,8)=imfilter(img,op8, 'replicate');
F1=mt-mb(:,:,1);
F2=mt-mb(:,:,2);
F3=mt-mb(:,:,3);
F4=mt-mb(:,:,4);
F5=mt-mb(:,:,5);
F6=mt-mb(:,:,6);
F7=mt-mb(:,:,7);
F8=mt-mb(:,:,8);
if 1
    %% If the target is brighter than the background
    d1 = F1.*F5; d1(~(F1>0&F5>0) ) = 0;
    d2 = F2.*F6; d2(~(F2>0&F6>0) ) = 0;
    d3 = F3.*F7; d3(~(F3>0&F7>0) ) = 0;
    d4 = F4.*F8; d4(~(F4>0&F8>0) ) = 0;
else
    %% if the target is a dark target
    d1 = F1.*F5; d1(~(F1<0&F5<0) ) = 0;
    d2 = F2.*F6; d2(~(F2<0&F6<0) ) = 0;
    d3 = F3.*F7; d3(~(F3<0&F7<0) ) = 0;
    d4 = F4.*F8; d4(~(F4<0&F8<0) ) = 0;
end
tt = cat(3, d1, d2, d3, d4);
C=min(tt,[],3);
%% 
alfa = 0.01; % alfa is a prior parameter to avoid infinity and alfa is chosen as 0.01
W = C./(sigma + alfa);
if 0
    figure; imshow(C, []);
    figure; imshow(sigma, []);
    figure; imshow(W, []);
end
end