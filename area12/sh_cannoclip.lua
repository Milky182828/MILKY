timer.Simple( .1, function()
    hook.Remove( 'PlayerNoClip', 'SAM.CanNoClip' )
end)

hook.Add( "PlayerNoClip", "noclipadmin", function( ply )
    if ply:CheckGroup('superadmin') or ( ply:Team() == TEAM_NONRP ) then
        return true
    end
end)