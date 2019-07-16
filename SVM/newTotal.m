% Data without processing with 13 atributes after the PCA
load('final_normal_data');
% Data with processing with 13 atributes after the PCA

%load('final_preprocessed_data');

% Data size
[row,col]=size(Data);

limite=size(Data,2);
% Lngitude
Lon=length(Data);

% Data Train  
DataTrain=Data(1:93,:);
% Data Test
DataTests=Data(94:end,:);
      
% Calculate the matrices
l_matrix=new_confusion_linear(Data);
q_matrix=new_confusion_quadratic(Data);
p_matrix=new_confusion_rbf(Data);

% Calculate the metrics according to the matrix: l_matrix, q_matrix or
% p_matrix
[precision, specificity, accuracy] = calculateMetrics(p_matrix);







