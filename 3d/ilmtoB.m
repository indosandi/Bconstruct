function B=ilmtoB(Ilm)
nq=size(Ilm,1);
lmax=size(Ilm,2)-1;

for iq=1:nq
    for iq2=1:nq
        for l=0:lmax
            temp=0;
            for m=-l:l
                temp=temp+Ilm(iq,l+1,m+l+1).*conj(Ilm(iq,l+1,m+l+1)); 
            end
            B(iq,iq2,l+1)=temp;
        end
    end
end
end
