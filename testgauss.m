clear
rhos = matf('tools/shapepolar.mat');
rhoGauss=matf('rhoGauss.mat'); 
radsupport=54;  
for iq=1:radsupport
    %rhos(iq,:)=(iq-1).^2; 
    %rhos(iq,:)=rand(1,360);
end
polplot(rhos);
pause
nrings=size(rhos,1);
nphi=size(rhos,2); 

%conv
rhosconv=zeros(size(rhos)); 
gaussconv=zeros(size(rhos)); 

for ir=1:nrings
    %fprintf('%d / %d \n',ir,nrings); 
    gaussconv(1:nrings,1:nphi)=rhoGauss(ir,:,:); 
    polplot(rhosconv)
    drawnow;
    %size(gaussconv)
    %pause
    for iphi=1:nphi
        %size(gaussconv) 
        rhosconv(ir,iphi)=sum(sum(rhos.*gaussconv)); 
        %disp(rhosconv(ir,iphi)); 
    end
    %disp(rhosconv(ir,1)); 
end
polplot(rhosconv); 


