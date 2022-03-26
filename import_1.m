%图像预处理
%导入数据集

x=cell(1,5000);   %建立一个空元胞数组，1行5000个元素 每个元素代表一个图片

for i=1:5000
imgpath=strcat('E:\计算智能作业\第四次作业\LVQ—手写数字识别\图片\',num2str(i),'.jpg');
x{i}=imread(imgpath);       
%导入图片
end

x=cell2mat(x);       %元胞数组转化为矩阵
x=reshape(x,784,5000);      %转换为样本集 将x重构成一个784×5000数组

x=im2double(x);          %归一化处理
[~,score,latent,~]=pca(x');%获取PCA降维数据

a=cumsum(latent)./sum(latent);   % 计算特征的累计贡献率
% 降维贡献率大于等于 0. 95、0. 96、0. 97、0. 98
idx=find(a>0.95);     % 将特征的累计贡献率不小于0.95的维数作为PCA降维后特征的个数
k=idx(1);
pca_after=score(:,1:k);   % 取转换后的矩阵score的前k列为PCA降维后矩阵
pca_after=pca_after';

x=zeros(k,5000);
x=pca_after;
x=im2double(x);          %再一次归一化处理

d=importdata('E:\计算智能作业\第四次作业\LVQ—手写数字识别\期望输出.xlsx');  
%导入期望输出

save  'data1.mat'  x d;