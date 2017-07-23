Complex-Valued Convolutional Neural Network and Its Application in PoSAR Image Classification

Requirements
Matlab

Experiments
The test demo is on Flevoland dataset acquired by the AIRSAR sensor with L band.

1. data preparation 
run dataset_create.m to create train and test data

2. network construction and training
run cv_cnn_main.m to predict the class of testing data

3. result analysis
run test_imaging.m to get the classification image
run result_mask.m to get the classification image overlaid ground truth area 
run calculate_acc.m to calculate the accuracy of the network
run calculate_confusion_matrix.m to calculate the confusion matrix of the network

