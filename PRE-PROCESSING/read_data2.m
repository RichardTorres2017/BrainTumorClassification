clear all
clc

data = [1:3064];
types = {};
counter = [0, 0, 0];
total = 0;
number = 50;

for i=1:length(data)
    load(strcat('Data_set/',int2str(data(i)),'.mat'))
    
    if(cjdata.label == 1 && counter(1)<number)
        counter(1) = counter(1)+1;
        total = total + 1;
        info.image = cjdata.image;
        info.label = cjdata.label;
        info.tumor = cjdata.tumorMask;
        types{total} = info;
    elseif(cjdata.label == 2 && counter(2)<number)
        counter(2) = counter(2)+1;
        total = total + 1;
        info.image = cjdata.image;
        info.label = cjdata.label;
        info.tumor = cjdata.tumorMask;
        types{total} = info;
    elseif(cjdata.label == 3 && counter(3)<number)
        counter(3) = counter(3)+1;
        total = total + 1;
        info.image = cjdata.image;
        info.label = cjdata.label;
        info.tumor = cjdata.tumorMask;
        types{total} = info;
    end
    
    if(counter(1)==number && counter(2)==number && counter(3)==number)
        break;
    end
    
end

save('data_tumors.mat','types');
variables = [];
transformed = {};
pcaInfo = {};

for i=1:length(types)
    
    J = types{i}.image;
    label = types{i}.label;
    
    [cA1,cH1,cV1,cD1] = dwt2(J,'db4');
    transforms.first = [cA1,cH1;cV1,cD1];
    [cA2,cH2,cV2,cD2] = dwt2(cA1,'db4');
    transforms.second = [cA2,cH2;cV2,cD2];
    [cA3,cH3,cV3,cD3] = dwt2(cA2,'db4');
    transforms.third = [cA3,cH3;cV3,cD3];
    
    transformed{i} = transforms;

    DWT_feat = [cA3,cH3,cV3,cD3];
    [coeff,score,latent,tsquared,explained,mu] = pca(DWT_feat);
    
    pcaInfo{i} = explained;
    
    g = graycomatrix(coeff);
    stats = graycoprops(g,'Contrast Correlation Energy Homogeneity');
    Contrast = stats.Contrast;
    Correlation = stats.Correlation;
    Energy = stats.Energy;
    Homogeneity = stats.Homogeneity;
    Mean = mean2(coeff);
    Standard_Deviation = std2(coeff);
    Entropy = entropy(coeff);
    RMS = mean2(rms(coeff));
    %Skewness = skewness(img)
    Variance = mean2(var(double(coeff)));
    a = sum(double(coeff(:)));
    Smoothness = 1-(1/(1+a));
    Kurtosis = kurtosis(double(coeff(:)));
    Skewness = skewness(double(coeff(:)));
    % Inverse Difference Movement
    m = size(coeff,1);
    n = size(coeff,2);
    in_diff = 0;
    for i = 1:m
        for j = 1:n
            temp = coeff(i,j)./(1+(i-j).^2);
            in_diff = in_diff+temp;
        end
    end
    IDM = double(in_diff);
    
    feat = [Contrast,Correlation,Energy,Homogeneity, Mean, Standard_Deviation, Entropy, RMS, Variance, Smoothness, Kurtosis, Skewness, IDM, label];
    variables = [variables;feat];
end

% attributes = variables(:,1:13);
% %Anorm = (attributes - min(attributes(:)))./(max(attributes(:)) - min(attributes(:)));
% %Anorm = norm(attributes);
% attributes = round(attributes,3);
% minVal = min(attributes);
% maxVal = max(attributes);
% Anorm = (attributes- minVal) ./ ( maxVal - minVal );
% 
% final = [Anorm, variables(:,14)];
% %index = randperm(length(final));
% %final = final(index, :);
% 
% save('train_normal.mat','final');
