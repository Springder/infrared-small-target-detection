% 2019 A Local Contrast Method for Infrared Small-Target Detection Utilizing a Tri-Layer Window
%% RLCM  ̫��ʱ
% 1�����ڵĳߴ�̶�ֵ-9x9
% 2��ʹ��9x9���ڵ�ǰK�����ֵ��ƽ��ֵ�����Ƶ�����
%      9x9�Ĵ��������ĻҶ�ֵ�ĸ���K -ȡ���ֵ����߶ȣ�
% 3: ����
%%  tllcm ̫��ʱ
% 1 2 3
% 4    5
% 7 8 9
% ��3x3���Ĵ��ڽ��и�˹�˲�������ƥ���˲���˼�룬��Ŀ���������ǿ������������ƽ��
% 1: ���ڵĳߴ�- 3x3 5x5 7x7 9x9 (��߶�)
% 2: ʹ��ÿ�����ǰ9�����ֵ��ƽ��ֵ 
% 3: ����
function re = tllcm(img)
img = double(img);
gs  = [1/16, 1/8, 1/16;
    1/8, 1/4, 1/8;
    1/16, 1/8, 1/16];
gsimg = imfilter(img, gs, 'replicate');
out3 = subfunc(img, gsimg, 3); % scale is 3
out5 = subfunc(img, gsimg, 5); % scale is 5
out7 = subfunc(img, gsimg, 7); % scale is 7
out9 = subfunc(img, gsimg, 9); % scale is 9
out = cat(3, out3, out5, out7, out9);
re = max(out, [], 3);
re(re<0) = 0;
if 0
    figure; imshow(out3, []);  title('scale 3x3');
    figure; imshow(out5, []);   title('scale 5x5');
    figure; imshow(out7, []);   title('scale 7x7');
    figure; imshow(out9, []);   title('scale 9x9');
    figure; imshow(re, []); title('re');
    figure; surf(out3); title('scale 3x3');
    figure; surf(out5); title('scale 5x5');
    figure; surf(out7); title('scale 7x7');
    figure; surf(out9); title('scale 9x9');
    figure; surf(re);  title('re');
end
end
function re = subfunc(img, gsimg, len)
[row, col] =size(img);
num = len*len;
K = 9;
tt1 = zeros(row, col, K);
tt2 = zeros(row, col, K);
tt3 = zeros(row, col, K);
tt4 = zeros(row, col, K);
tt5 = zeros(row, col, K);
tt6 = zeros(row, col, K);
tt7 = zeros(row, col, K);
tt8 = zeros(row, col, K);
op1 = zeros(len*3); op1(1:len, 1:len) = 1;
op2 = zeros(len*3); op2(1:len, len+1:2*len) = 1;
op3 = zeros(len*3); op3(1:len, 2*len+1:3*len) = 1;
op4 = zeros(len*3); op4(len+1:2*len, 1:len) = 1;
op5 = zeros(len*3); op5(len+1:2*len, 2*len+1:3*len) = 1;
op6 = zeros(len*3); op6(2*len+1:3*len, 1:len) = 1;
op7 = zeros(len*3); op7(2*len+1:3*len, len+1:2*len) = 1;
op8 = zeros(len*3); op8(2*len+1:3*len, 2*len+1:3*len) = 1;
for ii = 1:K
    tt1(:, :, ii) = ordfilt2(img, num - ii + 1, op1); 
    tt2(:, :, ii) = ordfilt2(img, num - ii + 1, op2); 
    tt3(:, :, ii) = ordfilt2(img, num - ii + 1, op3); 
    tt4(:, :, ii) = ordfilt2(img, num - ii + 1, op4); 
    tt5(:, :, ii) = ordfilt2(img, num - ii + 1, op5); 
    tt6(:, :, ii) = ordfilt2(img, num - ii + 1, op6); 
    tt7(:, :, ii) = ordfilt2(img, num - ii + 1, op7); 
    tt8(:, :, ii) = ordfilt2(img, num - ii + 1, op8); 
end
m1 = mean(tt1, 3);
m2 = mean(tt2, 3);
m3 = mean(tt3, 3);
m4 = mean(tt4, 3);
m5 = mean(tt5, 3);
m6 = mean(tt6, 3);
m7 = mean(tt7, 3);
m8 = mean(tt8, 3);
bm = cat(3, m1, m2, m3, m4, m5, m6, m7, m8);
bm = max(bm, [], 3);
re = (gsimg./bm-1).*gsimg; % ������rlcm�����ܻ���ָ���
end