function Almq=rhoMtoAM(rhoLM,dr,dq,spbs,nq)
lmax=size(rhoLM,2)-1; 
larray=0:lmax; 

nrings=size(rhoLM,1);
if (nargin==4)
    nringsq=nrings; 
else
    nringsq=nq; 
end

for iq=1:nringsq
    for l=0:lmax
    for m=-l:l
        temp=zeros(nrings,1);
        tempx=zeros(nrings,1);
        for ir=1:nrings
            r=(ir-1)*dr;
            q=(iq-1)*dq;
            temp(ir)=4*pi*rhoLM(ir,l+1,l+m+1)*spbs(iq,ir,l+1)*(-j)^larray(l+1)*r^2;
            tempx(ir)=r; 
        end
        Almq(iq,l+1,m+l+1)=trapz(tempx,temp);
    end
    end
end

end
