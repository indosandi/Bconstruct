function rhog=polifft(aqg,lmax,dq,dr,spbs,ylm,wt)
    Alm=vlg5D(aqg,lmax,ylm,wt); 
    rhoLm=AmtorhoMnoBess(Alm,dr,dq);
    rhog=Aqg(rhoLm,dr); 
end
