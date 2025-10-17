function [sideLobeLevel,sideLobeLevelAtThetaDeg]  = f_GetSideLobeLevel(absDirdBAtPhi0,thetaDegAtPhi0)
[pks,locs] = findpeaks(absDirdBAtPhi0-max(absDirdBAtPhi0));
thetaDegAtPhi0AtPeakLocs = thetaDegAtPhi0(locs);
[sortVal,sortInd] = sort(pks,'descend');
sideLobeLevel = sortVal(2);
sideLobeLevelAtThetaDeg = thetaDegAtPhi0AtPeakLocs(sortInd(2));
end