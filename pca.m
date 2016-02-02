%基于PCA的图像融合
close all;
clear all;
clc;
x = imread('./Resource/3.jpg');
y = imread('./Resource/4.jpg');
figure, imshow(x);
figure, imshow(y);
k=[x(:) y(:)];
k=double(k);
%求X标准化的协差矩阵的特征根和特征向量
[V D] = eig(cov(k));
if (D(1,1) > D(2,2))
  a = V(:,1)./sum(V(:,1));
else 
  a = V(:,2)./sum(V(:,2));
end;

% and fuse
g = a(1)*x+a(2)*y; 
figure, imshow(g);