hook.Add("PlayerSwitchFlashlight", "MilkyBlockFlashlight", function(pl)
    if pl:getJobTable().can_flashlight then
        return false
    end
end)
-- can_flashlight = true