nphi=360;
nrings=55; 
dphi=2.0*pi/(nphi);

% oned=257; 
% aq=matf('aqkchannel.mat'); 
% aq=reshape(aq,oned,oned,oned); 
% aq2d(1:oned,1:oned)=aq(:,:,floor(oned/2)+1); 
% clear aq
size=109;
rho=matf('rhokchannelprojG_red.mat'); 
rho2=zeros(size,size);
rho2(55-27:55+27,55-27:55+27)=rho(:,:);
imagesc(abs(rho2))
pause
Aq=fftshift(fft2(rho2));
imagesc(abs(Aq));
pause
Iq=(abs(Aq).^2);
imagesc(Iq);
pause
sizeXY=size;
% sizeXY=size(aq2d,1);
halfSizeXY=floor(sizeXY/2);
disp(halfSizeXY); 
[xq,yq]= meshgrid(-halfSizeXY:halfSizeXY,-halfSizeXY:halfSizeXY); 

qmax=halfSizeXY;
dq=qmax/(nrings-1);
[phi,q]=meshgrid(0:dphi:2*pi-dphi,0:dq:qmax);
xp=q.*cos(phi);
yp=q.*sin(phi);

Iqpolar=interp2(xq,yq,Iq,xp,yp,'spline');
save('kchannelIq_pol.mat','Iqpolar'); 

