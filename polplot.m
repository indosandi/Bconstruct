function test2(im2)
% load test.mat
% im2(:,:)=vqp2(:,:);
[nrows, ncols] = size(im2);
nphi=size(im2,2);
increment = 2*pi/nphi;
startAngle = 0;
%prepare matrices containing the polar coordinate data
rho = repmat([1:nrows]',1,ncols);
theta = repmat([startAngle:increment:startAngle + increment*(ncols-1)],nrows,1);
%convert the polar coordinates to cartesian
[x,y] = pol2cart(theta,rho);
%use ffgrid to prepare the data
[zz, xx, yy] = ffgrid(x, y, im2, 1, 1);
%use griddata to produce the final image
Z = griddata(x,y,im2,xx,yy');
imagesc(Z)
end