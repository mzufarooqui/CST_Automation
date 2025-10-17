function [ CCInfo ] = f_GetCCInfo( PatchInfo )

totNumOfPatch = length(PatchInfo);
indCCInfo     = 1;

for patchInd = 1: 1 : totNumOfPatch - 1 % Check all the patches one by one
    patchVertexCoord = [ PatchInfo(patchInd).Geom.px ; PatchInfo(patchInd).Geom.py ];                    % Get the patch vertex coord.

    for cornerInd = 1 : 1 : 4 % Check all the side one by one
        tempVar   = circshift( patchVertexCoord,[ 0 -( cornerInd - 1 ) ] );
        edgeCoord = tempVar(:,1:2);  % get the coordinate of the side
        if  isequal(edgeCoord(:,1), edgeCoord(:,2)), break; end % If the coordiante of the sides are equal then exit the loop(i.e it is the triangle not a quadrilateral)
        for nextPatchInd = patchInd + 1 : 1 : totNumOfPatch % Pick the next patch whose corner will be compare with the above one
            nextPatchVertexCoord = [ PatchInfo(nextPatchInd).Geom.px ; PatchInfo(nextPatchInd).Geom.py ]; % Get the next patch vertex coord.
            for nextPatchCornerInd = 1 : 1 : 4
                tempVar   = circshift( nextPatchVertexCoord,[ 0 -( nextPatchCornerInd - 1 ) ] );
                nextEdgeCoord = tempVar(:,1:2);
                if  isequal(nextEdgeCoord(:,1), nextEdgeCoord(:,2)), break; end % If the coordiante of the sides are equal then exit the loop(i.e it is the triangle not a quadrilateral)
               if ( isequal(edgeCoord , nextEdgeCoord ) | isequal( edgeCoord , fliplr( nextEdgeCoord ) ) ) % If the common side found then update the patch Boundary condition as zero
                    CCInfo(indCCInfo,:) = [ patchInd cornerInd nextPatchInd nextPatchCornerInd ];
                    indCCInfo = indCCInfo + 1;                    
                end
            end
        end
    end
end