% 2013 a local contrast method for small infrared target detection
function re = lcmfunc(img)
img = double(img);
flag = 0;
%% the scale is 3
len = 3;
op31 = zeros(len*3); op31(1:len, 1:len) = 1/(len*len);
op32 = zeros(len*3); op32(1:len, len+1:2*len) = 1/(len*len);
op33 = zeros(len*3); op33(1:len, 2*len+1:3*len) = 1/(len*len);
op34 = zeros(len*3); op34(len+1:2*len, 1:len) = 1/(len*len);

op35 = ones(len);
m35 = imdilate(double(img), op35);

op36 = zeros(len*3); op36(len+1:2*len, 2*len+1:3*len) = 1/(len*len);
op37 = zeros(len*3); op37(2*len+1:3*len, 1:len) = 1/(len*len);
op38 = zeros(len*3); op38(2*len+1:3*len, len+1:2*len) = 1/(len*len);
op39 = zeros(len*3); op39(2*len+1:3*len, 2*len+1:3*len) = 1/(len*len);
m31 = imfilter(img, op31, 'symmetric');
m32 = imfilter(img, op32, 'symmetric');
m33 = imfilter(img, op33, 'symmetric');
m34 = imfilter(img, op34, 'symmetric');
m36 = imfilter(img, op36, 'symmetric');
m37 = imfilter(img, op37, 'symmetric');
m38 = imfilter(img, op38, 'symmetric');
m39 = imfilter(img, op39, 'symmetric');
m3b = cat(3, m31, m32, m33, m34, m36, m37, m38, m39);
m3b = max(m3b, [], 3);
out3 = m35.^2./m3b;
if flag
    figure; imshow(out3, []); hold on; plot(cx, cy, 'rs'); title('scale 3x3');
    figure; surf(out3); title('scale 3x3');
end
%% the scale is 5
len = 5;
op51 = zeros(len*3); op51(1:len, 1:len) = 1/(len*len);
op52 = zeros(len*3); op52(1:len, len+1:2*len) = 1/(len*len);
op53 = zeros(len*3); op53(1:len, 2*len+1:3*len) = 1/(len*len);
op54 = zeros(len*3); op54(len+1:2*len, 1:len) = 1/(len*len);

op55 = ones(len);
m55 = imdilate(img, op55);

op56 = zeros(len*3); op56(len+1:2*len, 2*len+1:3*len) = 1/(len*len);
op57 = zeros(len*3); op57(2*len+1:3*len, 1:len) = 1/(len*len);
op58 = zeros(len*3); op58(2*len+1:3*len, len+1:2*len) = 1/(len*len);
op59 = zeros(len*3); op59(2*len+1:3*len, 2*len+1:3*len) = 1/(len*len);
m51 = imfilter(img, op51, 'symmetric');
m52 = imfilter(img, op52, 'symmetric');
m53 = imfilter(img, op53, 'symmetric');
m54 = imfilter(img, op54, 'symmetric');
m56 = imfilter(img, op56, 'symmetric');
m57 = imfilter(img, op57, 'symmetric');
m58 = imfilter(img, op58, 'symmetric');
m59 = imfilter(img, op59, 'symmetric');
m5b = cat(3, m51, m52, m53, m54, m56, m57, m58, m59);
m5b = max(m5b, [], 3);
out5 = m55.^2./m5b;
if flag
    figure; imshow(out5, []);  hold on; plot(cx, cy, 'rs'); title('scale 5x5');
    figure; surf(out5); title('scale 5x5');
end
%% the scale is 7
len = 7;
op71 = zeros(len*3); op71(1:len, 1:len) = 1/(len*len);
op72 = zeros(len*3); op72(1:len, len+1:2*len) = 1/(len*len);
op73 = zeros(len*3); op73(1:len, 2*len+1:3*len) = 1/(len*len);
op74 = zeros(len*3); op74(len+1:2*len, 1:len) = 1/(len*len);

op75 = ones(len);
m75 = imdilate(img, op75);

op76 = zeros(len*3); op76(len+1:2*len, 2*len+1:3*len) = 1/(len*len);
op77 = zeros(len*3); op77(2*len+1:3*len, 1:len) = 1/(len*len);
op78 = zeros(len*3); op78(2*len+1:3*len, len+1:2*len) = 1/(len*len);
op79 = zeros(len*3); op79(2*len+1:3*len, 2*len+1:3*len) = 1/(len*len);
m71 = imfilter(img, op71, 'symmetric');
m72 = imfilter(img, op72, 'symmetric');
m73 = imfilter(img, op73, 'symmetric');
m74 = imfilter(img, op74, 'symmetric');
m76 = imfilter(img, op76, 'symmetric');
m77 = imfilter(img, op77, 'symmetric');
m78 = imfilter(img, op78, 'symmetric');
m79 = imfilter(img, op79, 'symmetric');
m7b = cat(3, m71, m72, m73, m74, m76, m77, m78, m79);
m7b = max(m7b, [], 3);
out7 = m75.^2./m7b;
if flag
    figure; imshow(out7, []);  hold on; plot(cx, cy, 'rs'); title('scale 7x7');
    figure; surf(out7); title('scale 7x7');
end
%%  the scale is 9
len = 9;
op91 = zeros(len*3); op91(1:len, 1:len) = 1/(len*len);
op92 = zeros(len*3); op92(1:len, len+1:2*len) = 1/(len*len);
op93 = zeros(len*3); op93(1:len, 2*len+1:3*len) = 1/(len*len);
op94 = zeros(len*3); op94(len+1:2*len, 1:len) = 1/(len*len);

op95 = ones(len);
m95 = imdilate(img, op95);

op96 = zeros(len*3); op96(len+1:2*len, 2*len+1:3*len) = 1/(len*len);
op97 = zeros(len*3); op97(2*len+1:3*len, 1:len) = 1/(len*len);
op98 = zeros(len*3); op98(2*len+1:3*len, len+1:2*len) = 1/(len*len);
op99 = zeros(len*3); op99(2*len+1:3*len, 2*len+1:3*len) = 1/(len*len);
m91 = imfilter(img, op91, 'symmetric');
m92 = imfilter(img, op92, 'symmetric');
m93 = imfilter(img, op93, 'symmetric');
m94 = imfilter(img, op94, 'symmetric');
m96 = imfilter(img, op96, 'symmetric');
m97 = imfilter(img, op97, 'symmetric');
m98 = imfilter(img, op98, 'symmetric');
m99 = imfilter(img, op99, 'symmetric');
m9b = cat(3, m91, m92, m93, m94, m96, m97, m98, m99);
m9b = max(m9b, [], 3);
out9 = m95.^2./m9b;
if flag
    figure; imshow(out9, []);  hold on; plot(cx, cy, 'rs'); title('scale 9x9');
    figure; surf(out9); title('scale 9x9');
end
%%
out = cat(3, out3, out5, out7, out9);
re = max(out, [], 3);
if flag
    figure; imshow(re, []);
    figure; surf(re);
end
end