function Imq=poldecom(Iqpolar,mmax,expmn)
marray=-mmax:mmax; 
msize=numel(marray);

nphi=size(Iqpolar,2);
nrings=size(Iqpolar,1);
dphi=2*pi/nphi;

Iqpolrep=repmat(Iqpolar,[1 1 msize]);
% size(Iqpolrep)

expmnrep=repmat(expmn,[1 1 nrings]);
expmnrep=permute(expmnrep,[3 2 1]);
% size(expmnrep)

Iqsum2=Iqpolrep.*expmnrep;

% for im=1:numel(marray) 
%     mvalue=marray(im);
%     for iphi=1:nphi
%         for iq=1:nrings
%             phi=(iphi-1)*dphi;
% %             Iqsum(iq,iphi,im)=Iqpolar(iq,iphi).*exp(-1j*(mvalue)*phi);
%             Iqsum(iq,iphi,im)=Iqpolar(iq,iphi).*expmn(im,iphi); 
%       end
%   end    
% end
% R(Iqsum2,Iqsum)
% Iqsum(10,9:11,22)
% Iqsum2(10,9:11,22)
% pause

Imq=sum(Iqsum2,2);
Imq=squeeze(Imq);
Imq=Imq*dphi/(2*pi); % scaling after integration
end