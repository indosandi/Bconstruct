function vp2=dataintp(map,lmax,dq,ndq)
        %l=headg('lmax');
        %map=matf('rhomodel.mat');
        %read gauss points
	[vgauss,wt]=gaussp(lmax);
	%convert to spherical
	[phi_g,theta_g,rr]=cart2sph(vgauss(1,:),vgauss(2,:),vgauss(3,:));
	
	%the data,back to cartesian
        %dq=headg('dqsph');
        %ndq=headg('ndqsph');
	r=0.*dq:dq:(ndq-1)*dq;
	for k=1:length(r)
	r_g=repmat(r(k),1,length(wt));
	[x_g,y_g,z_g]=sph2cart(phi_g,theta_g,r_g);

	 %x_g=x_g+dq*15; %center to corner
	 %y_g=y_g+dq*15;
	 %z_g=z_g+dq*15;

         dqarr=-dq*(ndq-1):dq:dq*(ndq-1);
	 %creating mesh x y z for interpolation purpose, from 0
	 %with spacing 8 angstrom, and final value 2872=(360-1)8
	 % in that way we get 360x360x360 array

	 [xmesh,ymesh,zmesh]=ndgrid(dqarr,dqarr,dqarr);
         vp=interpn(xmesh,ymesh,zmesh,map,x_g,y_g,z_g);
	 %vpr=interpn(xmesh,ymesh,zmesh,mapr,x_g,y_g,z_g);
         %vpi=interpn(xmesh,ymesh,zmesh,mapi,x_g,y_g,z_g);
         %vp=vpr+j.*vpi;


	 

         vp2(k,:)=vp(:);
	 end
    
