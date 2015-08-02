function Imq=poldecom(Iqpolar,mmax,expmn)
marray=-mmax:mmax; 
nphi=size(Iqpolar,2);
nrings=size(Iqpolar,1);
dphi=2*pi/nphi;
% expmn=matf('expmn.mat');
for im=1:numel(marray) 
    mvalue=marray(im);
    for iphi=1:nphi
        for iq=1:nrings
            phi=(iphi-1)*dphi;
%             Iqsum(iq,iphi,im)=Iqpolar(iq,iphi).*exp(-1j*(mvalue)*phi);
            Iqsum(iq,iphi,im)=Iqpolar(iq,iphi).*expmn(im,iphi); 
      end
  end    
end
Imq=sum(Iqsum,2);
Imq=squeeze(Imq);
Imq=Imq*dphi/(2*pi); % scaling after integration
end