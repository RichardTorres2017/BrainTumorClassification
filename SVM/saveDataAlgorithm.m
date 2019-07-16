%load ('train_preprocessed')
%load ('train_normal')

% load ('train_preprocessed')
% filename1 = 'final_train_preprocessed.mat';
% filename2 =  'final_test_preprocessed.mat';
% [row,col]=size(final);
%  x1=[20:50,70:100,120:150];
%  x2=[16:19,66:69,116:119];
%  Data=final;
%  DataTrain=Data(x1,:);
%  DataTests=Data(x2,:);
%  save(filename1, 'DataTrain');
%  save(filename2, 'DataTests');


%%%%%%%%%%%% Final Normal Data %%%%%%%%%%%%%%%%%%%%%%%%%%%

% load('final_train_normal.mat');
% load('final_test_normal.mat');
% 
% filename = 'final_normal_data.mat';
% Data = zeros(105,14);
% Data(1:93,:) = DataTrain(:,:);
% Data(94:end,:) = DataTests(:,:);
% 
% save(filename,'Data');

%%%%%%%%%%% Final Preprocessed Data %%%%%%%%%%%%%%%%%%%%%%%
load('final_train_preprocessed.mat');
load('final_test_preprocessed.mat');

filename = 'final_preprocessed_data.mat';
Data = zeros(105,14);
Data(1:93,:) = DataTrain(:,:);
Data(94:end,:) = DataTests(:,:);

save(filename,'Data');




 
 
 