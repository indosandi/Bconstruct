param3

ncycle=20;
nHIO=10;
nER=10;
nSupport=1;
beta=.9;

expm=matf('expm.mat');
expmn=matf('expmn.mat');
bess=matf('bessarrdouble.mat');

lowerbound=0.01;
upperbound=0.95;

%-------initial guess--------
% rndPhase = 2*pi*rand(size(amplitude));
rhos = matf('rhocircle.mat');%real(ifftn(amplitude.*exp(1i*rndPhase)));
% randNumber=(rand(size(rhos))-0.5)./2;
% rhos=rhos+randNumber;

%-----------------------------
radsupport=28;  % where support
for iq=1:radsupport
%     rhos(iq,:)=round(rand(1,360));
    rhos(iq,:)=rand(1,360);
end
polplot(rhos)
pause
B=matf('Bshapepolar.mat');


supInit = ones(size(rhos));
support = supInit;

support(radsupport:size(rhos,1),:)=0; % where support fixed

nrings=size(rhos,1);
rmax=(nrings-1)*dr;
qmax=(nrings-1)*dq;

rhoinit   = zeros(size(rhos));
rhomodif = zeros(size(rhos));
rhomodif = rhos;
rhoout = zeros(size(rhos));

%---------------------iteration start here------------
for icycle=1:ncycle
    %HIO
    for iter=1:nHIO
        fprintf('%d %d HIO \n',icycle,iter);
        rhoinit =  rhomodif;
%         rhop = polfft(rhoinit,dr,dq,mmax,nphi,bess,expm,expmn);
        rhop = polfftB(rhoinit,dr,dq,mmax,nphi,bess,expm,expmn,B);

%         phiphase = atan2(imag(rhop),real(rhop));
%         amplitudeSub = amplitude; 
%         rhoout = polifft(amplitudeSub.*exp(1i.*phiphase),dr,dq,mmax,nphi,bess,expm,expmn);
        rhoout =polifft(rhop,dr,dq,mmax,nphi,bess,expm,expmn);
        rhoout = real(rhoout);

        %HIO
        rhomodif = support.*rhoout + (1-support).*(rhoinit-beta*rhoout);
        mean(rhomodif(:));
        if mean(rhomodif(:)) < 0
            rhomodif = -rhomodif;
%             disp('flip all'); 
        end
        rho = (rhomodif);
        rhomodif=bound(rhomodif,lowerbound,upperbound); % lower and upper boundary
        polplot(rhoout)
    drawnow;  
    end
    for iter=1:nER
        fprintf('%d %d ER \n',icycle,iter);
        rhoinit =  rhomodif;
%         rhop = polfft(rhoinit,dr,dq,mmax,nphi,bess,expm,expmn);
        rhop = polfftB(rhoinit,dr,dq,mmax,nphi,bess,expm,expmn,B);
%         phiphase = atan2(imag(rhop),real(rhop));
%         amplitudeSub = amplitude; 
%         rhoout = polifft(amplitudeSub.*exp(1i.*phiphase),dr,dq,mmax,nphi,bess,expm,expmn);
        rhoout =polifft(rhop,dr,dq,mmax,nphi,bess,expm,expmn);
        rhoout = real(rhoout);

        %ER
        rhomodif = support.*rhoout + (1-support).*(rhoinit-beta*rhoout);
        mean(rhomodif(:));
        if mean(rhomodif(:)) < 0
            rhomodif = -rhomodif;
%             disp('flip all'); 
        end
        rho = (rhomodif);
        rhomodif=bound(rhomodif,lowerbound,upperbound); % lower and upper boundary
        polplot(rhoout)
    drawnow;  
    end
%     gconv = imfilter(rhomodif,fspecial('gaussian', gaussPixelSize, sigGauss)); 
%     support = rhomodif > 1*Eps;
%     support = rho > 0;
%     support = support.*supInit;  
%     Eps=std(rhoout(:));
%     F_true = abs(amplitudeSub);
%     F = abs(rhop);
%     R = sum((F_true-F).^2)/sum(F_true.^2);
%     fprintf('iter=%d R=%f \n',icycle,R); 
%     imagesc(rho);
    polplot(rhoout)
    drawnow;  
end
