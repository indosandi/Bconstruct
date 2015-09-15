nx=61;
rad=15;
cntr=31
for ix=1:nx
for iy=1:nx
for iz=1:nx
    if(((ix-cntr)^2+(iy-cntr)^2+(iz-cntr)^2)^(0.5)<rad)
       rho(ix,iy,iz)=1; 
    else
        rho(ix,iy,iz)=0;
    end
end
end
end
save('rhosphere61.mat','rho');

