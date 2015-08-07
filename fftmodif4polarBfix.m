param3

ncycle=20;
nHIO=10;
nER=10;
nSupport=1;
beta=.9;

expm=matf('expm.mat');
expmn=matf('expmn.mat');
bess=matf('bessarrtest.mat');

lowerbound=0.0;
upperbound=1.0;

%-------initial guess--------
% rndPhase = 2*pi*rand(size(amplitude));
rhos = matf('tools/shapepolar.mat');%real(ifftn(amplitude.*exp(1i*rndPhase)));
% randNumber=(rand(size(rhos))-0.5)./2;
% rhos=rhos+randNumber;

%-----------------------------
radsupport=54;  % where support
for iq=1:28
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

%how many iter to display
ndisplay=10;
iterdisplay=0;

%---------for shrinkwrap----------
scatPol=[];
xpc=[];
ypc=[]; 

gaussPixelSize=10; 
sigGauss=10; 
eps=0; 
n=0; 
for iq=1:nrings
    r=(iq-1)*dr; 
    for iphi=1:nphi
        n=n+1; 
        phi=(iphi-1)*dphi; 
        if(iq~=1 || (iq==1 && n==1) )
        xpc=[xpc (iq-1).*cos(phi)]; 
        ypc=[ypc (iq-1).*sin(phi)]; 
        scatPol=[scatPol rhos(iq,iphi)] ; %avoid duplicate zero
        end
    end
end
[xc,yc] = meshgrid(-(nrings-1):dr:(nrings-1),-(nrings-1):dr:(nrings-1));
drcart=1; 
halfSizeXY=nrings-1;
[xq,yq]= meshgrid(-halfSizeXY:drcart:halfSizeXY,-halfSizeXY:drcart:halfSizeXY); 
[phi,q]=meshgrid(0:dphi:2*pi-dphi,0:dr:(nrings-1)*dr);
xp=q.*cos(phi);
yp=q.*sin(phi);

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
        eps=std(rhomodif(:)); 
%         eps=0; 
        support = appsrwap(rhomodif,xpc,ypc,xc,yc,xq,yq,xp,yp,dr,sigGauss,gaussPixelSize) > .5*eps;
        iterdisplay=iterdisplay+1;
        fdisplay(rhoout,iterdisplay,ndisplay);
%         polplot(rhoout)
%     drawnow;  
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

%         Eps = std(rhoout(:)); 
%         S1 = -2*((rhoout < Eps)-.5); 
%         rhomodif = S1.*rhoout;
        %ER
        rhomodif = support.*rhoout + (1-support).*(0);
%         rhomodif = support.*rhoout + (1-support).*(rhoinit-beta*rhoout);
%         mean(rhomodif(:));
%         if mean(rhomodif(:)) < 0
%             rhomodif = -rhomodif;
% %             disp('flip all'); 
%         end
        rho = (rhomodif);
        rhomodif=bound(rhomodif,lowerbound,upperbound); % lower and upper boundary
        eps=std(rhomodif(:));
%         eps=0; 
        support = appsrwap(rhomodif,xpc,ypc,xc,yc,xq,yq,xp,yp,dr,sigGauss,gaussPixelSize) > .5*eps;
        iterdisplay=iterdisplay+1;
        fdisplay(rhoout,iterdisplay,ndisplay);
%         polplot(rhoout)
%     drawnow;  
    end
        %eps=std(rhomodif(:)); 
        %support = appsrwap(rhomodif,xpc,ypc,xc,yc,xq,yq,xp,yp,dr,sigGauss,25) > 2*eps;
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
%     polplot(rhoout)
%     drawnow;  
end
