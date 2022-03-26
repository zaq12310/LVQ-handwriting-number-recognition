close all;clear;clc
%基于LVQ神经网络的手写数字识别

%% 导入数据并划分
load data1.mat;
total_N = size(x,2);     %求输入的总样本数
trainSet_N = round(0.7*total_N);   %训练集样本数
validationSet_N = round(0.15*total_N);   %验证集样本数

id = randperm(total_N);%从初始数据集中无放回抽样

%%
%取出训练集

%取前trainSet_N列为训练集的样本编号
trainSet_id = id(:,1:trainSet_N); 

%按编号取出训练集
trainSet = x(:,trainSet_id);%训练集
train_index=d(:,trainSet_id);%标签值
%%
%取接着的validationSet_N列为验证集的样本编号
validationSet_id = id(:,(trainSet_N+1):(trainSet_N+validationSet_N)); 

%取出验证集
validationSet = x(:,validationSet_id);%训练集
validationSet_index=d(:,validationSet_id);%标签值
train_x = trainSet;        % 训练集输入
train_t = train_index;        % 训练集标签
test_x = validationSet;       % 测试集输入
test_t = validationSet_index;       % 测试集标签
%% 设置网络结构
net = lvqnet(243,0.1,'learnlv1');   % 网络的相关设置,网络隐含层设置为243，学习率是0.1，学习函数是 'learnlv1'或 'learnlv2'
net.trainParam.epochs = 50;        % 训练轮次为50
net = train(net,train_x,train_t);  % 进行网络的训练，输入训练集数据
view(net)                          % 网络结构可视化
%% 得到训练集的预测结果
train_y = net(train_x);              % 将x输入训练后的网络，得到预测结果
perf1 = perform(net,train_y,train_t) % 计算网络的表现（计算原理未知）
y1 = vec2ind(train_y);               % 将输出的向量转换为类别
t1 = vec2ind(train_t);               % 将原标签转换为索类别
acc1 = sum(y1==t1)/numel(t1)         % 计算网络的识别准确度
%% 得到测试集的预测结果
test_y = net(test_x);                 % 将x输入训练后的网络，得到预测结果
perf2 = perform(net,test_y,test_t)    % 计算网络的表现（计算原理未知）
y2 = vec2ind(test_y);                 % 将输出的向量转换为类别
t2 = vec2ind(test_t);                 % 将原标签转换为索类别
acc2 = sum(y2==t2)/numel(t2)          % 计算网络的识别准确度

save 'net1.mat' net
