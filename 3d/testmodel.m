nx=61;
% lmax=20;
% nrho=20; 
% rholm=zeros(nrho,lmax+1,2*lmax+1); 
% for irho=1:nrho
% for il=0:lmax
% for im=-il:il
%     if(il==0 && im==0); 
%     rholm(irho,il+1,im+il+1)=1; 
%     end
% end
% end
% end
% save('testrho.mat','rholm') 
% gatemp(); 
aq=matf('rhosphere61.mat'); 
aq(isnan(aq))=0;
aq=real(aq);

%long block
half=floor(nx/2)+1
longx=3;
longy=3;
longz=8;
shiftx=-6;
aq(half-longx+shiftx:half+longx+shiftx,half-longy:half+longy,half-longz:half+longz)=0;

%small block
longx=3;
longy=3;
longz=3;
shiftx=+5;
shiftz=+6;

aq(half-longx+shiftx:half+longx+shiftx,half-longy:...
    half+longy,half-longz+shiftz:half+longz+shiftz)=0;

%radius
rad=5;
shiftx=+5;
shiftz=-6;
shifty=0;
for ii=1:nx
    for ij=1:nx
        for iz=1:nx
            posx=ii-half;
            posy=ij-half;
            posz=iz-half;
            dist=(((posx-shiftx)^2+(posy-shifty)^2+(posz-shiftz)^2)^(0.5));
            if(dist<=rad)
                aq(ii,ij,iz)=0;
            end
        end
    end
end
save('rhomodel.mat','aq');
close
plot3d2(aq,0.2)
pause
imagesc(squeeze(aq(:,31,:)));


