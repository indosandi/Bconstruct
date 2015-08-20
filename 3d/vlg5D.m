function [vlp]=vlg5(alm_sph,lmax,ylm,wt)
	
%      lmax=headg('lmax');
%      [vgauss,wt]=gaussp(lmax);
%      ngpts=numel(wt)
% 	 alm_sph=matf();    
     
%   xg = vgauss(1,:);
%   yg = vgauss(2,:);
%   zg = vgauss(3,:);
%   [phi,theta,r] = cart2sph(xg,yg,zg);
%   theta = pi/2.0-theta;
%   
  nq=size(alm_sph,1);
  clm = zeros(nq,lmax+1,2*lmax+1);
%   ylm = zeros(ngpts,1);
  ngpts=size(alm_sph,2); 
  Iq_save = zeros(ngpts,1);
%   for iq = 1:1
%       Iq_save(:) = alm_sph(iq,:);
%     for l = 0:lmax
%       for m = -l:l
% %         ylm = compute_ylm(l,m,theta,phi);
% %         ylm = conj(ylm);
%         
%         s = zeros(ngpts,1);
% %         size(Iq_save)
% %         size(wt)
% %         size(squeeze(ylm(l+1,m+l+1,:)))
%         s = Iq_save.*wt.*(squeeze(ylm(l+1,m+l+1,:)));
%         clm(iq,l+1,m+l+1)=clm(iq,l+1,m+l+1)+sum(s);
%       end
%     end
%     disp(iq);
%   end
  for iq = 1:nq
      Iq_save(:) = alm_sph(iq,:);
%       size(Iq_save)
      Iq_save=Iq_save.*wt;
%         size(Iq_save)
%         pause
      Iqrep=repmat(Iq_save,[1 1 lmax+1 2*lmax+1]);
%       size(Iqrep)
      Iqrep=permute(Iqrep,[3 4 1 2]);
%       size(Iqrep)
      Iqtotal=Iqrep.*ylm;
%       size(Iqtotal)
      Iqsum=sum(Iqtotal,3);
%       size(Iqsum)
      clm(iq,:,:)=Iqsum(:,:);  
  end
  save('rholm.mat','clm');

