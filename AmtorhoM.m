function Rmq=AmtorhoM(Amq,dq,bess)
mmax=(size(Amq,2)-1)/2;
marray=-mmax:mmax;
msize=numel(marray);

nrings=size(Amq,1);

%Provide nringsq x msize array q value
q=0:(nrings-1);
q=q*dq;
q=q';
q=repmat(q,1,msize);

%get temporary multiplication
qAmq=2*pi*q.*Amq;

%provide nrings x msize array of mvalue
amrr=(-j).^marray;
amrr=repmat(amrr,[nrings 1]);

%temporary multiplication
qAmq=qAmq.*amrr;

% swap dimension to get consistency
% with dimension of bessel array
qAmq=repmat(qAmq,[1 1 nrings]);
qAmq=permute(qAmq,[1 3 2]);

% multiply all value to bessel array
%2*pi *q*Amq(iq,im)*bess(iq,ir,im)*(-j)^marray(im);
%-----------------------
Rmqsum2=qAmq.*bess;

%swap dimension into irximxiq
%not really important as long as consistent with sum/integration
Rmqsum2=permute(Rmqsum2,[2 3 1]);

% Rmqsum=zeros(nrings,numel(marray),nrings);
% for ir=1:nrings
%     fprintf('%d \n',iq)
%     for im=1:numel(marray)
%         temp=0;
%         for iq=1:nrings
%             q=(iq-1)*dq;
%          temp=temp+ rhoM(ir,im)*bess(iq,ir,im)*(j)^marray(im);
%             temp=temp+2*pi *q*Amq(iq,im)*bess(iq,ir,im)*(-j)^marray(im);
%             Rmqsum(ir,im,iq)=2*pi *q*Amq(iq,im)*bess(iq,ir,im)*(-j)^marray(im);

%         end
%         Rmq(ir,im)=temp;
%     end
% end
% R(Rmqsum,Rmqsum2)
% Rmqsum(10,9,22)
% Rmqsum2(10,9,22)

% pause
Rmq=sum(Rmqsum2,3); % 3 is sum/integration of iq
Rmq=squeeze(Rmq);
Rmq=Rmq*dq;
% save('Amq.mat','Amq');
end