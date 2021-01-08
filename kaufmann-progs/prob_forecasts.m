fprintf(fid,'\n');
fprintf(fid,'unconditional probabilities of being in state 2, 1 and 2 periods ahead \n');
fprintf(fid,'%5.2f %5.2f\n',mean(bforeIMS_mat(:,1:2,:,end),3)');
fprintf(fid,'\n');
fprintf(fid,'probability of reaching state 4, 1 and 2 periods ahead \n');
fprintf(fid,'%5.2f %5.2f\n',[sum(and(bforeIMS_mat(1,1,:,end),bforeIMS_mat(2,1,:,end)))/Mf ...
    sum(and(bforeIMS_mat(1,2,:,end),bforeIMS_mat(2,2,:,end)))/Mf]);
fprintf(fid,'probability of reaching state 3, 1 and 2 periods ahead \n');
fprintf(fid,'%5.2f %5.2f\n',[sum(and(bforeIMS_mat(1,1,:,end),1-bforeIMS_mat(2,1,:,end)))/Mf ...
    sum(and(bforeIMS_mat(1,2,:,end),1-bforeIMS_mat(2,2,:,end)))/Mf]);
fprintf(fid,'probability of reaching state 1, 1 and 2 periods ahead \n');
fprintf(fid,'%5.2f %5.2f\n',[sum(and(1-bforeIMS_mat(1,1,:,end),1-bforeIMS_mat(2,1,:,end)))/Mf ...
    sum(and(1-bforeIMS_mat(1,2,:,end),1-bforeIMS_mat(2,2,:,end)))/Mf]);
fprintf(fid,'probability of reaching state 2, 1 and 2 periods ahead \n');
fprintf(fid,'%5.2f %5.2f\n',[sum(and(1-bforeIMS_mat(1,1,:,end),bforeIMS_mat(2,1,:,end)))/Mf ...
    sum(and(1-bforeIMS_mat(1,2,:,end),bforeIMS_mat(2,2,:,end)))/Mf]);