% 2018 High-Boost-Based Multiscale Local Contrast Measure for Infrared Small Target Detection
% 1 ��ʹ�ñ������Ʒ���ǿĿ�꣬���Ʊ���
% 2 ����Ŀ����뱳����ĶԱȶ�
% 3 ��4���߶��У����Աȶ�ֵ����С�Աȶ�ֵ���ƽ����Ϊ�Աȶ�
function re = hbmlcmfunc(img)
img = double(img);
op = fspecial('average', 9); % improved high boost filter �Ĵ�С���Ĳ�û�и���
Im = imfilter(double(img), op, 'replicate');
Ihp = img - Im;
Ihp(Ihp<0) = 0;
ihbf = img.*Ihp;
%%
d3 = subfunc(ihbf, 3); % scae 3
d5 = subfunc(ihbf, 5); % scae 5
d7 = subfunc(ihbf, 7); % scae 7
d9 = subfunc(ihbf, 9); % scae 9
out = cat(3, d3, d5, d7, d9);
dmin = min(abs(out), [], 3);
dmax = max(abs(out), [], 3);
re = (dmax - dmin).^2;
end
function d = subfunc(ihbf, len)
opt = ones(len)/(len*len) ;
opb = ones(15); % the size of the external window is fixed and it is set to 15 �� 15 pixels in experiments
r = floor(len/2);
opb(8-r:8+r, 8-r:8+r) = 0;
opb = opb/sum(opb(:));
mt = imfilter(double(ihbf), opt, 'replicate');
mb =  imfilter(double(ihbf), opb, 'replicate');
d = mt - mb;
end

