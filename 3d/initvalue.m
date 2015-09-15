clear
nrings=31;
dr=1;
rmax=(nrings-1)*dr;

dq=1/(60);
qmax=(nrings-1)*dq;



lmax=20;
larray=[0:lmax];
lenlarray=length(larray); 
Nq=nrings;
qgrid=0:dq:(Nq-1)*dq;

Nr=nrings;
rgrid=0:dr:(Nr-1)*dr; 

clus=1; 
N=Nq-1;
dqcart=clus*dq; 
qqx=-N*dq:dqcart:N*dq;
qqy=-N*dq:dqcart:N*dq;
qqz=-N*dq:dqcart:N*dq;
len3dqpoint=length(qqx)

N=Nr-1; 
drcart=clus*dr; 
rrx=-N*dr:drcart:N*dr;
rry=-N*dr:drcart:N*dr;
rrz=-N*dr:drcart:N*dr;
len3drpoint=length(rrx)

% make one indeks for r
 nind=0;
 for ii=1:length(rrx)
 for ij=1:length(rry)
 for ik=1:length(rrz)
     nind=nind+1;
     rx(nind)=rrx(ii);
     ry(nind)=rry(ij);
     rz(nind)=rrz(ik);
 end  
 end   
 end  
 
 [phi,theta,rrr]=cart2sph(rx,ry,rz);

% make one indeks for q
 nind=0;
 for ii=1:length(qqx)
 for ij=1:length(qqy)
 for ik=1:length(qqz)
     nind=nind+1
     qx(nind)=qqx(ii);
     qy(nind)=qqy(ij);
     qz(nind)=qqz(ik);
 end  
 end   
 end  
size(qx) 
 [phi,theta,qqr]=cart2sph(qx,qy,qz);
 
 %filling ylm
for il=1:length(larray)
    l=larray(il)
for m=-l:l
    ylmsave(l+1,m+l+1,:)=compute_ylm(l,m,pi/2.-theta,phi);
end 
end

save('ylmsave.mat','ylmsave')


% for vlg
[vgauss,wt]=gaussp(lmax);
ngpts=numel(wt)
% 	 alm_sph=matf();    
     
xg = vgauss(1,:);
yg = vgauss(2,:);
zg = vgauss(3,:);
[phi,theta,r] = cart2sph(xg,yg,zg);
theta = pi/2.0-theta;

    for l = 0:lmax
      for m = -l:l
        ylm(l+1,m+l+1,1:ngpts) = conj(compute_ylm(l,m,theta,phi));
%         ylm(l+1,m+l+1,1:ngpts) = transpose(conj(ylm));
%         s = zeros(ngpts,1);
%         s = Iq_save.*wt.*transpose(ylm);
%         clm(iq,l+1,m+l+1)=clm(iq,l+1,m+l+1)+sum(s);
      end
    end
save('ylmvlg.mat','ylm');
 
save('needed.mat','larray','qgrid','qqr','len3dqpoint','lmax','wt'...
    ,'rgrid','rrr','len3drpoint'); 
clear
load('needed.mat');
load('ylmvlg.mat');
load('ylmsave.mat'); 
%clear vgauss ngpts xg yg zg
%clear phi theta r 

%clear phi theta qx qy qz
%clear qqx qqy qqz lmax Nq dq N
