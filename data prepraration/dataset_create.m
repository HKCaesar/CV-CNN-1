%*****************************************************************
%  Description: data preparation for CV-CNN
%  Input: T matrix; label
%  Output: train_data,train_label,val_data,val_label,test_data
%  Create: EMW
%  Date: July.22, 2017
%*****************************************************************

clear
load label.mat
load 'T_L2.mat'
nchan = 6;             % T matrix channels
%% Auto data sampling
[data,nwin,nsam] = prepare_data_d6(T11L,T12L,T13L,T22L,T23L,T33L,nchan,label);

%% Split to train and validation dataset
[train_data,train_label,val_data,val_label] = prepare_data_train_val(data,nchan,nwin,nsam);

%% Data preprocessing
[train_data_s,test_img] = data_process_train(train_data,T11L,T12L,T13L,T22L,T23L,T33L,nwin); 
val_data_s  = data_process_val(val_data);
train_label_s = label_process(train_label);     
val_label_s = label_process(val_label);

save  'dataset_cv_cnn.mat' train_data_s train_label_s val_data_s val_label_s test_img -v7.3