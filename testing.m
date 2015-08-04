% testing
iq=rand(2,3)
im=rand(1,3)
ir=rand(2,3,2)

% aiq=repmat(iq,[1 3])
aim=repmat(im,[2 1])
qmcross=iq.*aim
qmrep=repmat(qmcross,[1 1 2])
total=qmrep.*ir

% aim=permute(aim,[2 1])
% size(aiq)
% size(aim)
for q=1:2
    for m=1:3
        for r=1:2
         val(q,m,r)=iq(q,m)*im(m)*ir(q,m,r);
        end
    end
end
val
size(val)
size(total)
R(val,total)