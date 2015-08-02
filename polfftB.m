function out=polfft(rhoin,dr,dq,mmax,nphi,bess,expm,expmn,B)
Rmq=poldecom(rhoin,mmax,expmn);
Amq= rhoMtoAm(Rmq,dr,bess);
% Rmqnew=AmtorhoM(Amq,dq,bess);
Aq=comppol(Amq,nphi,expm);
phiphase = atan2(imag(Aq),real(Aq));
Inten=abs(Aq).^2;
Imq=poldecom(Inten,mmax,expmn);
% size(Imq)
% size(B)
indzero=abs(Imq)<10^(-8); %zero
% indzero
Imqnew=Imq.*sqrt(B)./abs(Imq);

Imqnew(indzero)=sqrt(B(indzero));
% Bnew=abs(Imqnew).^2;
% RfactorB=R(B,Bnew);
% fprintf('%f %f \n',Imq(2,21),sqrt(B(2,21)),);
Iq=comppol(Imqnew,nphi,expm);
Iq=real(Iq);
Iq(Iq<0)=0;
out=sqrt(Iq).*exp(1i.*phiphase);
end