function Amq=rhoMtoAm(rhoM,dr,bess)
mmax=(size(rhoM,2)-1)/2;
marray=-mmax:mmax;
msize=numel(marray);

nrings=size(rhoM,1);


%Provide nringsr x msize array r value
r=0:(nrings-1);
r=r*dr;
r=r';
r=repmat(r,1,msize);

%get temporary multiplication
rrhoM=2*pi*r.*rhoM;

%provide nrings x msize array of mvalue
amrr=j.^marray;
amrr=repmat(amrr,[nrings 1]);

%temporary multiplication
rrhoM=rrhoM.*amrr;

% swap dimension to get consistency
% with dimension of bessel array
rrhoM=repmat(rrhoM,[1 1 nrings]);
rrhoM=permute(rrhoM,[3 1 2]);

% multiply all value to bessel array
%2*pi*r*rhoM(ir,im)*bess(iq,ir,im)*(j)^marray(im);
%-----------------------
Amqsum2=rrhoM.*bess;

%swap dimension into iqximxir
%not really important as long as consistent with sum/integration
Amqsum2=permute(Amqsum2,[1 3 2]);


% for iq=1:nrings
%     fprintf('%d \n',iq)
%     for im=1:numel(marray)
%         temp=0;
%         for ir=1:nrings
%             r=(ir-1)*dr;
%             q=(iq-1)*dq;
%             temp=temp+ rhoM(ir,im)*bess(iq,ir,im)*(j)^marray(im);
%          Amqsum(iq,im,ir)=2*pi*r*rhoM(ir,im)*bess(iq,ir,im)*(j)^marray(im);
%          if (iq==10 && ir==10 && im==22)
%              disp((j)^marray(im))
%             disp(rhoM(ir,im))
%             disp(2*pi*r*rhoM(ir,im)*(j)^marray(im))
%             disp(bess(iq,ir,im))
%             pause
%          end
%             temp=temp+2*pi*r*rhoM(ir,im)*bess(iq,ir,im)*(j)^marray(im);
%         end
%         Amq(iq,im)=temp;
%     end
% end
% save('Amqsumeraseme.mat','Amqsum');
% do sum/integration of ir index
Amq=sum(Amqsum2,3); %3 for sum/integration ir
Amq=squeeze(Amq); % remove singleton
Amq=Amq*dr; %multiply factor dr since it is integration
% Amqvec=temp.*temp2;
% Amqvec=sum(bess.*temp2,1);
% Amqvec=squeeze(Amqvec);
% Amqvec=Amq*dr;
% Amqsum(7:9,10,22)
% Amqsum2(7:9,10,22)
% R(Amqsum,Amqsum2)
% save('Amq.mat','Amq');
end