close all;clear;clc
%����LVQ���������д����ʶ��

%% �������ݲ�����
load data1.mat;
total_N = size(x,2);     %���������������
trainSet_N = round(0.7*total_N);   %ѵ����������
validationSet_N = round(0.15*total_N);   %��֤��������

id = randperm(total_N);%�ӳ�ʼ���ݼ����޷Żس���

%%
%ȡ��ѵ����

%ȡǰtrainSet_N��Ϊѵ�������������
trainSet_id = id(:,1:trainSet_N); 

%�����ȡ��ѵ����
trainSet = x(:,trainSet_id);%ѵ����
train_index=d(:,trainSet_id);%��ǩֵ
%%
%ȡ���ŵ�validationSet_N��Ϊ��֤�����������
validationSet_id = id(:,(trainSet_N+1):(trainSet_N+validationSet_N)); 

%ȡ����֤��
validationSet = x(:,validationSet_id);%ѵ����
validationSet_index=d(:,validationSet_id);%��ǩֵ
train_x = trainSet;        % ѵ��������
train_t = train_index;        % ѵ������ǩ
test_x = validationSet;       % ���Լ�����
test_t = validationSet_index;       % ���Լ���ǩ
%% ��������ṹ
net = lvqnet(243,0.1,'learnlv1');   % ������������,��������������Ϊ243��ѧϰ����0.1��ѧϰ������ 'learnlv1'�� 'learnlv2'
net.trainParam.epochs = 50;        % ѵ���ִ�Ϊ50
net = train(net,train_x,train_t);  % ���������ѵ��������ѵ��������
view(net)                          % ����ṹ���ӻ�
%% �õ�ѵ������Ԥ����
train_y = net(train_x);              % ��x����ѵ��������磬�õ�Ԥ����
perf1 = perform(net,train_y,train_t) % ��������ı��֣�����ԭ��δ֪��
y1 = vec2ind(train_y);               % �����������ת��Ϊ���
t1 = vec2ind(train_t);               % ��ԭ��ǩת��Ϊ�����
acc1 = sum(y1==t1)/numel(t1)         % ���������ʶ��׼ȷ��
%% �õ����Լ���Ԥ����
test_y = net(test_x);                 % ��x����ѵ��������磬�õ�Ԥ����
perf2 = perform(net,test_y,test_t)    % ��������ı��֣�����ԭ��δ֪��
y2 = vec2ind(test_y);                 % �����������ת��Ϊ���
t2 = vec2ind(test_t);                 % ��ԭ��ǩת��Ϊ�����
acc2 = sum(y2==t2)/numel(t2)          % ���������ʶ��׼ȷ��

save 'net1.mat' net
