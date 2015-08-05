function rhoPolBack=appsrwap(rhoPolar,xpc,ypc,xc,yc,xq,yq,xp,yp,dr,sigGauss,gaussPix)
nrings=size(rhoPolar,1);
nPhi=size(rhoPolar,2); 
dphi=2*pi/nPhi; 
scatPol=[]; 
n=0;
for iq=1:nrings
    r=(iq-1)*dr; 
    for iphi=1:nPhi
        n=n+1; 
        phi=(iphi-1)*dphi; 
        if(iq~=1 || (iq==1 && n==1) )
        scatPol=[scatPol rhoPolar(iq,iphi)] ; %avoid duplicate zero
        end
    end
end
%size(xc)
%size(scatPol) 
%[xc,yc] = meshgrid(-(nrings-1):dr:(nrings-1),-(nrings-1):dr:(nrings-1));
rhoCart = griddata(xpc,ypc,scatPol,xc,yc,'cubic');
rhoCart(isnan(rhoCart))=0;
rhoConv = imfilter(rhoCart,fspecial('gaussian', gaussPix, sigGauss));
rhoPolBack=interp2(xq,yq,rhoConv,xp,yp,'spline');
end
