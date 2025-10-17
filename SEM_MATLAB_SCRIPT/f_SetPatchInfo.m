function [ PatchInfo ] = f_SetPatchInfo( PatchInfo , TypeMode )
totNumOfPatch = length(PatchInfo);
indCCInfo     = 1;
X_COORD = 1;
Y_COORD = 2;

for i = 1:totNumOfPatch
    PatchInfo(i).PatchBC = [ NaN NaN NaN NaN ];
end

for patchInd = 1: 1 : totNumOfPatch - 1
    patchVertexCoord = [ PatchInfo(patchInd).Geom.px ; PatchInfo(patchInd).Geom.py ];                    % Get the patch vertex coord.

    for cornerInd = 1 : 1 : 4
        tempVar   = circshift( patchVertexCoord,[ 0 -( cornerInd - 1 ) ] );
        edgeCoord = tempVar(:,1:2);
        if  isequal(edgeCoord(:,1), edgeCoord(:,2)), break; end
        for nextPatchInd = patchInd + 1 : 1 : totNumOfPatch
            nextPatchVertexCoord = [ PatchInfo(nextPatchInd).Geom.px ; PatchInfo(nextPatchInd).Geom.py ]; % Get the next patch vertex coord.
            for nextPatchCornerInd = 1 : 1 : 4
                tempVar   = circshift( nextPatchVertexCoord,[ 0 -( nextPatchCornerInd - 1 ) ] );
                nextEdgeCoord = tempVar(:,1:2);
                if  isequal(nextEdgeCoord(:,1), nextEdgeCoord(:,2)), break; end
                if ( edgeCoord == nextEdgeCoord ) | ( edgeCoord == fliplr( nextEdgeCoord ) )                    
                    PatchInfo(patchInd).PatchBC( cornerInd ) = 0;
                    PatchInfo(nextPatchInd).PatchBC( nextPatchCornerInd ) = 0;
                end
            end
        end
    end
end

for patchInd = 1: 1 : totNumOfPatch
    patchVertexCoord = [ PatchInfo(patchInd).Geom.px ; PatchInfo(patchInd).Geom.py ];                    % Get the patch vertex coord.
    for cornerInd = 1 : 1 : 4
        tempVar   = circshift( patchVertexCoord,[ 0 -( cornerInd - 1 ) ] );
        edgeCoord = tempVar(:,1:2);
        if  isequal(edgeCoord(:,1), edgeCoord(:,2))
            PatchInfo(patchInd).PatchBC( cornerInd ) = 0;
            break;
        end
        if ( edgeCoord(X_COORD,:) == 0 )
            switch TypeMode
                case 'TM'
                    PatchInfo(patchInd).PatchBC( cornerInd ) = 2;
                case 'TE'
                    PatchInfo(patchInd).PatchBC( cornerInd ) = 1;
            end
        end

        if ( edgeCoord(Y_COORD,:) == 0 )
            switch TypeMode
                case 'TM'
                    PatchInfo(patchInd).PatchBC( cornerInd ) = 1;
                case 'TE'
                    PatchInfo(patchInd).PatchBC( cornerInd ) = 2;
            end
        end

    end
end

for i = 1:totNumOfPatch
    switch TypeMode
        case 'TM'
            PatchInfo(i).PatchBC(isnan(PatchInfo(i).PatchBC)) = 1;
        case 'TE'
            PatchInfo(i).PatchBC(isnan(PatchInfo(i).PatchBC)) = 2;
    end

end

% for i = 1:10
%     fprintf(' %d : %d %d %d %d\n',i,PatchInfo(i).PatchBC);
% end

