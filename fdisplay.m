function fdisplay(rhoP,iter,ndisplay)
if(mod(iter,ndisplay)==0)
   polplot(rhoP); 
   drawnow;
end
end