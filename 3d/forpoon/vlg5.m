function [vlp,r]=vlg5()
	
     lmax=headg('lmax');
     [vgauss,wt]=gaussp(lmax);
     ngpts=numel(wt)
	 alm_sph=matf(headg('nameiag'));    
     
  xg = vgauss(1,:);
  yg = vgauss(2,:);
  zg = vgauss(3,:);
  [phi,theta,r] = cart2sph(xg,yg,zg);
  theta = pi/2.0-theta;
  
  nq=headg('ndqsph');
  clm = zeros(nq,lmax+1,2*lmax+1);
  ylm = zeros(ngpts,1);
  Iq_save = zeros(ngpts,1);
  for iq = 1:nq
      Iq_save(:) = alm_sph(iq,:);
    for l = 0:lmax
      for m = -l:l
        ylm = compute_ylm(l,m,theta,phi);
        ylm = conj(ylm);
        s = zeros(ngpts,1);
        s = Iq_save.*wt.*transpose(ylm);
        clm(iq,l+1,m+l+1)=clm(iq,l+1,m+l+1)+sum(s);
      end
    end
    disp(iq);
  end
  save(headg('nameilm'),'clm');
    
