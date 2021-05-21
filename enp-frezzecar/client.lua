TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local cars = {
    { model="t20", x= 226.53, y= -880.83, z= 29.49, a= 314.97},
    { model="akuma", x=228.51, y=-883.15, z=29.49, a=306.2},
}

ESX.TriggerServerCallback('callbackname', function( spawned )
	if not spawned then
		for k,v in ipairs(cars) do
			RequestModel(GetHashKey(v.model))
			while not HasModelLoaded(GetHashKey(v.model)) do
				Wait(0)
			end
			local entity =  CreateVehicle(GetHashKey(v.model),  v.x, v.y, v.z, v.a, false)
			SetVehicleOnGroundProperly(entity)
			SetVehicleEngineOn(entity,false,false,false)
			SetVehicleUndriveable(entity,true)
			FreezeEntityPosition(entity, true)
			SetEntityAsMissionEntity(entity, true, true)
			SetModelAsNoLongerNeeded(entity)
			SetEntityInvincible( entity, true )
			SetVehicleLights(entity, 2)
			SetVehicleDoorsLocked(entity, 2)
		end
	end
end)