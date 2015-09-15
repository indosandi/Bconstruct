function ga(tipe)
	
    alm=matf('Almq.mat');
    lico=[0:20]; 
    aq=output(alm,lico,1); 
    nameorig='Aqtest';
    name=strcat(nameorig,'z','.mat'); 
    save(name,'aq'); 
    aq=output(alm,lico,2); 
    name=strcat(nameorig,'y','.mat'); 
    save(name,'aq'); 
    aq=output(alm,lico,3); 
    name=strcat(nameorig,'x','.mat'); 
    save(name,'aq'); 

end
function aq=output(alm,lico,tipe); 
    Nq=size(alm,1);
    dq=1;
    qgrid=0:dq:(Nq-1)*dq;
	
    N=Nq;
    if(tipe==1)
    qqx=-N*dq:dq:N*dq;
    qqy=-N*dq:dq:N*dq;
    qqz=0;
    elseif(tipe==2)
    qqx=-N*dq:dq:N*dq;
    qqy=0; 
    qqz=-N*dq:dq:N*dq;
    elseif(tipe==3)
    qqx=0; 
    qqy=-N*dq:dq:N*dq;
    qqz=-N*dq:dq:N*dq;
    end
        
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
    
    %filling almgrid
    for il=1:length(lico)
        l=lico(il);
		for m=-l:l
		almgrid=alm(:,l+1,m+l+1);
		almp=interp1(qgrid,almgrid,qqr);
        almp2(l+1,m+l+1,:)=almp;
		end
    end
    
    %filling ylm
    for il=1:length(lico)
        l=lico(il)
		for m=-l:l
           ylmsave(l+1,m+l+1,:)=compute_ylm(l,m,pi/2.-theta,phi);
        end 
    end
    %save('eraseme.mat','ylmsave')
    %pause
    
    
    
    nind=0;
	for ii=1:length(qqx)
	for ij=1:length(qqy)
	for ik=1:length(qqz)
        nind=nind+1
        swap=almp2(:,:,nind).*ylmsave(:,:,nind);
        swap=reshape(swap,[],1);
	aq(ii,ij,ik)=sum(swap);
    
    end
    end
    end
    aq(isnan(aq))=0; 
end
    %save('rhotest.mat','aq');
