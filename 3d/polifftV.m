function rhog=polifft(aqg,lmax,dq,dr,spbs,ylm,wt)
    Alm=vlg5D(aqg,lmax,ylm,wt); 
    rhoLm=AmtorhoMspbs(Alm,dq,dr,spbs);
    %save('rhoagain.mat','rhoLm'); 
    rhog=AqgV(rhoLm,dr,ylm); 
end
