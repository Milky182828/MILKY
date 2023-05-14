local UseButtonTeams = {
  [TEAM_DINO] = true,
  [TEAM_DED] = true,
  [TEAM_STATUA] = true,
  [TEAM_GOLOS] = true,
  [TEAM_YASHER] = true,
  [TEAM_ERIC] = true,
  [TEAM_KAPLEA] = true,
  [TEAM_KAPLEB] = true,
  [TEAM_JELE] = true,
}

hook.Add( "PlayerUse", "SystemUseButtonSCP", function( ply, ent )
    if ent:GetClass() == "func_button" then
        if UseButtonTeams[ply:Team()] then
    return false
        end
    end
end)