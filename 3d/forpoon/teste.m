function teste()
q=[ 1 0 1];
r=[1 2 3];
exp(-j*dot(q,r))
[phiq,thetaq,qr]=cart2sph(q(1),q(2),q(3));
[phir,thetar,rr]=cart2sph(r(1),r(2),r(3));
thetaq=pi/2-thetaq;
thetar=pi/2-thetar;
lmax=20;
temp=0;
for l=0:lmax
    for m=-l:l
        yr=compute_ylm(l,m,thetar,phir);
        yq=compute_ylm(l,m,thetaq,phiq);
        temp=temp+4*pi*((-j)^l)*spbs(l,qr*rr)*conj(yq)*conj(yr); 
    end
end
temp
end

