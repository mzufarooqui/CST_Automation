function [S11,S21,S22]=f_mixl(S11a,S21a,S22a,S11b,S21b,S22b,kz,l);
% 3/12/98 - e' stato aggiunto il controllo sulle dimensioni.
% la dimensione di kz non e' controllata

%-------------- controllo dimensioni
[N2a,dum] = size(S22a);
[N1b,dum] = size(S11b);
Nc = min(N2a,N1b);
if N2a~=N1b
    fprintf(1,'** From f_mixl: incompatible dimensions:  N2a = %2.0f; N1b = %2.0f \n',N2a,N1b)
    fprintf(1,'**              The S-matrices are resized to the min. Dim. \n')
    if N2a >N1b
        S21a = S21a(1:Nc,:);
        S22a = S22a(1:Nc,1:Nc);
    else
        S11b = S11b(1:Nc,1:Nc)
        S21b = S21b(:,1:Nc);
    end %  if N2a >N1b
    kz = kz(1:Nc);
end %if N2a~=N1b
%---------------------------------------
D = exp (-j*kz*l);
N = length(D);
if N~=Nc,
    fprintf(1,'** From f_mixl: incompatible dimensions of Kz  \n')
    fprintf(1,'**              Remove the ERROR \n')
end % if N~=Nc,

ix = 0;
while ix < N
    ix = ix+1;
    S11b(ix,:)=S11b(ix,:)*D(ix);
    S11b(:,ix)=S11b(:,ix)*D(ix);
    S21b(:,ix)=S21b(:,ix)*D(ix);
end %while

i = [1:N]+[0:(N-1)]*N;

det = -(S22a*S11b);
det(i) = 1+det(i);
det = inv(det);
S21=det*S21a;

S11 = S11a+(S21a.'*S11b*S21);
S21 = S21b*S21;
S22 = S22b+(S21b*det*S22a*S21b.');
