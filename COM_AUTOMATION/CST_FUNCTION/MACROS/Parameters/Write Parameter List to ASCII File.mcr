'#Language "WWB-COM"

Option Explicit

Sub Main
	Dim Fname2 As String

Fname2=GetProjectPath("Project")+"_Parameterlist.txt"
Open Fname2 For Output As #2
Print #2, "# ==============================================================="
Print #2, "# File Created on:"
Print #2, "# " + Cstr(Now) ' + vbCrLf
Print #2, "# Project File:"
Print #2, "# "+GetProjectPath("Project")+".cst"
Print #2, "# ==============================================================="

Dim num_para As Integer
num_para = GetNumberOfParameters

Print #2, "# Total Number of Parameters:" + Str(num_para)
Print #2, "# ==============================================================="

Dim curr_para_name As String
Dim curr_para_val As String
Dim ii As Integer

For ii = 0 To num_para-1
	curr_para_name = GetParameterName(ii)
	curr_para_val = GetParameterSValue(ii)
Print #2, curr_para_name + vbTab + vbTab + vbTab + curr_para_val + vbTab + vbTab + vbTab + GetParameterDescription(curr_para_name)
Next
Print #2, "# ==============================================================="
Close #2

'MsgBox "ASCII File successfully created: " + vbCrLf + Fname2

End Sub
