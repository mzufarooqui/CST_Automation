function f_ReportError ( oMWS, message )
% Reports the error text message to the user. The text will be written into a message dialog box. The currently active VBA command evaluation will be stopped immediately. An On Error Goto statement will be able to catch this error.
invoke(oMWS,'ReportError',message);
end