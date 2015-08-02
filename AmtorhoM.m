function Rmq=AmtorhoM(Amq,dq,bess)
mmax=(size(Amq,2)-1)/2;
marray=-mmax:mmax;
nphi=size(Amq,2);
nrings=size(Amq,1);
% dphi=2*pi/nphi;
% bess=matf('bessarr.mat');
Rmq=zeros(nrings,numel(marray));

for ir=1:nrings
%     fprintf('%d \n',iq)
    for im=1:numel(marray)
        temp=0;
        for iq=1:nrings
            q=(iq-1)*dq;
%          temp=temp+ rhoM(ir,im)*bess(iq,ir,im)*(j)^marray(im);
            temp=temp+2*pi *q*Amq(iq,im)*bess(iq,ir,im)*(-j)^marray(im);
        end
        Rmq(ir,im)=temp;
    end
end
Rmq=Rmq*dq;
% save('Amq.mat','Amq');
end