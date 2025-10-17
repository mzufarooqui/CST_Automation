function [stubInd cavInd] = f_GetStubAndCavityIndex(NDisc,NCav,SimmetryOption)

if( SimmetryOption == 1 )      % if symmetry flag is set 1
    if( rem( NDisc , 2 ) == 0) % Number of stub is even
        stubInd = [ 1 : NDisc/2 ];
        cavInd  = [ 1 : NDisc/2 ];
    else                       % Number of stub is odd
        stubInd = [ 1 : ( NDisc + 1 )/2 ];
        cavInd  = [ 1 : NCav/2 ];
    end
else                           % if symmetry flag is set to zero
    stubInd = [ 1 : NDisc ];
    cavInd  = [ 1 : NCav ];
end

end