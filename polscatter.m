clear; 
nrings=54;
dr=1;
nphi=360;
dphi=2*pi/nphi;
n=0;
rhoPolar=matf('tools/shapepolar.mat'); 
rhoarray=zeros(nrings,nphi); 
rhoGauss=zeros(nrings,nrings,nphi); 
center=[0 0]
rad=floor(nrings/8);

%for gaussian
sigma=rad./2;
for ixrgauss=1:nrings
    fprintf('%d \n ',ixrgauss); 
    xrgauss=(ixrgauss-1)*dr;
    yrgauss=center(2); % equal to zero 
for ir=1:nrings
    for iphi=1:nphi
        n=n+1;
        r=(ir-1)*dr;
        phi=(iphi-1)*dphi;
        xr(n)=r*cos(phi);
        yr(n)=r*sin(phi);
        rcalc=((xr(n)-xrgauss).^2+(yr(n)-yrgauss).^2).^(0.5); 
        if(rcalc<rad)
            rhoGauss(ixrgauss,ir,iphi)=normpdf(rcalc,0,sigma);
            rhoarray(ir,iphi)=1;
            rhoPolar(ir,iphi)=5; 
            x(n)=r*cos(phi);
            y(n)=r*sin(phi);
        end
    end
end
end
%size(x)
%scatter(xr,yr); 
%hold on;
%scatter(x,y,'filled');
%poscircle=[center(1)-rad center(2)-rad 2*rad 2*rad] 
%rectangle('Position',poscircle,'Curvature',[1 1])
%axis equal
save('rhoGauss.mat','rhoGauss'); 
