%基于PCA的图像融合
close all;
clear all;
clc;
dbstop if error;

s=cell(1,2);
% read N image
s{1} = imread('./Resource/high2.jpg');
s{2} = imread('./Resource/low2.jpg');
[m,n]=size(s);
k=[s{1}(:)];
% show images
for i=1:n
    figure, imshow(s{i});
    if i ~= 1
        k=[k s{i}(:)];
    end;
end;
k = double(k);
%求X标准化的协差矩阵的特征根和特征向量
[V D] = eig(cov(k));
maxValue = max(max(D));
[r,c] = find(maxValue == D);
a = V(:,r)./sum((V(:,r)));

g = zeros(size(s{1}),'uint8');
for i=1:r
    g = g + a(i)*s{i};
end

figure, imshow(g);