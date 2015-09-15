function aq=polfft(rhog,lmax,dr,dq)
%this function do fft in polar in gaussian coordinate
    rholm=vlg5(rhog,lmax); 
    Alm=rhoMtoAmnoBess(rholm,dr,dq); 
    %save('almint.mat','Alm'); 
    aq=Aqg(Alm,dq); 
end
