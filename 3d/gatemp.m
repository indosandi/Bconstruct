function ga(alm,ylmsave,larray,qgrid,qqr,len3dpoint)
	
%     lmax=20;
%     lico=0:lmax;
%     alm=matf('rholm.mat');
%     lico=[0:lmax]
%     Nq=headg('ndqsph');
%     dq=headg('dqsph');
% 	qgrid=0:dq:(Nq-1)*dq;
	
%     N=Nq-1;;
%     dq=headg('dqsph');
%     qqx=-N*dq:dq:N*dq;
% 	qqy=-N*dq:dq:N*dq;
% 	qqz=-N*dq:dq:N*dq;
    
    %make one indeks
%     nind=0;
%     for ii=1:length(qqx)
%      for ij=1:length(qqy)
%       for ik=1:length(qqz)
%         nind=nind+1;
%         qx(nind)=qqx(ii);
%         qy(nind)=qqy(ij);
%         qz(nind)=qqz(ik);
%     end  
%     end   
%     end
    
%     [phi,theta,qqr]=cart2sph(qx,qy,qz);
    
    %filling almgrid
    for il=1:length(larray)
        l=larray(il);
		for m=-l:l
		almgrid=alm(:,l+1,m+l+1);
		almp=interp1(qgrid,almgrid,qqr);
        almp2(l+1,m+l+1,:)=almp;
		end
    end
    
    %filling ylm
%     for il=1:length(lico)
%         l=lico(il)
% 		for m=-l:l
%            ylmsave(l+1,m+l+1,:)=compute_ylm(l,m,pi/2.-theta,phi);
%         end 
%     end
%     save('eraseme.mat','ylmsave')
%     pause
    
    disp('calculate point')
    nind=0;
	for ii=1:len3dpoint
	for ij=1:len3dpoint
	for ik=1:len3dpoint
        nind=nind+1;
        swap=almp2(:,:,nind).*ylmsave(:,:,nind);
        swap=reshape(swap,[],1);
        aq(ii,ij,ik)=sum(swap);
    end
    end
    end
    
    
  
    aq(isnan(aq))=0;
    aq=real(aq); 
	
	save('test.mat','aq');
