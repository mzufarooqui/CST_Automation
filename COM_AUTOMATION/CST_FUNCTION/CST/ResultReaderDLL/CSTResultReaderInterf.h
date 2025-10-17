// Interface function declarations of the CSTResultReader.dll


// Copyright (c) 2008 by CST GmbH
// All rights reserved.                     

// THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN 
// OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM 
// "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, 
// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS 
// TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU 
// ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.

#ifndef CSTResultReaderInterf_03356389_33DF_4855_AB1B_DFC4F22DFFF1
#define CSTResultReaderInterf_03356389_33DF_4855_AB1B_DFC4F22DFFF1

#ifdef RESULT_READER_BUILD
	#define DllExport   __declspec( dllexport )
#else
	#define DllExport   __declspec( dllimport )
#endif

#define CST_CallConv __stdcall

#ifdef __cplusplus
extern "C" 
{
#endif // __cplusplus

	/////////////////////////////////////////////////////////////////////////////////
	// Further information can be found in the CST DESIGN ENVIRONMENT(TM) online help 
	/////////////////////////////////////////////////////////////////////////////////

	typedef struct {void *m_pProj;} CSTProjHandle;

	///////////////////////////////////////////////////////////////////////////////
	// dll Version
	DllExport int CST_CallConv CST_GetDLLVersion(int *nVersion);
	typedef int (CST_CallConv *CST_GetDLLVersion_PTR)(int *nVersion);

	///////////////////////////////////////////////////////////////////////////////
	// Open / Close a Project Handle
	DllExport int	CST_CallConv CST_OpenProject(char const *cProjName, CSTProjHandle *projHandle);
	typedef int		(CST_CallConv *CST_OpenProject_PTR)(char const *cProjName, CSTProjHandle *projHandle);
	DllExport int	CST_CallConv CST_CloseProject(CSTProjHandle *pHandle);
	typedef int	(CST_CallConv *CST_CloseProject_PTR)(CSTProjHandle *pHandle);

	///////////////////////////////////////////////////////////////////////////////
	// Number of Available Results Within the Given Result Tree.
	DllExport int CST_CallConv CST_GetNumberOfResults(CSTProjHandle const *projHandle, 
													  char const *cTreePathName, 
													  int *nResultNumber);

	typedef int (CST_CallConv *CST_GetNumberOfResults_PTR)(CSTProjHandle const *projHandle, 
														   char const *cTreePathName, 
														   int *nResultNumber);

	///////////////////////////////////////////////////////////////////////////////
	// Disk path for model or result depending on cPathType ("RESULT" / "MODEL3D")
	DllExport int CST_CallConv CST_GetProjectPath(CSTProjHandle const *projHandle, char const *cPathType, char *cPath);
	typedef int (CST_CallConv *CST_GetProjectPath_PTR)(CSTProjHandle const *projHandle, char const *cPathType, char *cPath);

	////////////////////////////////////////////////////////////////////////////////
	// 1D-Results
	DllExport int CST_CallConv CST_Get1DResultInfo(CSTProjHandle const *projHandle, char const *cTreePathName, int iResultNumber, 
												  int infoArraySize, int charBufferSize, char *cInfo, int *iInfo, double *dInfo);    // length of data
	typedef int (CST_CallConv *CST_Get1DResultInfo_PTR)(CSTProjHandle const *projHandle, char const *cTreePathName, int iResultNumber, 
														int infoArraySize, int charBufferSize, char *cInfo, int *iInfo, double *dInfo);    // length of data

	DllExport int CST_CallConv CST_Get1DResultSize(CSTProjHandle const *projHandle, char const *cTreePathName, int iResultNumber, int *nDataSize);    // length of data
	typedef int (CST_CallConv *CST_Get1DResultSize_PTR)(CSTProjHandle const *projHandle, char const *cTreePathName, int iResultNumber, int *nDataSize);    // length of data


	DllExport int CST_CallConv CST_Get1DRealDataOrdinate(CSTProjHandle const *projHandle, char const *cTreePathName, int iResultNumber, double *dData);
	typedef int (CST_CallConv *CST_Get1DRealDataOrdinate_PTR)(CSTProjHandle const *projHandle, char const *cTreePathName, int iResultNumber, double *dData);

	DllExport int CST_CallConv CST_Get1DRealDataAbszissa(CSTProjHandle const *projHandle, char const *cTreePathName, int iResultNumber, double *dData);
	typedef int (CST_CallConv *CST_Get1DRealDataAbszissa_PTR)(CSTProjHandle const *projHandle, char const *cTreePathName, int iResultNumber, double *dData);

	DllExport int CST_CallConv CST_Get1D_2Comp_DataOrdinate(CSTProjHandle const *projHandle, char const *cTreePathName, int iResultNumber, double *dSParaComplex);
	typedef int (CST_CallConv *CST_Get1D_2Comp_DataOrdinate_PTR)(CSTProjHandle const *projHandle, char const *cTreePathName, int iResultNumber, double *dSParaComplex);
	
	////////////////////////////////////////////////////////////////////////////////
	// 3D-Results
	DllExport int CST_CallConv CST_Get3DHexResultInfo(CSTProjHandle const *projHandle, char const *cTreePathName, int iResultNumber,
													  int infoArraySize, int charBufferSize, char *cInfo, int *iInfo, double *dInfo);    
	typedef int (CST_CallConv *CST_Get3DHexResultInfo_PTR)(CSTProjHandle const *projHandle, char const *cTreePathName, int iResultNumber,
														   int infoArraySize, int charBufferSize, char *cInfo, int *iInfo, double *dInfo);    // data type, length of data

	DllExport int CST_CallConv CST_Get3DHexResultSize(CSTProjHandle const *projHandle, char const *cTreePathName, 
													  int iResultNumber, int *nDataSize);    
	typedef int (CST_CallConv *CST_Get3DHexResultSize_PTR)(CSTProjHandle const *projHandle, char const *cTreePathName, 
														   int iResultNumber, int *nDataSize);    // data type, length of data

	DllExport int CST_CallConv CST_Get3DHexResult(CSTProjHandle const *projHandle, char const *cTreePathName, int iResultNumber, float *fData);
	typedef int (CST_CallConv *CST_Get3DHexResult_PTR)(CSTProjHandle const *projHandle, char const *cTreePathName, int iResultNumber, float *fData);

	////////////////////////////////////////////////////////////////////////////////
	// Farfields
	DllExport int CST_CallConv CST_GetNumberOfFarfieldMonitors(CSTProjHandle const *projHandle, int *nFFM);
	typedef int (CST_CallConv *CST_GetNumberOfFarfieldMonitors_PTR)(CSTProjHandle const *projHandle, int *nFFM);

	DllExport int CST_CallConv CST_GetFarfieldMonitorsInfo(CSTProjHandle const *projHandle, char ** Names, double * Frequencies);
	typedef int (CST_CallConv *CST_GetFarfieldMonitorsInfo_PTR)(CSTProjHandle const *projHandle, char ** Names, double * Frequencies);

	DllExport int CST_CallConv CST_GetFarfieldResultSize(CSTProjHandle const *projHandle, char const *cTreePathName, int isApprox, 
								                         int Dimension, int *nDataSizeTheta, int *nDataSizePhi);
	typedef int (CST_CallConv *CST_GetFarfieldResultSize_PTR)(CSTProjHandle const *projHandle, char const *cTreePathName, int isApprox, 
															  int Dimension, int *nDataSizeTheta, int *nDataSizePhi);

	DllExport int CST_CallConv CST_GetFarfieldResultDirections(CSTProjHandle const *projHandle, char const *cTreePathName, int isApprox, 
															   int Dimension, double *Directions);
	typedef int (CST_CallConv *CST_GetFarfieldResultDirections_PTR)(CSTProjHandle const *projHandle, char const *cTreePathName, int isApprox, 
																    int Dimension, double *Directions);

	DllExport int CST_CallConv CST_GetFarfieldResultField(CSTProjHandle const *projHandle, char const *cTreePathName, int isApprox, 
														  int Dimension, double *Field_Real, double *Field_Imag);
	typedef int (CST_CallConv *CST_GetFarfieldResultField_PTR)(CSTProjHandle const *projHandle, char const *cTreePathName, int isApprox, 
															  int Dimension, double *Field_Real, int *Field_Imag);

	DllExport int CST_CallConv CST_GetFarfieldResultGaindB(CSTProjHandle const *projHandle, char const *cTreePathName, int isApprox, 
														   int Dimension, double *GaindB);
	typedef int (CST_CallConv *CST_GetFarfieldResultGaindB_PTR)(CSTProjHandle const *projHandle, char const *cTreePathName, int isApprox, 
															    int Dimension, double *GaindB);

	////////////////////////////////////////////////////////////////////////////////
	// Probe Collection
	DllExport int CST_CallConv CST_GetProbeCollectionResultSize(CSTProjHandle const *projHandle, char const *sTreePathName,
																int *nPoints, int *nFreq);
	typedef int (CST_CallConv *CST_GetProbeCollectionResultSize_PTR)(CSTProjHandle const *projHandle, char const *sTreePathName,
																	 int *nPoints, int *nFreq);

	DllExport int CST_CallConv CST_GetProbeCollectionFreqList(CSTProjHandle const *projHandle, char const *sTreePathName,
															  int nFreq, double *pFreq);
	typedef int (CST_CallConv *CST_GetProbeCollectionFreqList_PTR)(CSTProjHandle const *projHandle, char const *sTreePathName,
																   int nFreq, double *pFreq);

	DllExport int CST_CallConv CST_GetProbeCollectionPointList(CSTProjHandle const *projHandle, char const *sTreePathName,
															   int nPoints, double *pPoints[3]);
	typedef int (CST_CallConv *CST_GetProbeCollectionPointList_PTR)(CSTProjHandle const *projHandle, char const *sTreePathName,
																	int nPoints, double *pPoints[3]);

	DllExport int CST_CallConv CST_GetProbeCollectionData(CSTProjHandle const *projHandle, char const *sTreePathName,
														  int nPoints, int nFreq, double *pData[2]);
	typedef int (CST_CallConv *CST_GetProbeCollectionData_PTR)(CSTProjHandle const *projHandle, char const *sTreePathName,
															   int nPoints, int nFreq, double *pData[2]);

	////////////////////////////////////////////////////////////////////////////////
	// Symmetries / Boundaries 
	DllExport int CST_CallConv CST_GetSymmetries(CSTProjHandle const *projHandle, int* nSymmetries);
	typedef int (CST_CallConv *CST_GetSymmetries_PTR)(CSTProjHandle const *projHandle, int* nSymmetries);

	DllExport int CST_CallConv CST_GetBoundaries(CSTProjHandle const *projHandle, int* nBoundary);
	typedef int (CST_CallConv *CST_GetBoundaries_PTR)(CSTProjHandle const *projHandle, int* nBoundary);
	
	/////////////////////////////////////////////////////////////////////////////////
	// Units
	// LENGTH = 1, TEMPERATURE = 2, VOLTAGE = 3, CURRENT = 4, RESISTANCE = 5, CONDUCTANCE = 6, 
	// CAPACITANCE = 7, INDUCTANCE = 8, FREQUENCY = 9, TIME = 10, POWER = 11

	DllExport int CST_CallConv CST_GetUnitScale(CSTProjHandle const *projHandle, int iUnit, double* dScale);
	typedef int (CST_CallConv *CST_GetUnitScale_PTR)(CSTProjHandle const *projHandle, int iUnit, double* dScale);
	
	DllExport int CST_CallConv CST_GetFrequencyScale(CSTProjHandle const *projHandle, double* FScale);
	typedef int (CST_CallConv *CST_GetFrequencyScale_PTR)(CSTProjHandle const *projHandle, double* FScale);

	////////////////////////////////////////////////////////////////////////////////
	// Excitations
	DllExport int CST_CallConv CST_GetNumberOfExcitations(CSTProjHandle const *projHandle, int *nExcitations);
	typedef int (CST_CallConv *CST_GetNumberOfExcitations_PTR)(CSTProjHandle const *projHandle, int* nExcitations);

	DllExport int CST_CallConv CST_GetExcitationStrings(CSTProjHandle const *projHandle, int nExc, char **psExc);
	typedef int (CST_CallConv *CST_GetExcitationStrings_PTR)(CSTProjHandle const *projHandle, int nExc, char **psExc);

	DllExport int CST_CallConv CST_GetPLWSettings(CSTProjHandle const *projHandle, double *dIncTheta, double *dIncPhi, double *dPolEta, double *dAmplitude);
	typedef int (CST_CallConv *CST_GetPLWSettings_PTR)(CSTProjHandle const *projHandle, double *dIncTheta, double *dIncPhi, double *dPolEta, double *dAmplitude);

	DllExport int CST_CallConv CST_GetPortImpedance(CSTProjHandle const *projHandle, int iPortNumber, int iModeNumber, 
													int nFreq, double const *freq, double *dPortImpComplex);
	typedef int (CST_CallConv *CST_GetPortImpedance_PTR)(CSTProjHandle const *projHandle, int iPortNumber, int iModeNumber, 
														 int nFreq, double const *freq, double *dPortImpComplex);
	DllExport int CST_CallConv CST_GetPortModeType(CSTProjHandle const *projHandle, int iPortNumber, int iModeNumber, char *pchType);
	typedef int (CST_CallConv *CST_GetPortModeType_PTR)(CSTProjHandle const *projHandle, int iPortNumber, int iModeNumber, char *pchType);

	/////////////////////////////////////////////////////////////////////////////////
	// Hexahedral mesh (Only Regular Grids, no Subgrids, no TST)
	DllExport int CST_CallConv CST_GetHexMeshInfo(CSTProjHandle const *projHandle, int *nxyz);
	typedef int (CST_CallConv *CST_GetHexMeshInfo_PTR)(CSTProjHandle const *projHandle, int *nxyz);
	
	DllExport int CST_CallConv CST_GetHexMesh(CSTProjHandle const *projHandle, double *nxyzLines);
	typedef int (CST_CallConv *CST_GetHexMesh_PTR)(CSTProjHandle const *projHandle, double *nxyzLines);

	/////////////////////////////////////////////////////////////////////////////////
	// Hexahedral Material Matrix
	// matType may be 0: Meps
	//                1: Mmue
	//                2: Mkappa
	DllExport int CST_CallConv CST_GetMaterialMatrixHexMesh(CSTProjHandle const *projHandle, int matType, float *fData);
	typedef int (CST_CallConv *CST_GetMaterialMatrixHexMesh_PTR)(CSTProjHandle const *projHandle, int matType, float *fData);

#ifdef __cplusplus
};
#endif // __cplusplus

#endif // #ifndef CSTResultReaderInterf_03356389_33DF_4855_AB1B_DFC4F22DFFF1

