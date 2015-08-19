lmax=headg('lmax');
larray=[0:lmax];
Nq=headg('ndqsph');
dq=headg('dqsph');
qgrid=0:dq:(Nq-1)*dq;

N=Nq-1;;
dq=headg('dqsph');
qqx=-N*dq:dq:N*dq;
qqy=-N*dq:dq:N*dq;
qqz=-N*dq:dq:N*dq;
len3dpoint=length(qqx);
lenlarray=length(larray); 

% make one indeks
 nind=0;
 for ii=1:length(qqx)
 for ij=1:length(qqy)
 for ik=1:length(qqz)
     nind=nind+1;
     qx(nind)=qqx(ii);
     qy(nind)=qqy(ij);
     qz(nind)=qqz(ik);
 end  
 end   
 end  
 
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
 
save('needed.mat','larray','qgrid','qqr','len3dpoint','lmax','wt'); 
clear
load('needed.mat');
load('ylmvlg.mat');
load('ylmsave.mat'); 
%clear vgauss ngpts xg yg zg
%clear phi theta r 

%clear phi theta qx qy qz
%clear qqx qqy qqz lmax Nq dq N
