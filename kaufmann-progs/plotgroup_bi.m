str=['k'];

for i=1:size(bols,1)
   scatter(bols(i,i1),bols(i,i2),1.,str);
   hold on;
end


  str=['r'];

for i=1:size(bols,1)
   scatter(betai(i,i1),betai(i,i2),1.,str);

   hold on;
end
