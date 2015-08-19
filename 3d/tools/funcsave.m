    lmax=20;
    lico=[0:lmax];
	
    N=20;
    dq=1;
    qqx=-N*dq:dq:N*dq;
	qqy=-N*dq:dq:N*dq;
	qqz=-N*dq:dq:N*dq;
%make one indeks
    nind=0;
    for ii=1:length(qqx)
     for ij=1:length(qqy)
      for ik=1:length(qqz)
        nind=nind+1;
        qx(nind)=qqx(ii);
        qy(nind)=qqy(ij);
        qz(nind)=qqz(ik);
    end  
    end   
    end
    
    [phi,theta,qqr]=cart2sph(qx,qy,qz);
    
    %filling ylm
    for il=1:length(lico)
        l=lico(il)
		for m=-l:l
           ylmsave(l+1,m+l+1,:)=compute_ylm(l,m,pi/2.-theta,phi);
        end 
    end
    save('ylmsave.mat','ylmsave');