rhoPolar=matf('tools/shapepolar.mat'); 
nrings=size(rhoPolar,1);
nPhi=size(rhoPolar,2); 
dphi=2*pi/nPhi; 
dr=1; 

n=0; 
scatPol=[];
xpc=[];
ypc=[]; 

gaussPixelSize=10; 
sigGauss=5; 
eps=0; 
n=0; 
for iq=1:nrings
    r=(iq-1)*dr; 
    for iphi=1:nPhi
        n=n+1; 
        phi=(iphi-1)*dphi; 
        %xpc(n)=(iq-1).*cos(phi);
        %ypc(n)=(iq-1).*sin(phi);
        if(iq~=1 || (iq==1 && n==1) )
        xpc=[xpc (iq-1).*cos(phi)]; 
        ypc=[ypc (iq-1).*sin(phi)]; 
        scatPol=[scatPol rhoPolar(iq,iphi)] ; %avoid duplicate zero
        end
        %scatPol(n)=rhoPolar(iq,iphi); 
    end
end
size(xpc)
size(ypc)
size(scatPol)
[xc,yc] = meshgrid(-(nrings-1):dr:(nrings-1),-(nrings-1):dr:(nrings-1));
tic; 
Iqx = griddata(xpc,ypc,scatPol,xc,yc,'cubic');
toc; 
Iqx(isnan(Iqx))=0;
Iqx(Iqx<0)=0;
size(Iqx) 
imagesc(Iqx) 
tic;
rhoConv = imfilter(Iqx,fspecial('gaussian', gaussPixelSize, sigGauss));
toc; 
%pause
%cart to pol
drcart=1; 
halfSizeXY=nrings-1;
[xq,yq]= meshgrid(-halfSizeXY:drcart:halfSizeXY,-halfSizeXY:drcart:halfSizeXY); 
[phi,q]=meshgrid(0:dphi:2*pi-dphi,0:dr:(nrings-1)*dr);
xp=q.*cos(phi);
yp=q.*sin(phi);
tic;
polBack=interp2(xq,yq,Iqx,xp,yp,'spline');
toc; 
