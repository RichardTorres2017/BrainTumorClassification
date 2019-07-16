function [p_matrix]= new_confusion_rbf(Data)
p_matrix=zeros(3,3);
limite=size(Data,2);

% DataTrain and DataTests
 DataTrain=Data(1:93,:);
 DataTests=Data(94:end,:);

% Use the algorithm multisvm, and the kernel is rbf
results= multisvm(DataTrain(:,1:limite-1), DataTrain(:,limite), DataTests(:,1:limite-1),'rbf');

% Build the confusion matrix
for i=1:size(DataTests,1)
    if ((DataTests(i,limite)==1) & (results(i)==1) )
        p_matrix(1,1)=p_matrix(1,1)+1;
    elseif ((DataTests(i,limite)==1) & (results(i)==2) )
        p_matrix(1,2)=p_matrix(1,2)+1;
    elseif ((DataTests(i,limite)==1) & (results(i)==3)  )
        p_matrix(1,3)=p_matrix(1,3)+1;
    end
        
    if ((DataTests(i,limite)==2) & (results(i)==1) )
        p_matrix(2,1)=p_matrix(2,1)+1;
    elseif ((DataTests(i,limite)==2) & (results(i)==2) )
        p_matrix(2,2)=p_matrix(2,2)+1;
    elseif ((DataTests(i,limite)==2) & (results(i)==3)  )
        p_matrix(2,3)=p_matrix(2,3)+1;    
    end
    
    if ((DataTests(i,limite)==3) & (results(i)==1) )
        p_matrix(3,1)=p_matrix(3,1)+1;
    elseif ((DataTests(i,limite)==3) & (results(i)==2) )
        p_matrix(3,2)=p_matrix(3,2)+1;
    elseif ((DataTests(i,limite)==3) & (results(i)==3)  )
        p_matrix(3,3)=p_matrix(3,3)+1;    
    end
end