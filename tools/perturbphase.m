cd ..
rhoPolar=matf('tools/shapepolar.mat');
expmn=matf('expmn.mat');
expm=matf('expm.mat');
bessarr=matf('bessarrtest.mat');

rm=poldecom(rhoPolar,20,expmn);
am=rhoMtoAm(rm,1,bessarr);
aqp=comppol(am,360,expm);
aqpabs=abs(aqp);
phiphase = atan2(imag(aqp),real(aqp));
polplot(abs(aqp))
% pause
% size(phiphase)
% size(
phiperturb=phiphase+0.8*2*2*pi.*(rand(size(phiphase))-0.5);
aqpperturb=aqpabs.*exp(1i.*phiperturb);
aqmperturb=poldecom(aqpperturb,20,expmn);
rmperturb=AmtorhoM(aqmperturb,1/(2*106),bessarr);
rhoperturb=comppol(rmperturb,360,expm);
rhoperturb=abs(rhoperturb);
cd tools
save('rhoperturb.mat','rhoperturb');




