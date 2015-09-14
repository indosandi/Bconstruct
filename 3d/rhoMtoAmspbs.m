function Almq=rhoMtoAM(rhoLM,dr,dq,spbs,nq)
lmax=size(rhoLM,2)-1; 
larray=0:lmax; 
lsize=size(rhoLM,2);
msize=size(rhoLM,3); 
rsize=size(rhoLM,1); 

nrings=size(rhoLM,1);
if (nargin==4)
    nringsq=nrings; 
else if(nargin==5)
    nringsq=nq; 
end
qsize=nringsq; 

%expand r^2
rsqr=0:(nrings-1);
rsqr=rsqr'; % column array
rsqr=rsqr*dr;
rsqr=rsqr.*rsqr;
rsqr=repmat(rsqr,[1 lsize msize]); 
%rsqr=repmat(rsqr,1,size(rhoLM,3)); 
size(rsqr)

%jarray
jarray=(-j).^larray; 
jarray=jarray';
jarray=repmat(jarray,[1 rsize msize]);
jarray=permute(jarray,[2 1 3]); 
size(jarray) 
%jarray(1:3,1,1)
%jarray(1,1:3,1)
%jarray(1,1,1:3)

%multiply rholm r and j
rhoLM=rhoLM.*rsqr.*jarray;
%size(rhoLM)

%bess array expand
bessexp=repmat(spbs,[1 1 1 msize]);
%size(bessexp)

%rhoLM expanded
rhoLM=repmat(rhoLM,[1 1 1 qsize]); 
rhoLM=permute(rhoLM,[4 1 2 3]); 
%size(rhoLM)

Almq=rhoLM.*bessexp; 
Almq=(2*sum(Almq,2)-(Almq(:,1,:,:)+Almq(:,rsize,:,:)))*4*pi*dr/2; %trapezoid rule
Almq=squeeze(Almq); 
%size(Almq); 
%pause

%for iq=1:nringsq
    %for l=0:lmax
    %for m=-l:l
        %temp=zeros(nrings,1);
        %tempx=zeros(nrings,1);
        %for ir=1:nrings
            %r=(ir-1)*dr;
            %q=(iq-1)*dq;
            %temp(ir)=4*pi*rhoLM(ir,l+1,l+m+1)*spbs(iq,ir,l+1)*(-j)^larray(l+1)*r^2;
            %tempx(ir)=r; 
        %end
        %Almq(iq,l+1,m+l+1)=trapz(tempx,temp);
    %end
    %end
%end

end
