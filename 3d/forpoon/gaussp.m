function[vgauss,wt] = gaussp(lmax)

ngpt = lmax+1+mod(lmax+1,2);

% compute ngpt/2 points
n = ngpt;
m = floor((n+1)/2);
e1 = n*(n+1);
x = zeros(m,1);
w = zeros(m,1);
for i = 1:m
    t = (4*i-1)*pi/(4*n+2);
    x0 = ( 1.0-(1.0-1.0/n)/(8.0*n*n) )*cos(t);
    for it = 1:2
        pkm1 = 1.0;
        pk = x0;
        for k = 2:n
            t1 = x0*pk;
            pkp1 = t1-pkm1-(t1-pkm1)/k+t1;
            pkm1 = pk;
            pk = pkp1;
        end
        den = 1.0-x0*x0;
        d1 = n*(pkm1-x0*pk);
        dpn = d1/den;
        d2pn = (2.0*x0*dpn-e1*pk)/den;
        d3pn = (4.0*x0*d2pn+(2.0-e1)*dpn)/den;
        d4pn = (6.0*x0*d3pn+(6.0-e1)*d2pn)/den;
        u = pk/dpn;
        v = d2pn/dpn;
        h=-u*(1.0 + 0.5*u*(v+u*(v*v-u*d3pn/(3.0*dpn))));
        p=pk+h*(dpn + 0.5 *h*(d2pn+h/3.0 *(d3pn+0.25*h*d4pn)));
        dpp=dpn+h*(d2pn+0.50*h*(d3pn+h*d4pn/3.0));
        h=h-p/dpp;
        x0=x0+h;
    end
    x(i)=x0;
    fx=d1-h*e1*(pk+0.5*h*(dpn+h/3.0*(d2pn+0.25*h*(d3pn+0.2*h*d4pn))));
    w(i)=2.0*(1.0-x(i).*x(i))/(fx*fx);
end

if(m+m > n) 
    x(m)=0.0;
end

nphi = 2*lmax+1;
delphi = 2.0*pi/nphi;
j = 0;
vgauss = zeros(3,ngpt*(2*lmax+1));
wt = zeros(ngpt*(2*lmax+1),1);
for i = 1:ngpt/2
    rxy = sqrt(1.0-x(i).*x(i));
    for k = 1:nphi
        phi = k*delphi;
        j = j+1;
        vgauss(1,j) = rxy*cos(phi);
        vgauss(2,j) = rxy*sin(phi);
        vgauss(3,j) = x(i);
        wt(j) = w(i)*delphi;
        j = j+1;
        vgauss(1,j) = -vgauss(1,j-1);
        vgauss(2,j) = -vgauss(2,j-1);
        vgauss(3,j) = -x(i);
        wt(j) = w(i)*delphi;
    end
end
