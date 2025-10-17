function status = f_CreateMaterial(oMWS,oMaterial)
%% DEFINE MATERIAL PROPERTIES
% # oMaterial.name                  =
% # oMaterial.type                  =
% # oMaterial.rho                   =
% # oMaterial.kappa                 =
% # oMaterial.mue                   =
% # oMaterial.bNLAnisotropy         =
% # oMaterial.NLAStackingFactor     =
% # oMaterial.NLADirectionX         =
% # oMaterial.NLADirectionY         =
% # oMaterial.NLADirectionZ         =
% # oMaterial.thermalType           =
% # oMaterial.thermalConductivity   =
% # oMaterial.heatCapacity          =
% # oMaterial.metabolicRate         =
% # oMaterial.bloodFlow             =
% # oMaterial.voxelConvection       =
% # oMaterial.mechanicsType         =
% # oMaterial.freqUnit              =
% # oMaterial.lenUnit               =
% # oMaterial.referenceCoordSystem  =
% # oMaterial.coordSystemType       =
% # oMaterial.colour                =
% # oMaterial.bWireframe            =
% # oMaterial.bReflection           =
% # oMaterial.bAllowoutline         =
% # oMaterial.bTransparentoutline   =
% # oMaterial.transparency          =
%
%% FIELD DEFINATION
%  name
%           Sets the name for the new material to be created using .Create.
%  type     'PEC, 'Normal', 'Anisotropic', 'Lossy Metal', 'Corrugatedwall', 'Ohmic sheet', 'Tensor formula'            
%           Sets the type for the material to be defined.  
%  epsilon / EpsilonX / EpsilonY / EpsilonZ ( double dValue )
%           Defines the relative electric permittivity. In case of diagonal anisotropic material, the parameters for the specific components of the diagonal electric permittivity tensor can be set with the respective methods.
%  mue / MueX / MueY / MueZ ( double dValue )
%           Defines the relative permeability. In case of diagonal anisotropic material, the parameters for the specific components of the diagonal permeability tensor can be set with the respective methods.
%  rho ( double dValue )
%           Sets the material density value of the material in kg/m³, i.e. used for SAR calculations.
%           This setting is important for transient thermal simulations.
%  kappa / KappaX / KappaY / KappaZ ( double dValue )
%           Set the electric conductivity. In case of diagonal anisotropic material, the parameters for the specific components of the diagonal tensor can be set with the respective methods. Has no effect if .TanDGiven is set to True.
%  kappaM / KappaMX / KappaMY / KappaMZ ( double dValue )
%           Set the magnetic conductivity. In case of diagonal anisotropic material, the parameters for the specific components of the diagonal tensor can be set with the respective methods. Has no effect if .TanDMGiven is set to True.
%  colour ( double red, double green, double blue )
%         Sets the colour for a new material by double values ranging from 0 to 1.
%  bWireframe ( bool switch )
%         If switch is True, all solids associated with this material will be displayed as a wireframe.
%  transparency ( double dValue )
%         Allows to changes the appearance from opaque (dValue = 0) to a transparency value up to 100. Setting will be ignored if .Wireframe is set.
%  bReflection( bool switch )
%         If switch is True, all solids associated with this material are displayed using reflective surfaces (usually applied to metallic surfaces).
%  bAllowoutline( bool switch )
%         Determine whether outlines are allowed to be drawn for solids belonging to this material. The actual visibility of outlines also depends on the setting of the global outline state as well as the current selection. If switch is False, outlines will never be drawn for the corresponding solids.
%  bTransparentoutline( bool switch )
%         If switch is True, outlines are also displayed when the corresponding solids are drawn transparently.
%% EXAMPLE 1:
% oMaterial.name       = 'material1';
% oMaterial.colour     = [ 0.8 0.8 0.8];
% oMaterial.type       = 'Lossy Metal';
% oMaterial.kappa    = 7143000; % Electric conductivity in S/meter
% oMaterial.mue        = 1;
% status = f_CreateMaterial(oMWS,oMaterial);
%% EXAMPLE 2:
% oMaterial.name       = 'material1';
% oMaterial.colour     = [ 0.8 0.8 0.8];
% oMaterial.type       = 'Normal';
% oMaterial.epsilon    = 8;
% oMaterial.mue        = 1;
% oMaterial.tanD       = 0.35;
% oMaterial.tanDFreq   = 0.35;
% oMaterial.bTanDGiven = 'true';
% oMaterial.tanDModel = 'ConstTanD'; % ConstSigma, ConstTanD
% oMaterial.bUseOnlyDataInSimFreqRangeNthModelTabSI = 'false';
% oMaterial.bEnableUserConstTanDModelOrderEps = 'false';
% oMaterial.constTanDModelOrderEps = 1;
% status = f_CreateMaterial(oMWS,oMaterial);
%% CHECK IF SOME FIELDS ARE PARAMETRIZED
if ~ischar(oMaterial.kappa),oMaterial.kappa = num2str(oMaterial.kappa);end
%% MATLAB SCRIPT
historyStr = [];
historyStr = sprintf('With Material'); 
historyStr = sprintf('%s\n.Reset',              historyStr); 
if isfield(oMaterial,'name'),                   historyStr = sprintf('%s\n.Name "%s"',                    historyStr,num2str(oMaterial.name));                                      else end
if isfield(oMaterial,'frqType'),                historyStr = sprintf('%s\n.FrqType "%s"',                 historyStr,num2str(oMaterial.frqType));                                   else historyStr = sprintf('%s\n.FrqType "all"',                 historyStr);   end
if isfield(oMaterial,'type'),                   historyStr = sprintf('%s\n.Type "%s"',                    historyStr,num2str(oMaterial.type));                                        else end
if isfield(oMaterial,'freqUnit'),               historyStr = sprintf('%s\n.SetMaterialUnit "%s", "%s"',   historyStr,num2str(oMaterial.freqUnit),num2str(oMaterial.lenUnit));       else historyStr = sprintf('%s\n.SetMaterialUnit "GHz", "mm"',   historyStr);   end
if isfield(oMaterial,'mue'),                    historyStr = sprintf('%s\n.Mue "%s"',                     historyStr,num2str(oMaterial.mue));                                       else end
if isfield(oMaterial,'kappa'),                  historyStr = sprintf('%s\n.Kappa "%s"',                   historyStr,oMaterial.kappa);                                     else end
if isfield(oMaterial,'referenceCoordSystem'),   historyStr = sprintf('%s\n.ReferenceCoordSystem "%s"',    historyStr,num2str(oMaterial.referenceCoordSystem));                      else historyStr = sprintf('%s\n.ReferenceCoordSystem "Global"', historyStr);   end
if isfield(oMaterial,'bNLAnisotropy'),          historyStr = sprintf('%s\n.NLAnisotropy "%s"',            historyStr,num2str(oMaterial.bNLAnisotropy));                             else historyStr = sprintf('%s\n.NLAnisotropy "False"',          historyStr);   end
if isfield(oMaterial,'NLAStackingFactor'),      historyStr = sprintf('%s\n.NLAStackingFactor "%s"',       historyStr,num2str(oMaterial.NLAStackingFactor));                         else historyStr = sprintf('%s\n.NLAStackingFactor "1"',         historyStr);   end
if isfield(oMaterial,'NLADirectionX'),          historyStr = sprintf('%s\n.NLADirectionX "%s"',           historyStr,num2str(oMaterial.NLADirectionX));                             else historyStr = sprintf('%s\n.NLADirectionX "1"',             historyStr);   end
if isfield(oMaterial,'NLADirectionY'),          historyStr = sprintf('%s\n.NLADirectionY "%s"',           historyStr,num2str(oMaterial.NLADirectionY));                             else historyStr = sprintf('%s\n.NLADirectionY "0"',             historyStr);   end
if isfield(oMaterial,'NLADirectionZ'),          historyStr = sprintf('%s\n.NLADirectionZ "%s"',           historyStr,num2str(oMaterial.NLADirectionZ));                             else historyStr = sprintf('%s\n.NLADirectionZ "0"',             historyStr);   end
if isfield(oMaterial,'rho'),                    historyStr = sprintf('%s\n.Rho "%s"',                     historyStr,num2str(oMaterial.rho));                                       else end
if isfield(oMaterial,'thermalType'),            historyStr = sprintf('%s\n.ThermalType "%s"',             historyStr,num2str(oMaterial.thermalType));                               else historyStr = sprintf('%s\n.ThermalType "Normal"',          historyStr);   end
if isfield(oMaterial,'thermalConductivity'),    historyStr = sprintf('%s\n.ThermalConductivity "%s"',     historyStr,num2str(oMaterial.thermalConductivity));                       else historyStr = sprintf('%s\n.ThermalConductivity "0"',       historyStr);   end
if isfield(oMaterial,'heatCapacity'),           historyStr = sprintf('%s\n.HeatCapacity "%s"',            historyStr,num2str(oMaterial.heatCapacity));                              else historyStr = sprintf('%s\n.HeatCapacity "0"',              historyStr);   end
if isfield(oMaterial,'metabolicRate'),          historyStr = sprintf('%s\n.MetabolicRate "%s"',           historyStr,num2str(oMaterial.metabolicRate));                             else historyStr = sprintf('%s\n.MetabolicRate "0"',             historyStr);   end
if isfield(oMaterial,'bloodFlow'),              historyStr = sprintf('%s\n.BloodFlow "%s"',               historyStr,num2str(oMaterial.bloodFlow));                                 else historyStr = sprintf('%s\n.BloodFlow "0"',                 historyStr);   end
if isfield(oMaterial,'voxelConvection'),        historyStr = sprintf('%s\n.VoxelConvection "%s"',         historyStr,num2str(oMaterial.voxelConvection));                           else historyStr = sprintf('%s\n.VoxelConvection "0"',           historyStr);   end
if isfield(oMaterial,'mechanicsType'),          historyStr = sprintf('%s\n.MechanicsType "%s"',           historyStr,num2str(oMaterial.mechanicsType));                             else historyStr = sprintf('%s\n.MechanicsType "Unused"',        historyStr);   end

if isfield(oMaterial,'epsilon'),                historyStr = sprintf('%s\n.Epsilon "%s"',                 historyStr,num2str(oMaterial.epsilon));                                    end
if isfield(oMaterial,'coordSystemType'),        historyStr = sprintf('%s\n.CoordSystemType "%s"',         historyStr,num2str(oMaterial.coordSystemType));                           else historyStr = sprintf('%s\n.CoordSystemType "Cartesian"',   historyStr);   end
if isfield(oMaterial,'colour'),                 historyStr = sprintf('%s\n.Colour "%s", "%s", "%s" ',     historyStr,num2str(oMaterial.colour(1)),num2str(oMaterial.colour(2)),num2str(oMaterial.colour(3))); else historyStr = sprintf('%s\n.Colour "0", "1", "1" ',historyStr);         end
if isfield(oMaterial,'bWireframe'),             historyStr = sprintf('%s\n.Wireframe "%s" ',              historyStr,num2str(oMaterial.bWireframe));                                else historyStr = sprintf('%s\n.Wireframe "False" ',            historyStr);   end
if isfield(oMaterial,'bReflection'),            historyStr = sprintf('%s\n.Reflection "%s" ',             historyStr,num2str(oMaterial.bReflection));                               else historyStr = sprintf('%s\n.Reflection "False" ',           historyStr);   end
if isfield(oMaterial,'bAllowoutline'),          historyStr = sprintf('%s\n.Allowoutline "%s" ',           historyStr,num2str(oMaterial.bAllowoutline));                             else historyStr = sprintf('%s\n.Allowoutline "True" ',          historyStr);   end
if isfield(oMaterial,'bTransparentoutline'),    historyStr = sprintf('%s\n.Transparentoutline "%s" ',     historyStr,num2str(oMaterial.bTransparentoutline));                       else historyStr = sprintf('%s\n.Transparentoutline "False" ',   historyStr);   end
if isfield(oMaterial,'transparency'),           historyStr = sprintf('%s\n.Transparency "%s" ',           historyStr,num2str(oMaterial.transparency));                              else historyStr = sprintf('%s\n.Transparency "0" ',             historyStr);   end
if isfield(oMaterial,'bTanDGiven'),             historyStr = sprintf('%s\n.TanDGiven "%s" ',              historyStr,num2str(oMaterial.bTanDGiven));                                else historyStr = sprintf('%s\n.TanDGiven "False" ',             historyStr);   end
if isfield(oMaterial,'tanD'),                   historyStr = sprintf('%s\n.TanD "%s" ',                   historyStr,num2str(oMaterial.tanD));                                      end
if isfield(oMaterial,'tanDFreq'),               historyStr = sprintf('%s\n.TanDFreq "%s" ',               historyStr,num2str(oMaterial.tanDFreq));                                  end
if isfield(oMaterial,'tanDModel'),              historyStr = sprintf('%s\n.TanDModel "%s" ',              historyStr,num2str(oMaterial.tanDModel));                                 end
if isfield(oMaterial,'constTanDModelOrderEps'), historyStr = sprintf('%s\n.ConstTanDModelOrderEps "%s" ', historyStr,num2str(oMaterial.constTanDModelOrderEps));                    end
if isfield(oMaterial,'bUseOnlyDataInSimFreqRangeNthModelTabSI'), historyStr = sprintf('%s\n.UseOnlyDataInSimFreqRangeNthModelTabSI "%s" ',historyStr,num2str(oMaterial.bUseOnlyDataInSimFreqRangeNthModelTabSI));                                                                                                  end
if isfield(oMaterial,'bEnableUserConstTanDModelOrderEps'),       historyStr = sprintf('%s\n.EnableUserConstTanDModelOrderEps "%s" ',      historyStr,num2str(oMaterial.bEnableUserConstTanDModelOrderEps)); else historyStr = sprintf('%s\n.EnableUserConstTanDModelOrderEps "False" ',             historyStr);   end
historyStr = sprintf('%s\n.Create', historyStr);
historyStr = sprintf('%s\nEnd With',historyStr);
historyHeader = [ 'define material: ' oMaterial.name];
status = oMWS.invoke('AddToHistory',historyHeader,historyStr);
end