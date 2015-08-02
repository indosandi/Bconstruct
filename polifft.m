function out=polfft(Ampol,dr,dq,mmax,nphi,bess,expm,expmn)
Amq=poldecom(Ampol,mmax,expmn);
% Amq= rhoMtoAm(Rmq,dr,bess);
Rmqnew=AmtorhoM(Amq,dq,bess);
out=comppol(Rmqnew,nphi,expm);
end