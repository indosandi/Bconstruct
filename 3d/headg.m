function out=headg(headq)
        lmax=20;
        dq='not used';
        dx=72;
        dimx=45;
        dimq='not used';
        dqsph=1;
        ndqsph=20;
        ngauss=1710;
        namerhodata='myfft.mat';
        nameag='ag39p0.mat';
        nameiag='ig39p0.mat';
        nameilm='ilm39p0.mat';
        namefAq='data/ag.mat';
        namerho='data/drho27.mat';
        nameqs='data/qs.mat';
     if (strcmp(headq,'lmax'))
     out=lmax;
     elseif (strcmp(headq,'dq'))
     out=dq;
     elseif (strcmp(headq,'dx'))
     out=dx;
     elseif (strcmp(headq,'dimx'))
     out=dimx;
     elseif (strcmp(headq,'dimq'))
     out=dimq;
     elseif (strcmp(headq,'dqsph'))
     out=dqsph;
     elseif (strcmp(headq,'ndqsph'))
     out=ndqsph;
     elseif (strcmp(headq,'ngauss'))
     out=ngauss;
     elseif (strcmp(headq,'namefAq'))
     aux=load(namefAq);
     names=fieldnames(aux);
     out=aux.(names{1});
     elseif (strcmp(headq,'namerho'))
     aux=load(namerho);
     names=fieldnames(aux);
     out=aux.(names{1});
     elseif (strcmp(headq,'namerhodata'))
     aux=load(namerhodata);
     names=fieldnames(aux);
     out=aux.(names{1});
     elseif (strcmp(headq,'nameqs'))
     aux=load(nameqs);
     names=fieldnames(aux);
     out=aux.(names{1});
     elseif (strcmp(headq,'namerhodata'))
     aux=load(namerhodata);
     names=fieldnames(aux);
     out=aux.(names{1});
     elseif (strcmp(headq,'nameag'))
     out=nameag;
     elseif (strcmp(headq,'nameiag'))
     out=nameiag;
     elseif (strcmp(headq,'nameilm'))
     out=nameilm;
     elseif (strcmp(headq,'Ilm5'))
     aux=load(nameilm5);
     names=fieldnames(aux);
     out=aux.(names{1});
 end
end
