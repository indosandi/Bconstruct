function aq=polfft(rhog,lmax,dr,dq,spbs,ylm,wt)
%this function do fft in polar in gaussian coordinate
    rholm=vlg5D(rhog,lmax,ylm,wt); 
    Alm=rhoMtoAmspbs(rholm,dr,dq,spbs); 
    aq=AqgV(Alm,dq,ylm); 
end
