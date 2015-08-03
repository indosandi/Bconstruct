function out=R(F_true,F)
    F_true = abs(F_true);
    F = abs(F);
    F_true=reshape(F_true,[],1);
    F=reshape(F,[],1);

%     sum((F_true-F).^2)
%     sum(F_true.^2)
    out = sum((F_true-F).^2)/sum(F_true.^2);
end