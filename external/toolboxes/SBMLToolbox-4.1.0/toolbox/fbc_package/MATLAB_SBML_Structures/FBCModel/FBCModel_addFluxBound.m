function SBMLFBCModel = FBCModel_addFluxBound(SBMLFBCModel, SBMLFluxBound)
% SBMLFBCModel = FBCModel_addFluxBound(SBMLFBCModel, SBMLFluxBound)
%
% Takes
%
% 1. SBMLFBCModel, an SBML FBCModel structure
% 2. SBMLFluxBound, an SBML FluxBound structure
%
% Returns
%
% 1. the SBML FBCModel structure with the SBML FluxBound structure added
%

%<!---------------------------------------------------------------------------
% This file is part of SBMLToolbox.  Please visit http://sbml.org for more
% information about SBML, and the latest version of SBMLToolbox.
%
% Copyright (C) 2009-2012 jointly by the following organizations: 
%     1. California Institute of Technology, Pasadena, CA, USA
%     2. EMBL European Bioinformatics Institute (EBML-EBI), Hinxton, UK
%
% Copyright (C) 2006-2008 jointly by the following organizations: 
%     1. California Institute of Technology, Pasadena, CA, USA
%     2. University of Hertfordshire, Hatfield, UK
%
% Copyright (C) 2003-2005 jointly by the following organizations: 
%     1. California Institute of Technology, Pasadena, CA, USA 
%     2. Japan Science and Technology Agency, Japan
%     3. University of Hertfordshire, Hatfield, UK
%
% SBMLToolbox is free software; you can redistribute it and/or modify it
% under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation.  A copy of the license agreement is provided
% in the file named "LICENSE.txt" included with this software distribution.
%----------------------------------------------------------------------- -->


%get level and version and check the input arguments are appropriate

[level, version] = GetLevelVersion(SBMLFBCModel);
[fluxBound_level, fluxBound_version] = GetLevelVersion(SBMLFluxBound);

if level ~= fluxBound_level
	error('mismatch in levels');
elseif version ~= fluxBound_version
	error('mismatch in versions');
end;

if isfield(SBMLFBCModel, 'fbc_fluxBound')
	index = length(SBMLFBCModel.fbc_fluxBound);
	if index == 0
		SBMLFBCModel.fbc_fluxBound = SBMLFluxBound;
	else
		SBMLFBCModel.fbc_fluxBound(index+1) = SBMLFluxBound;
	end;
else
	error('fluxBound not an element on SBML L%dV%d FBCModel', level, version);
end;

