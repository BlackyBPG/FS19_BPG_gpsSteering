-- 
-- Not SteeringWheel rotation on GPS Script for FS19
-- by Blacky_BPG
-- 
-- Version: 1.9.0.0      | 03.10.2021 - initial FS19 release
-- 

registerGPSsteering = {}
registerGPSsteering.userDir = getUserProfileAppPath()
registerGPSsteering.version = "1.9.0.0  -  03.10.2021"

function GPSupdateSteeringWheel(self, superFunc, dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
	local doUpdateStuff = true
	if self.spec_globalPositioningSystem ~= nil then
		if self.spec_globalPositioningSystem.guidanceIsActive and self.spec_globalPositioningSystem.guidanceSteeringIsActive then
			doUpdateStuff = false
		end
	end
	if self.vcaSnapIsOn ~= nil and self.vcaSnapIsOn then
		doUpdateStuff = false
	end
	if doUpdateStuff then
		superFunc(self, dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
	end
end
Drivable.updateSteeringWheel = Utils.overwrittenFunction(Drivable.updateSteeringWheel, GPSupdateSteeringWheel)

function GPSupdateSteeringWheelReverse(self, superFunc, dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
	local doUpdateStuff = true
	if self.spec_globalPositioningSystem ~= nil then
		if self.spec_globalPositioningSystem.guidanceIsActive and self.spec_globalPositioningSystem.guidanceSteeringIsActive then
			doUpdateStuff = false
		end
	end
	if self.vcaSnapIsOn ~= nil and self.vcaSnapIsOn then
		doUpdateStuff = false
	end
	if doUpdateStuff then
		superFunc(self, dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
	end
end
ReverseDriving.updateSteeringWheel = Utils.overwrittenFunction(ReverseDriving.updateSteeringWheel, GPSupdateSteeringWheelReverse)

print(" ++ loading registerGPSsteering V "..tostring(registerGPSsteering.version).." for "..tostring(numVehT).." motorized Vehicles")
