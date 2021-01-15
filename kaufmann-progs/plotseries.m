file='logit';
cal_beg=date_deb;
cal_end=2006;
cal_end_est=2006.75;
unit_spec_var=0;
sg_change=1;
S_logit=0;
K=3;

daten_read_cont0703

ctry=ser_sel;
% % [data ctry]=xlsread('DAT_roh_Q0604.xls'); %
% [data ctry]=xlsread('DATQ0703.xls'); %
% % 1988Q1-2006Q1, 06Q1 is missing for most of the series
% % the first line, 1987Q4 contains an indicator which relates to a specific class of series (see printout)
% % 1   GDP and its main components
% % 2   WIFO business cycle indicator
% % 3   business surveys
% % 4   prices (HICP)
% % 5   CPI
% % 6   wages
% % 7   wholesale prices
% % 8   foreign trade
% % 9   labor market
% % 10  IP
% % 11  financial variables
% 
% ctry=ctry(1,2:end);
% cat_dum=data(1,:);
% data=data(2:end,:);
% ctries_sel={'SZR';'QTAUF';'QTEXPA';'QTLAG';'QTPR';'QTPRO';'QTBAUF';'QTBPR';'QTBBGL';'QTBAGL';'INDSEN';'KTPROL';'manuf-oscd';'KTAUSL';...
%             'KTLAG';'KTPRON';'KTVPN';'BAUVPN';'EINDSE';'EBAUSE';'EHANSE';'EKONSE';'ALQN';'ALQNSA';'STI';'SEKMRE';'YIELD'};
% % data=log(data);
% % y_gr=(data(2:end,:)-data(1:end-1,:))*100;
% % y_gr=y_gr- kron(ones(size(y_gr,1),1),mean(y_gr,1));
% % cctries=cellstr(ctries_sel);
% ind_diff=find(sum(strcmp(ctry(ones(size(ctries_sel,1),1),:),ctries_sel(:,ones(1,size(ctry,2)))),1));
% ind_logdiff=find(1-sum(strcmp(ctry(ones(size(ctries_sel,1),1),:),ctries_sel(:,ones(1,size(ctry,2)))),1));
% ind_oel=find(strcmp(ctry,'OEL'));
% ind_mult100=ind_logdiff([1:find(ind_logdiff==ind_oel)-1 find(ind_logdiff==ind_oel)+1:end]);
% 
% data(:,ind_logdiff)=log(data(:,ind_logdiff));
% data=data(2:end,:)-data(1:end-1,:);
% data(:,ind_mult100)=data(:,ind_mult100)*100;


ngr=6;
nc=2;
nr=ngr/nc;
nctr=size(data,2);
nfig=ceil(nctr/ngr);

cend=2007;
nobs=size(data,1);
cal= cend-[nobs:-1:1]./4;

if iplot
    for f=1:nfig;
        figure(double(gcf)+1)
        for j=1:ngr
            if (f-1)*ngr+j<=nctr
                subplot(nr,nc,j)
                plot(cal,data(:,(f-1)*ngr+j))
                xlabel(ctry(1,(f-1)*ngr+j))
                ax1=gca;
                set(ax1,'XLim',[cal(1) cal(end)])
                %             ax2=axes('Position',get(ax1,'Position'),'XAxisLocation','top','YAxisLocation','right','Color','none');
                %             set(ax2,'XLim',[cal(1) cal(end)],'XTickLabel',' ')
                %             %     if k==1 set(ax2,'XLim',[cal(1) cal(end)],'YLim',[-5 5]); end
                %             line(cal(2:end),y_gr(:,(f-1)*ngr+j),'Parent',ax2,'Color','k')
                %             hold on
                %             line(cal(1:end),zeros(size(data,1),1),'Parent',ax2,'Color','k')
            end
        end
    end
end
% figure(double(gcf)+1)
% plot(cal(2:end),y_gr(:,ind_ctry))
% axis([cal(2) cal(end) min(min(y_gr(:,ind_ctry),[],1))-0.1 max(max(y_gr(:,ind_ctry),[],1))+0.1])
