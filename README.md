# LVQ-handwriting-number-recognition
LVQ手写数字识别

第四次作业第1题

（1）基于LVQ神经网络的手写数字识别研究与实现

图像数据：

导入数据->元胞数组->转化成784×5000矩阵->归一化->降维(降维贡献率大于0.95)->归一化

期望数据：直接导入

LVQ神经网络：121-243-10

竞争层（隐含层）神经元数目为243，学习速率为0.1，学习函数为learn1v1

循环次数为50


运行import_1.m导入图片与标签数据，同时对图片数据进行降维处理

运行后将会得到data1.mat 其中x是数据，y是标签

再运行exam4_1.m进行神经网络训练，训练后的神经网络为net1.mat

![image](https://user-images.githubusercontent.com/92127845/160222252-ed6eee97-6db2-4aab-81e0-92eb4b2c0fe5.png)

Perf1是net1.mat神经网络训练集的performance ；acct1是训练集的网络识别准确度

perf2是net1.mat神经网络验证集的performance ；acct2是验证集的网络识别准确度


![image](https://user-images.githubusercontent.com/92127845/160222268-cc02a4ba-7b50-4a36-aa57-a7d4e63216bf.png)
![image](https://user-images.githubusercontent.com/92127845/160222276-a39cf9db-76ad-4480-a26c-f9c7641e0a6e.png)


或许降维时贡献率设置为0.98会得出更好的网络，但由于该LVQ网络训练速度实在太慢，故我仍旧选择0.95，此时得出的结果也能勉强令人满意
