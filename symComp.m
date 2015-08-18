function Rmqout=symComp(Rmq,s,mmax)
marray=-mmax:mmax; 
Rmqout=zeros(size(Rmq));
for i=1:numel(marray)
    if(mod(marray(i),s)==0)
%         disp(marray(i))
    Rmqout(:,i)=Rmq(:,i);
    end
end