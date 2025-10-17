function f_ReportWarningToWindow ( oMWS, message )
% Reports the warning text message to the user. The text will be written into the output window.
invoke(oMWS,'ReportWarningToWindow',message);
end