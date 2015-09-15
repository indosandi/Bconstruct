function fdisplay(rhos,iter,ndisplay,lmax,ylm,wt)
if(mod(iter,ndisplay)==0)
    rholm=vlg5D(rhos,lmax,ylm,wt); 
    aq=gatemp(rholm,2); 
    imagesc(real(squeeze(aq)));
    drawnow;
end
end
