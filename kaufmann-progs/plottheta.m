%burn_in=(1==1);
ifig=ifig+1;figure(ifig);
kp = size(thetamc,2);
it=size(thetamc,1);
hold_on=(1==1); ll=''; %ll='--';ll='-.'; 
set(GCA,'fontsize',fs);

if (it-it0)<1000 ispace=1;else ispace=floor((it-it0)/1000);end


indext=[1:it];
if burn_in 
   indexp=[1:ispace:it];
else
   indexp=[it0:ispace:it];
end   
indexhist=[it0:it];nbin=20;
space_ac=10;parac_max=20;
%space_ac ... spacing used for computing autocorrelation
indexac=[it0:space_ac:it];


nplot=0;
if plot_path nplot=nplot+1; end;
if plot_ac nplot=nplot+1; end;
if plot_dichte nplot=nplot+1; end;


for i = 1:kp
   isub=0;
   
   chtitle=chtheta;
   if kp>1 chtitle=[chtitle '_' num2str(i)]; end

   if plot_path
      isub=isub+1;
      subplot(kp,nplot,nplot*(i-1)+isub);
      if hold_on
         hold on;
         cl=[c(i,1) ll];
      else
         cl=c(i,1);
      end
      set(GCA,'fontsize',fs);

      plot(indext(indexp)',thetamc(indexp,i),cl);
      
      hold on;
      if burn_in plot([it0 it0],get(GCA,'YLim'),'k');end
      ylabel([chtitle]);
      k=i;%???
      if i==k xlabel('Iteration m');end
            xa=axis;
            axis([indext(indexp([1 end])) xa(3:4)]);

   end
   
   if plot_ac  
      isub=isub+1;
      subplot(kp,nplot,nplot*(i-1)+isub);
      if hold_on
         hold on;
         cl=[c(i,1) ll];
      else
         cl=c(i,1);
      end
      
      ineff=plotac(thetamc(indexac,i),parac_max,cl);
      set(GCA,'fontsize',fs);
      if i==k xlabel('Lag');end
      %legend(['ineff: ' num2str(ineff,3)]);
      
   end
   
   if plot_dichte
      isub=isub+1;
      subplot(kp,nplot,nplot*(i-1)+isub);
      if hold_on
         hold on;
         cl=[c(i,1) ll];
      else
         cl=c(i,1);
      end
      
      plotdichte(thetamc(indexhist,i),cl);
      set(GCA,'fontsize',fs);
      if i==1 
         chtitle=chtheta;
         title(['Posterior of ' chtitle]);end 
      xlabel([chtitle]);
   end
end

