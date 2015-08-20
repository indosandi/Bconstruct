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
      
      ylmrep=repmat(ylm,[1 1 1 nq]);
      ylmrep=permute(ylmrep,[4 1 2 3]);
      clear ylm
      
%       size(ylmrep)
      wtrep=repmat(wt,[1 nq]);
      wtrep=permute(wtrep,[2 1]);
      clear wt
%       size(wtrep)
      
%   for iq = 1:nq
%       Iq_save(:) = alm_sph(iq,:);
%       size(Iq_save)
      Iq_save=alm_sph.*wtrep;
%         size(Iq_save)
      
      Iqrep=repmat(Iq_save,[1 1 lmax+1 2*lmax+1]);
      clear Iq_save
%       size(Iqrep)
        
      Iqrep=permute(Iqrep,[1 3 4 2]);
%       size(Iqrep)
        
      Iqtotal=Iqrep.*ylmrep;
%       size(Iqtotal)
        
      Iqsum=sum(Iqtotal,4);
%       size(Iqsum)
%         toc
%         pause
%       clm(iq,:,:)=Iqsum(:,:);  
%   end
%   save('rholm.mat','Iqsum');

