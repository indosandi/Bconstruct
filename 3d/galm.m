function Alm=galm(l,m)
	load 'vlp2.mat'

	for i=1:size(vlp,2)
		vrl(i)=vlp(1,i,l+1,m+l+1);
		r(i)=vlp(2,i,l+1,m+l+1);
	end
	r_low=vlp(2,1,l+1,m+l+1)
	r_high=vlp(2,size(vlp,2),l+1,m+l+1)

	q=10^0;
	Alm=quad(@(x)spbs(l,m,x,q,r,vrl),r_low,r_high)

	plot(vrl)
function s=spbs(l,m,x,q,r,vrl)
	disp(x)
	int=(pi./(2.*x.*q)).^(0.5).*besselj(l+0.5,x.*q);
	int=int.*4.*pi.*x.^2;
	%int=int.*j^l;
	%int=int.*interp1(r,vrl,x);
	s=int;
