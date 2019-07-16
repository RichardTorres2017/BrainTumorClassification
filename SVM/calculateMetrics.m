function [precision, specificity, accuracy] = calculateMetrics(matrix)

% precision, specificity and accuracy
precision = 0;
specificity = 0;
accuracy = 0;


for i = 1:1:3
    % Calculate the tn, fn, fp, tn
    [tp,fn,fp,tn] = calculateData(matrix,i);
    % precision
    precision_one = tp / (tp + fp);
    %specificity
    specificity_one = tn / (tn + fp);
    % accuracy
    accuracy_one = (tp + tn)/ (tp + tn + fp + fn);
    precision = precision + precision_one;
    specificity = specificity + specificity_one;
    accuracy = accuracy +  accuracy_one;
end

% Average precision, specificity, and accuracy
precision = precision / 3;
specificity = specificity / 3;
accuracy = accuracy / 3;