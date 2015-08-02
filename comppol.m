function rhoPolar=comppol(rhoM,nphi,expm)
mmax=(size(rhoM,2)-1)/2;
marray=-mmax:mmax;
nrings=size(rhoM,1);
dphi=2*pi/(nphi);
phi=0:dphi:2*pi-dphi;
rhoPolar=zeros(nrings,numel(marray));
% expmtheta=zeros(numel(marray),numel(phi));
% expm=matf('expm.mat');
% for im=1:numel(marray);
% for iphi=1:numel(phi)
%     expmtheta(im,iphi)=exp(j*marray(im)*phi(iphi));
% end
% end

for im=1:numel(marray) 
    mvalue=marray(im);
    for iphi=1:nphi
        for iq=1:nrings
            phi=(iphi-1)*dphi;
%             Iqsum(iq,iphi,im)=rhoM(iq,im).*exp(1j*(mvalue)*phi);
              Iqsum(iq,iphi,im)=rhoM(iq,im).*expm(im,iphi); 
      end
  end    
end
rhoPolar=sum(Iqsum,3);
rhoPolar=squeeze(rhoPolar);
end