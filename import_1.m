%ͼ��Ԥ����
%�������ݼ�

x=cell(1,5000);   %����һ����Ԫ�����飬1��5000��Ԫ�� ÿ��Ԫ�ش���һ��ͼƬ

for i=1:5000
imgpath=strcat('E:\����������ҵ\���Ĵ���ҵ\LVQ����д����ʶ��\ͼƬ\',num2str(i),'.jpg');
x{i}=imread(imgpath);       
%����ͼƬ
end

x=cell2mat(x);       %Ԫ������ת��Ϊ����
x=reshape(x,784,5000);      %ת��Ϊ������ ��x�ع���һ��784��5000����

x=im2double(x);          %��һ������
[~,score,latent,~]=pca(x');%��ȡPCA��ά����

a=cumsum(latent)./sum(latent);   % �����������ۼƹ�����
% ��ά�����ʴ��ڵ��� 0. 95��0. 96��0. 97��0. 98
idx=find(a>0.95);     % ���������ۼƹ����ʲ�С��0.95��ά����ΪPCA��ά�������ĸ���
k=idx(1);
pca_after=score(:,1:k);   % ȡת����ľ���score��ǰk��ΪPCA��ά�����
pca_after=pca_after';

x=zeros(k,5000);
x=pca_after;
x=im2double(x);          %��һ�ι�һ������

d=importdata('E:\����������ҵ\���Ĵ���ҵ\LVQ����д����ʶ��\�������.xlsx');  
%�����������

save  'data1.mat'  x d;