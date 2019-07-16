function acc=Acurracy(output,target)
acc=0;
for i=1:size(output,1)
    if (output(i)==target(i))
        acc = acc + 1;
    end
end
acc=acc/size(output,1);

