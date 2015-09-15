function rholm=Amtorhom(Alm,dq,dr,spbs)
lmax=size(Alm,2)-1; 
larray=0:lmax; 
lsize=size(Alm,2);
msize=size(Alm,3); 
nringsq=size(Alm,1);
qsize=size(Alm,1); 

rsize=size(spbs,2); 
%expand r^2
qsqr=0:(nringsq-1);
qsqr=qsqr'; % column array
qsqr=qsqr*dq;
qsqr=qsqr.*qsqr;
qsqr=repmat(qsqr,[1 lsize msize]); 

%jarray
jarray=(j).^larray; 
jarray=jarray';
jarray=repmat(jarray,[1 qsize msize]);
jarray=permute(jarray,[2 1 3]); 

Alm=Alm.*qsqr.*jarray;

%bess array expand
bessexp=repmat(spbs,[1 1 1 msize]);

%rhoLM expanded
Alm=repmat(Alm,[1 1 1 rsize]); 
Alm=permute(Alm,[1 4 2 3]); 

%disp('here') 
rholm=Alm.*bessexp; 
rholm=(2*sum(rholm,1)-(rholm(1,:,:,:)+rholm(qsize,:,:,:)))*4*pi*dq/2; %trapezoid rule
rholm=squeeze(rholm); 

%for ir=1:nrings
    %%fprintf('%d \n',iq)
    %for l=0:lmax
    %for m=-l:l
        %temp=zeros(nringsq,1);
        %tempx=zeros(nringsq,1);
        %for iq=1:nringsq
            %r=(ir-1)*dr;
            %q=(iq-1)*dq;
            %temp(iq)=4*pi*Alm(iq,l+1,l+m+1)*spbs(l,q*r*2*pi)*(j)^larray(l+1)*q^2;
            %tempx(iq)=q; 
        %end
        %rholm(ir,l+1,m+l+1)=trapz(tempx,temp);
    %end
    %end
%end
%rholm=rholm*dq; 
end
