%*****************************************************************
%  Description: CV-CNN train & test
%  Input: dataset
%  Output: train & val accuracy; test output
%  Create: EMW
%  Date: July.22, 2017
%*****************************************************************
% clear all; close all; clc;  
addpath('../data prepraration');  
addpath('./util');   
load dataset_cv_cnn.mat;
% load train_data_12000_12.mat;load train_label_12000_12.mat;
% load test_data_1321_12.mat;load test_label_1321_12.mat;
% load test_img_sam12.mat;
%% CV_CNN architecture
cnn.layers = {  
    struct('type', 'i')                                     %input layer  
    struct('type', 'c', 'outputmaps', 6, 'kernelsize', 3)   %convolution layer  
    struct('type', 's', 'scale', 2)                         %sub sampling layer  
    struct('type', 'c', 'outputmaps', 18, 'kernelsize', 3)  %convolution layer  
%     struct('type', 's', 'scale', 2)                       %subsampling layer  
};  
 
% Initialize parameters
cnn = cv_cnn_setup(cnn,train_data_s, train_label_s);  
    
opts.alpha = 0.8 ;                  % learning rate
opts.batchsize = 100;               % batch size,  
opts.numepochs = 2;                % epochs

% train 
cnn = cv_cnn_train(cnn,train_data_s, train_label_s, opts);  
  
% validation    
[er2, bad2] = cv_cnn_val(cnn,val_data_s,val_label_s);

% test
net2 = cv_cnn_ff(cnn,test_img);
test_img_oo = net2.o;

%plot mean squared error  
plot(cnn.rL);  

%show test error  
disp([num2str(er2*100) '% error']); 

save test_img_oo.mat
