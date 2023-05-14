hook.Add("GetFallDamage", "MilkyFallDamage", function(pl)
    if pl:getJobTable().nofall then
        return 0
    end
end)
-- nofall = true