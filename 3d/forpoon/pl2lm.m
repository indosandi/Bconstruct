function pl2lm(alm1,alm2,l,r)
%l=4;
m=0;
y1=abs(alm1(r,l+1,m+l+1));
y2=abs(alm2(r,l+1,m+l+1)); 
y1=squeeze(y1);
y2=squeeze(y2); 
size(y1)
size(y2)
%x=0:20;
%figure
%plot(r,y1) 
%figure
%plot(r,y2) 
plot(r,y1,r,y2)
legend('integration','calculation') 
%hold all
%plot(y2,legend('y2'))
end
