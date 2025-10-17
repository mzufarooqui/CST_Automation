' *File / Import Parameters
'---------------------------------------------------------------------------------------------
' This macros imports all Parameters from an existing project into the current one
' If parameters are already existing, they will be overwritten with the imported expression 
'---------------------------------------------------------------------------------------------
' 09-Nov-2011 mac: use of vba-command StoreParameterWithDescription to speed up macro
' 04-Apr-2011 ube: added comment line handling (#) to be able to read exported txt files
' 30-Jul-2009 ube: Split replaced by CSTSplit, since otherwise compeating with standrad VBA-Split function
' 25-Oct-2007 ube: possibility to read parameters from ASCII txt file
' 13-Sep-2006 ube: can be used also in MWS, EMS, PS, added description and expression import
' 01-Mar-2006 mhi: first version for DS
'---------------------------------------------------------------------------------------------

Option Explicit
'#include "vba_globals_all.lib"

Sub Main
	Dim strPar As String, strValue As String, strDesc As String

	Dim projectdir, filename As String, extension As String
	projectdir = GetProjectPath("Root")
	extension  = "cst;txt;dat;mod;ems;psf;des"

    filename = GetFilePath("", extension, projectdir, "Import Parameters", 0)

    If(filename<>"") Then

		Dim sExt As String
    	sExt = LCase(Right(filename,4))

    	If (sExt=".cst") Or (sExt=".mod") Or (sExt=".ems") Or (sExt=".des") Or (sExt=".psf") Then

    		' input file is a cst-project

			Dim app As Object
			Set app = CreateObject("CSTStudio.Application")

			Dim mws As Object
			Set mws = app.OpenFile(filename)

			Dim nPar As Integer, iPar As Integer
			nPar = mws.GetNumberOfParameters

			For iPar = 0 To nPar-1
				strPar = mws.GetParameterName(iPar)
				strValue= mws.RestoreParameterExpression(strPar)
				strDesc=mws.GetParameterDescription(strPar)
				
				StoreParameterWithDescription(strPar, strValue, strDesc)

			Next iPar

			mws.Quit

		Else
			' now simple multi-line txt-file is expected
			' for example:
			'	a	1	length of Brick
			'	b	a
			'	c	1-a	height of Brick -a

			Dim cst_line_array(50) As String, cst_inline As String
			Dim nstr As Integer, istr	As Integer

			Open filename For  Input As #1

				While Not EOF(1)
					Line Input #1,cst_inline
					If cst_inline <> "" Then
						If Left$(cst_inline,1) <> "#" Then
							nstr = CSTSplit(cst_inline, cst_line_array())
							strPar = cst_line_array(0)
							strValue = cst_line_array(1)
							strDesc = ""
							For istr = 2 To nstr-1
								strDesc = strDesc + cst_line_array(istr) + " "
							Next istr
							StoreParameterWithDescription(strPar, strValue, strDesc)
						End If
					End If
				Wend

			Close #1

		End If
	End If
End Sub
