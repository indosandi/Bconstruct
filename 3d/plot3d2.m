 function [xxx] = plot3d2(DPR,isoval)
    %x
    % Plot diffraction pattern amplitudes
    %
%     figure;
%     [m,n,p]=size(DPR);
%     ave3=mean(mean(mean(DPR)))
%     std3=std(std(std(DPR)))
%     isoval=ave3+sigma.*std3
%     [x,y,z]=meshgrid(1:n,1:n,1:p);
%     if(ic==1)
%         xcmn=0.;
%         ycmn=0.;
%         zcmn=0.;
%         for ii=1:m
%             for j=1:n
%                 for k=1:p
%                     xcmn=xcmn+DPR(ii,j,k)*ii;          
%                     ycmn=ycmn+DPR(ii,j,k)*j;
%                     zcmn=zcmn+DPR(ii,j,k)*k;
%                 end;
%             end;
%         end;
%         NN=m*n*p;
%         xcm=xcmn/(ave3*NN);
%         ycm=ycmn/(ave3*NN);
%         zcm=zcmn/(ave3*NN);
%         xc=xc+xcm;
%         yc=yc+ycm;
%         zc=zc+zcm;
%         scatter3(xc,yc,zc,'*');
%     end;
    h = axes('GridLineStyle','--',...
       'FontName','times',...
       'FontSize',14);
%     isoval=1;
    fv=patch(isosurface(DPR,isoval));
    isonormals(DPR,fv);
    set(fv,'FaceColor','red','EdgeColor','none','FaceAlpha',0.5);
    %set(get(fv,'XLabel'),'String','Values of X')
    %set(get(fv,'YLabel'),'String','Values of Y')
    %set(get(fv,'Title'),'String','\fontname{times}\itZ = f(x,y)') 
    axis tight vis3d
    camlight left;
    %set(gcf,'Renderer','zbuffer'); 
    lighting phong
    view(3);    
end