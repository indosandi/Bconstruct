function cartgpoint()
    l=headg('lmax')
  
    %read gauss points
	[vgauss,wt]=gaussp(l);
	%convert to spherical
	[phi_g,theta_g,rr]=cart2sph(vgauss(1,:),vgauss(2,:),vgauss(3,:));
	
    dq=headg('dqsph')
	r=0.*dq:dq:(headg('ndqsph')-1).*dq
    
	for k=1:length(r)
	r_g=repmat(r(k),1,length(wt));
	[x_g,y_g,z_g]=sph2cart(phi_g,theta_g,r_g);
    qxg(k,:)=x_g(:);
	qyg(k,:)=y_g(:);
    qzg(k,:)=z_g(:);
 
	 end
	 save('gpoint.mat','qxg','qyg','qzg');
     if(exist('cartg')==0)
         mkdir('cartg')
     end
     outfilex='cartg/qx.bin';
     outfiley='cartg/qy.bin';
     outfilez='cartg/qz.bin';
     fidx=fopen(outfilex,'w');
     fidy=fopen(outfiley,'w');
     fidz=fopen(outfilez,'w');
     
     nwt=headg('ngauss')
     nr=headg('ndqsph')
     for i=1:nr
         for j=1:nwt             
             fwrite(fidx,qxg(i,j), 'float64','l');
             fwrite(fidy,qyg(i,j), 'float64','l');
             fwrite(fidz,qzg(i,j), 'float64','l');
         end
     end
     fclose(fidx);
     fclose(fidy);
     fclose(fidz);




    
