function rholm=Amtorhom(Alm,dq,dr,nr)
lmax=size(Alm,2)-1; 
larray=0:lmax; 

nringsq=size(Alm,1);
if(nargin==3)
    nrings=nringsq; 
else
    nrings=nr; 
end

for ir=1:nrings
    %fprintf('%d \n',iq)
    for l=0:lmax
    for m=-l:l
        temp=zeros(nringsq,1);
        tempx=zeros(nringsq,1);
        for iq=1:nringsq
            r=(ir-1)*dr;
            q=(iq-1)*dq;
            temp(iq)=4*pi*Alm(iq,l+1,l+m+1)*spbs(l,q*r*2*pi)*(j)^larray(l+1)*q^2;
            tempx(iq)=q; 
        end
        rholm(ir,l+1,m+l+1)=trapz(tempx,temp);
    end
    end
end
%rholm=rholm*dq; 
end
