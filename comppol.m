function rhoPolar=comppol(rhoM,nphi,expm)
mmax=(size(rhoM,2)-1)/2;
marray=-mmax:mmax;
nrings=size(rhoM,1);
% dphi=2*pi/(nphi);
% phi=0:dphi:2*pi-dphi;
% rhoPolar=zeros(nrings,numel(marray));

rhoMrep=repmat(rhoM,[1 1 nphi]);

expmrep=repmat(expm,[1 1 nrings]);
expmrep=permute(expmrep,[3 1 2]);

rhoSum2=rhoMrep.*expmrep;
% rhoSum2=permute(rhoSum2,[1 3 2]);
% size(rhoMrep)
% size(expmrep)
% size(rhoSum2)
% pause


% for im=1:numel(marray) 
%     mvalue=marray(im);
%     for iphi=1:nphi
%         for iq=1:nrings
%             phi=(iphi-1)*dphi;
% %             Iqsum(iq,iphi,im)=rhoM(iq,im).*exp(1j*(mvalue)*phi);
%               Iqsum(iq,iphi,im)=rhoM(iq,im).*expm(im,iphi); 
%               
%       end
%   end    
% end
% size(Iqsum)
%  R(Iqsum,rhoSum2)
%  Iqsum(10,9:11,22)
% rhoSum2(10,9:11,22)
% pause
rhoPolar=sum(rhoSum2,2); % sum/integration of im
rhoPolar=squeeze(rhoPolar);
end