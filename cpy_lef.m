% Infrared Small Target Detection Based on Multiscale Local Contrast Measure Using Local Energy Factor
% ʵ��Ч��������Ч����ͬ��
clearvars;
close all;
clc;
flag = 1;
wflag = 1;
for kk = 1
    fold = '.\data\';% 27 images
    try
        img = imread([fold, num2str(kk), '.jpg']);
    catch
        img = imread([fold, num2str(kk), '.bmp']);
    end
    img = img(:,:,1);
    re = leffunc(img);
    bw = bwfunc(re);
    if flag
        figure; imshow(uint8(img));
        figure; imshow(re, []);
        figure; imshow(bw);
    end
    if wflag
        refold = '.\';
        if ~exist(refold, 'dir')
            mkdir(refold);
        end
        imwrite(uint8(img), [refold, num2str(kk), '1.png']);
        imwrite(uint8( mat2gray(re) * 255), [refold, num2str(kk), '2.png']);
        imwrite(bw, [refold, num2str(kk), '3.png']);
    end
end
