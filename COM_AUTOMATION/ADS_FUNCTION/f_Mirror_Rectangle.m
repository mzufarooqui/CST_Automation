function fidPosOut = f_Mirror_Rectangle(fid,mAxis,shapeName,x1,y1,x2,y2)
switch mAxis
    case 'X'
        fprintf(fid,'decl %sMir   = de_add_rectangle(%.1f, %.1f, %.1f, %.1f);\n',shapeName,-x1,y1,-x2,y2);
    case 'Y'
        fprintf(fid,'decl %sMir   = de_add_rectangle(%.1f, %.1f, %.1f, %.1f);\n',shapeName,x1,-y1,x2,-y2);
end
fidPosOut = ftell(fid);
end