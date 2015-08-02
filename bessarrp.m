param3
marray=-mmax:mmax;
for iq=1:nrings
    fprintf('%d \n',iq);
    for ir=1:nrings
        for im=1:numel(marray)     
         q=(iq-1)*dq;
         r=(ir-1)*dr;
         bessarr(iq,ir,im)=besselj(marray(im),q*r*2*pi); 
        end
    end
end
save('bessarrtest.mat','bessarr');

for im=1:numel(marray) 
    mvalue=marray(im);
    for iphi=1:nphi
    phi=(iphi-1)*dphi;
    expmtheta(im,iphi)=exp(1j*(mvalue)*phi); 
    expmthetan(im,iphi)=exp(-1j*(mvalue)*phi); 
    end    
end
save('expm.mat','expmtheta');
save('expmn.mat','expmthetan');