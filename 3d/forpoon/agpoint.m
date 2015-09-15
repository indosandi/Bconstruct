function myfft()

s=headg('namerhodata');

dimx=headg('dimx');
dx=headg('dx');
%dia=dimx*dx;
%res=dx;

%qmax=1./res;
%dq=1./dia
cartgpoint()
%dimq=2*(floor(qmax/(2*dq)))+1;
nqmax=headg('ndqsph');
ngauss=headg('ngauss');
load gpoint.mat

ctrx=floor(dimx/2)
%ctrq=floor(dimq/2)
aq(1:nqmax,1:ngauss)=0;
for nq=1:nqmax
     fprintf('%d \n',nq);
    for nqg=1:ngauss


        qx=qxg(nq,nqg);
        qy=qyg(nq,nqg);
        qz=qzg(nq,nqg);
        
    for ix=0:dimx-1
    for iy=0:dimx-1
    for iz=0:dimx-1
        
        xx=(ix-ctrx)*dx;
        yy=(iy-ctrx)*dx;
        zz=(iz-ctrx)*dx;
        
        
        
        qdotr=exp(-2.*pi.*j.*(qx*xx+qy*yy+qz*zz));
        aq(nq,nqg)=aq(nq,nqg)+s(ix+1,iy+1,iz+1)*qdotr;
    end
    end
    end
    %disp(aq(nq,nqg));
    %pause
    end
end
iaq=abs(aq).^2;
save(headg('nameag'),'aq');
save(headg('nameiag'),'iaq');
% vlg5()
