function f_ReportInformation ( oMWS, message )
% Reports the information text message to the user. The text will be written either into the output window (if a solver is currently running) or into a message dialog box.
invoke(oMWS,'ReportInformation',message);
end

