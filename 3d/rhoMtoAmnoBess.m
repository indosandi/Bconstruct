function Almq=rhoMtoAm(rhoLM,dr,dq)
lmax=size(rhoLM,2)-1; 
larray=0:lmax; 

nrings=size(rhoLM,1);
nringsq=nrings; 

for iq=1:nringsq
    %fprintf('%d \n',iq)
    for l=0:lmax
    for m=-l:l
        temp=zeros(nrings,1);
        tempx=zeros(nrings,1);
        for ir=1:nrings
            r=(ir-1)*dr;
            q=(iq-1)*dq;
            temp(ir)=4*pi*rhoLM(ir,l+1,l+m+1)*spbs(l,q*r*2*pi)*(-j)^larray(l+1)*r^2;
            tempx(ir)=r; 
        end
        Almq(iq,l+1,m+l+1)=trapz(tempx,temp);
    end
    end
end
Almq=Almq*dr; 
end
