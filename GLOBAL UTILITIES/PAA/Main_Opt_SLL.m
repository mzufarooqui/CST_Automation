c = 3e8;        % signal propagation speed
fc = 1e9;       % signal carrier frequency
lambda = c/fc;  % wavelength
Nside = 40;
geneticArray = phased.URA(Nside,lambda/2);
geneticArray.Element.BackBaffled = true;

clf;
wplot = helperThinnedArrayComparison(geneticArray,fc,c);

% Compute beam pattern
[azpat,elpat,az,el] = helperExtractSynthesisPattern(geneticArray,fc,c);

% Compute relative sidelobe level
pks_az = findpeaks(azpat,'NPeaks',2,'SortStr','descend');
pks_el = findpeaks(elpat,'NPeaks',2,'SortStr','descend');

% find the smaller sidelobe level between two cuts
sllopt = min(pks_az(1)-pks_az(2),pks_el(1)-pks_el(2))


% Set random seed
prvS = rng(2013);

% Initial generation with 200 candidates. Initially, the elements toward
% the center are active and the dummy elements are toward the edge
w0 = double(rand(Nside/2,Nside/2,200)>0.5);
w0(1:14,1:14,:) = 1;

% Pick one candidate, plot the beam pattern, and compute the sidelobe
% level
wtemp = w0(:,:,100);
wo = [fliplr(wtemp) wtemp;rot90(wtemp,2) flipud(wtemp)];
figure
wplot = helperThinnedArrayComparison(geneticArray,fc,c,[wplot wo(:)],{'Full','Initial'});



[azpat,elpat] = helperExtractSynthesisPattern(geneticArray,fc,c,wo(:));

% Compute relative sidelobe level
pks_az = findpeaks(azpat,'NPeaks',2,'SortStr','descend');
pks_el = findpeaks(elpat,'NPeaks',2,'SortStr','descend');
sllopt = min(pks_az(1)-pks_az(2),pks_el(1)-pks_el(2))

fillrate = sum(wo(:))/Nside^2*100


% Max number of generations
Niter = 30;

% Number of candidates in each generation
numGene = size(w0,3);

w = w0;
pos = getElementPosition(geneticArray)/lambda;
angspan = -90:90;
for m = 1:Niter
    % Compute the beam pattern for the entire generation
    [azpat,elpat] = helperArraySynthesisBeamPattern(pos,angspan,w);

    % Compute the sidelobe level for each candidate
    sll = helperArraySynthesisRelativeSidelobeLevel(azpat,elpat);

    % Sort the resulting sidelobe level
    [~,idx] = sort(sll,2,'descend');

    % Discard half of the generation that gets the lower score
    w = w(:,:,[idx(1:numGene/2) idx(1:numGene/2)]);

    % Mutate rows and columns in the newly generated candidates
    mutIdx_row = randi(Nside/2,1,1);
    mutIdx_col = randi(Nside/2,1,1);
    w(mutIdx_row:end,:,numGene/2+1:numGene) = flipud(w(mutIdx_row:end,:,numGene/2+1:numGene));
    w(mutIdx_col:end,:,numGene/2+1:numGene) = fliplr(w(mutIdx_col:end,:,numGene/2+1:numGene));
end
wopt = w(:,:,1);

rng(prvS);

wo = [fliplr(wopt) wopt;rot90(wopt,2) flipud(wopt)];
figure
wplot = helperThinnedArrayComparison(geneticArray,fc,c,[wplot wo(:)],...
    {'Full','Initial','Synthesized'});

sllopt = sll(idx(1))

fillrate = sum(wo(:))/Nside^2*100

figure
geneticArray.Taper = wo;
viewArray(geneticArray,'ShowTaper',true);