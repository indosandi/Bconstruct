function Ilmout=projB(Bexp,Ilm)
lmax=size(Ilm,2)-1;
nq=size(Ilm,1); 
Bnew=real(ilmtoB(Ilm)); 

for iq=1:nq
    for l=0:lmax
    Ilmout(iq,l+1,:)=Ilm(iq,l+1,:).*sqrt(Bexp(iq,iq,l+1))./sqrt(Bnew(iq,iq,l+1))
end
end

end
