function[PatchInfo]=f_GetCircQuadrilaterPatchInfo(px,py,R,xc,yc)

pxMax=max(px);
pxMin=min(px);
pyMax=max(py);
pyMin=min(py);
% DimxMax=pxMax-pxMin;
% DimyMax=pyMax-pyMin;
pxMean=(pxMax+pxMin)/2;
pyMean=(pyMax+pyMin)/2;

PatchInfo.px=px; % X Coordinate of the Vertices
PatchInfo.py=py; % Y Coordinate of the Vertices

PatchInfo.xP=[px px(1)]; % X coordinate of the vertices (the first vertex is replicated), is used for graphics
PatchInfo.yP=[py py(1)]; % Y coordinate of the vertices (the first vertex is replicated), is used for graphics


PatchInfo.pxMean=pxMean; % X coordinate mean
PatchInfo.pyMean=pyMean; % Y coordinate mean

PatchInfo.edges=[PatchInfo.xP(2:5)-PatchInfo.xP(1:4); PatchInfo.yP(2:5)-PatchInfo.yP(1:4)]; % coordinate of the edges
PatchInfo.Le=sqrt(abs(PatchInfo.edges(1,:)).^2+abs(PatchInfo.edges(2,:)).^2); % Length of the sides
phie=atan2(PatchInfo.edges(2,:),PatchInfo.edges(1,:));
I=find(phie<0);phie(I)=phie(I)+2*pi;
PatchInfo.phie=phie; % angle to the side X

DimxMax=max(PatchInfo.Le([1,3]));
DimyMax=max(PatchInfo.Le([2,4]));
PatchInfo.DimxMax=DimxMax;
PatchInfo.DimyMax=DimyMax;

R2=R(2);
xc2=xc(2);
yc2=yc(2);
zc2=xc2+j*yc2;
zP2=px(2)+j*py(2);
th2=angle(zP2-zc2);
zP3=px(3)+j*py(3);
th3=angle(zP3-zc2);
z2=R2*exp(j*linspace(th2,th3,21))+zc2;
if(isinf(R2)==1)
    z2=[zP2 zP3];   
end

R4=R(4);
xc4=xc(4);
yc4=yc(4);
zc4=xc4+j*yc4;
zP1=px(1)+j*py(1);
th1=angle(zP1-zc4);
zP4=px(4)+j*py(4);
th4=angle(zP4-zc4);
z4=R4*exp(j*linspace(th1,th4,21))+zc4;
if(isinf(R4)==1)
    z4=[zP1 zP4];   
end

xP=[px(1) real(z2) fliplr(real(z4))  px(1)];
yP=[py(1) imag(z2) fliplr(imag(z4))  py(1)];

PatchInfo.xP=xP; % coordinata x dei vertici (il primo vertice viene replicato); serve per i grafici
PatchInfo.yP=yP; % coordinata y dei vertici (il primo vertice viene replicato); serve per i grafici

