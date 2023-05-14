sound.Add( {
    name = "mark_footsteps",
    channel = CHAN_STATIC,
    volume = 1.0,
    level = 80,
    pitch = {95, 110},
    sound = {
        "blame/footstep_robo2.wav",
        "blame/footstep_robo3.wav"
    }
} )

sound.Add( {
    name = "milky_footsteps",
    channel = CHAN_STATIC,
    volume = 1.0,
    level = 80,
    pitch = {95, 110},
    sound = {
        "npc/footsteps/hardboot_generic2.wav",
        "npc/footsteps/hardboot_generic3.wav",
        "npc/footsteps/hardboot_generic5.wav",
        "npc/footsteps/hardboot_generic6.wav"
    }
} )


local FootStepsSound = {}
-- ТУТ ВАШИ ПРОФЕССИИ И НАЗВАНИЯ ЗВУКА --
FootStepsSound["MK-2 Робопатруль"] = "mark_footsteps"
FootStepsSound["ADMIN"] = "milky_footsteps"
---
hook.Add("PlayerFootstep", "Job_Footstep", function(ply, pos, foot, sound, volume, rf)
    if IsValid(ply) and ply:Alive() then
        local jobName = ply:getDarkRPVar("job")
        if FootStepsSound[jobName] then
            ply:EmitSound(FootStepsSound[jobName])
            return true
        end
    end
end)