% Values tp, fn, fp and tn given the matrix and the class
function [tp,fn,fp,tn]= calculateData(matrix,class)

tp = matrix(class,class);
fn = 0;
fp = 0;
tn = 0;

for i = 1:1:3
  if class ~= i
       fn = fn + matrix(class,i);
       fp = fp + matrix(i,class);
  end
end

for j = 1:1:3
   for k = 1:1:3
      if (j ~= class && k ~= class)
          tn = tn + matrix(j,k);
      end
   end
end


