hook.Add("OnEntityCreated", "EntityRemoveDelayed", function(ent)
    if ent:GetClass() == "spawned_weapon" then
        SafeRemoveEntityDelayed(ent, 60 * 5)
    end
end)