function Amq=rhoMtoAm(rhoM,dr,bess)
mmax=(size(rhoM,2)-1)/2;
marray=-mmax:mmax;
nphi=size(rhoM,2);
nrings=size(rhoM,1);
% dphi=2*pi/nphi;
% bess=matf('bessarr.mat');
Amq=zeros(nrings,numel(marray));

for iq=1:nrings
%     fprintf('%d \n',iq)
    for im=1:numel(marray)
        temp=0;
        for ir=1:nrings
            r=(ir-1)*dr;
%             q=(iq-1)*dq;
%             temp=temp+ rhoM(ir,im)*bess(iq,ir,im)*(j)^marray(im);
            temp=temp+2*pi*r*rhoM(ir,im)*bess(iq,ir,im)*(j)^marray(im);
        end
        Amq(iq,im)=temp;
    end
end
Amq=Amq*dr;
% save('Amq.mat','Amq');
end