param3
Iqpolar=matf('kchannelIq_pol.mat'); 
% Iqpolar=abs(aqpolar).^2; 
% size(Iqpolar) 
% cd ..
% polplot(Iqpolar); 
% drawnow; 
% cd tools
expmn=matf('expmn55.mat'); 
Imq=poldecom(Iqpolar,mmax,expmn);
save('Imqkchannel55.mat','Imq');
B=abs(Imq).^2;
save('Bkchannel55.mat','B') 
