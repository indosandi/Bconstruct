param3
larray=0:lmax;
sbessarr=zeros(nringsq,nrings,lmax+1); 
for iq=1:nringsq
    fprintf('%d \n',iq);
    for ir=1:nrings
        for il=1:numel(larray)   
         q=(iq-1)*dq;
         r=(ir-1)*dr;
         sbessarr(iq,ir,il)=spbs(larray(il),q*r*2*pi); 
        end
    end
end
% size(bessarr)
save('spbs.mat','sbessarr');

%for im=1:numel(marray) 
    %mvalue=marray(im);
    %for iphi=1:nphi
    %phi=(iphi-1)*dphi;
    %expmtheta(im,iphi)=exp(1j*(mvalue)*phi); 
    %expmthetan(im,iphi)=exp(-1j*(mvalue)*phi); 
    %end    
%end
%save('expm.mat','expmtheta');
%save('expmn.mat','expmthetan');
