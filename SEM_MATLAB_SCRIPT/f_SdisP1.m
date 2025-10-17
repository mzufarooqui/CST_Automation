function [S11,S21,S22] = f_SdisP1(Ta,Tb,zInfa,zInfb,zSiga,zSigb,Na,Nb)
%------------------------------------------------------------------------
%        calcolo GSM discontinuita' step  con perdite (semplificata)          
% 
%  Ta matrice di proiezione (NaNax,nf)  guida a
%  Tb matrice di proiezione (NbNax,nf). Puo' essere 1 nel caso in cui
%     le funzioni di base coincidano  con i modi della guida b
%  zInfa  vettore riga impedenze caratteristiche guida a
%  zInfb  vettore riga impedenze caratteristiche guida b
%  zSiga  vettore riga impedenze superficiali parete discontinuita'
%         vista dalla guida a. Puo' essere uno scalare.
%  zSigb  vettore riga impedenze superficiali parete discontinuita'
%         vista dalla guida b. Puo' essere uno scalare.
%  Na     modi accessibili guida a.
%  Nb     modi accessibili guida b. 
% 
%  S11(Na,Na) 
%  S21(Nb,Na)
%  S22(Nb,Nb)  GSM della discontinuita' step. guida a == porta 1
%------------------------------------------------------------------------

[NaMax,Nf] = size(Ta);
if isempty(Na) 
    Na = NaMax;
elseif  Na > NaMax
      Na = NaMax;
end % if Na == [] 

NbMax = length(zInfb);
if isempty(Nb) 
  Nb = NbMax;
elseif Nb > NbMax
  Nb = NbMax;
end %if Nb == [] 

if sum(size(Tb)) ~= 2
%++++++++++++++++++ inizio Tb matrice (funz. base ~= modi) ++++++++++
Qa = Ta;
v = (zInfa + zSiga);
i = 0;
while i<NaMax
  i = i+1;
  Qa(i,:) = Ta(i,:)/v(i);  
end % while i<NaMax

Qb = Tb;
v = (zInfb + zSigb);
i = 0;
while i<NbMax
  i = i+1;
  Qb(i,:) = Tb(i,:)/v(i);  
end % while i<NbMax

W = 2 * inv( Ta.' * Qa + Tb.' * Qb); % c'e' il fattore 2

i = 0;
while i<Na
  i = i+1;
  Qa(i,:) = Qa(i,:)*sqrt(zInfa(i));   % vera Qa
end % while i<Na

i = 0;
while i<Nb
  i = i+1;
  Qb(i,:) = Qb(i,:)*sqrt(zInfb(i));   % vera Qb
end % while i<Na

S21 =   W*Qa(1:Na,:).'; % temporaneo
S11 = Qa(1:Na,:)*S21;

if sum(size(zSiga)) ==2,
   v =  (zSiga - zInfa(1:Na))./(zInfa(1:Na) + zSiga);
else 
  v =  (zSiga(1:Na) - zInfa(1:Na))./(zInfa(1:Na) + zSiga(1:Na));
end %if sum(size(zSiga)) ==2,
i = [1:Na] + Na*[0:Na-1] ;
S11(i) = S11(i) + v;

S21  = Qb(1:Nb,:)*S21;

S22 = Qb(1:Nb,:)*W*Qb(1:Nb,:).';

if sum(size(zSigb)) ==2,
  v =  (zSigb - zInfb(1:Nb))./(zInfb(1:Nb) + zSigb);
else
  v =  (zSigb(1:Nb) - zInfb(1:Nb))./(zInfb(1:Nb) + zSigb(1:Nb));
end % if sum(size(zSigb)) ==2,
i = [1:Nb] + Nb*[0:Nb-1];
S22(i) = S22(i) + v;
%++++++++++++++++++ fine Tb matrice (funz. base ~= modi) ++++++++++

else % if sum(size(Tb)) ~= 2
%++++++++++++++++++ inizio Tb =1  (funz. base == modi) ++++++++++
if NbMax ~= Nf, 
   disp('from f_SdisP1: dimensions not correct') 
end %if NbMax ~= Nf,  
   
Qa = Ta;
v = (zInfa + zSiga);
i = 0;
while i<NaMax
  i = i+1;
  Qa(i,:) = Ta(i,:)/v(i);  
end % while i<NaMax

W = Ta.' * Qa


v = 1./(zInfb + zSigb);
i = [1:Nf] + Nf*[0:Nf-1];
W(i) = W(i) + v;

W = 2 * inv(W); % c'e' il fattore 2
i = 0;
while i<Na
  i = i+1;
  Qa(i,:) = Qa(i,:)*sqrt(zInfa(i));   % vera Qa
end % while i<Na

S21 =   W*Qa(1:Na,:).'; % temporaneo
S11 = Qa(1:Na,:)*S21;

if sum(size(zSiga)) ==2,
   v =  (zSiga - zInfa(1:Na))./(zInfa(1:Na) + zSiga);
else 
  v =  (zSiga(1:Na) - zInfa(1:Na))./(zInfa(1:Na) + zSiga(1:Na));
end %if sum(size(zSiga)) ==2,
i = [1:Na] + Na*[0:Na-1] ;
S11(i) = S11(i) + v;

if sum(size(zSigb)) ==2,
   v =  sqrt(zInfb(1:Nb))./(zInfb(1:Nb) + zSigb);
else 
   v =  sqrt(zInfb(1:Nb))./(zInfb(1:Nb) + zSigb(1:Nb));
end % if sum(size(zSigb)) ==2,

S22 = W(1:Nb,1:Nb);
i = 0;
while i<Nb
  i = i+1;
  S21(i,:) =  v(i)*S21(i,:); 
  S22(i,:) =  v(i)*S22(i,:);
  S22(:,i) =  S22(:,i)*v(i);
end % while i<Na

if sum(size(zSigb)) ==2,
  v =  (zSigb - zInfb(1:Nb))./(zInfb(1:Nb) + zSigb);
else
  v =  (zSigb(1:Nb) - zInfb(1:Nb))./(zInfb(1:Nb) + zSigb(1:Nb));
end % if sum(size(zSigb)) ==2,
i = [1:Nb] + Nb*[0:Nb-1];
S22(i) = S22(i) + v;
%++++++++++++++++++ fine Tb =1  (funz. base == modi) ++++++++++

end % if sum(size(Tb)) ~= 2

