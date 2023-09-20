-- ArchipelagicSeaLane main entry point.
--
-- Issue #152, PSWG #80
-- #61
-- #193

function ArchipelagicSeaLane(feature, featurePortrayal, contextParameters)
	
	local viewingGroup = 21060 

	-- MS Debug feature.featureName[1] = {displayName = true, language = 'eng', name = 'Test Sea Lane'}

	 if feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization, text only
		featurePortrayal:AddInstructions('ViewingGroup:' .. viewingGroup ..';DrawingPriority:15;DisplayPlane:UnderRADAR')

		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('LocalOffset:0,0;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10')
			featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), '%s'), 21, 24, viewingGroup, 15)
		end
	elseif feature.PrimitiveType == PrimitiveType.None then
		featurePortrayal:AddInstructions('ViewingGroup:' .. viewingGroup .. ';DrawingPriority:15;DisplayPlane:UnderRADAR;NullInstruction') 
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
