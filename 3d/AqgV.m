function aq=Aqg(Alm,dq,ylmsave)
%Alm=matf('Almq.mat') 
lmax=size(Alm,2)-1;
larray=0:lmax; 
nq=size(Alm,1); 
%dq=1./40.;

%[vgauss,wt]=gaussp(lmax); 
%ngauss=numel(wt); 
%[phi_g,theta_g,rr]=cart2sph(vgauss(1,:),vgauss(2,:),vgauss(3,:));
%qval=0.*dq:dq:(nq-1)*dq;

%for il=1:length(larray)
    %l=larray(il);
    %for m=-l:l
       %ylmsave(l+1,m+l+1,:)=compute_ylm(l,m,pi/2.-theta_g,phi_g);
    %end 
%end
%ylm is conj of ylm, defined in initvalue.m
ngauss=size(ylmsave,3); 
ylmsave=conj(ylmsave); 
%Alm2=repmat(Alm,[1 1 1 ngauss]);
%ylmsave2=repmat(ylmsave,[1 1 1 nq]); 
%%size(Alm)
%%size(ylmsave) 
%ylmsave=permute(ylmsave,[4 3 2 1]);
%Alm=permute(Alm,[1 4 3 2]); 
%%size(ylmsave)
%%size(Alm)
%aq=Alm.*ylmsave;
%clear Alm;
%clear ylmsave
%%size(aq)
%aq=reshape(aq,[31,ngauss, 21*41]); 
%%size(aq)
%aq=sum(aq,3);
%aq=squeeze(aq); 
%size(aq)
%pause
aq=zeros(nq,ngauss); 
lsize=size(Alm,2);
msize=size(Alm,3); 
for iq=1:nq
    %disp(iq) 
    %for ing=1:ngauss
    Almsave(:,:)=Alm(iq,:,:); 
    Almrep=repmat(Almsave,[1 1 ngauss]); 
    Almrep=Almrep.*ylmsave; 
    Almrep=reshape(Almrep,[lsize*msize ,ngauss]);
    aq(iq,:)=squeeze(sum(Almrep,1)); 
        %temp=squeeze(Alm(iq,:,:)).*ylmsave(:,:,ing);
        %temp=reshape(temp,[],1); 
        %aq(iq,ing)=sum(temp); 
    %end
%end
end
%save('Aqg.mat','aq') 
%Iqg=abs(aq).^2;
%save('Iqg.mat','Iqg') 
%Ilm=vlg5(Iqg,20); 
%save('Imqcalc.mat','Ilm') 
%Bnew=ilmtoB(Ilm); 
%for iq=1:nq
    %for l=0:lmax
%Ilmnew(iq,l+1,:)=Ilm(iq,l+1,:).*sqrt(Bexp(iq,iq,l+1))./sqrt(Bnew(iq,iq,l+1))
%end
%end

