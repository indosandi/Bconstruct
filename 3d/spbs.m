function s=spbs(l,arg)
        s=(pi./(2.*arg)).^(0.5).*besselj(l+0.5,arg);

        % handling case arg==0
        if(isnan(s))
            if(l==0)
                s=1; 
            else
                s=0; 
            end
        end
end
