function status = f_ExportFaceTriangles ( string filename, double maxlen, double surftol )
% Triangulates the picked faces using the given maximum edge length maxlen and surface tolerance surftol and writes the triangle points and normals to a file named filename.
historyStr = sprintf('---- "%s:%s", "%s"',componentName,solidName,--);
historyHeader = [ '--' ];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end