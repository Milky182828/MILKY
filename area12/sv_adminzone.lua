hook.Add( "PlayerSay", "TeleportToAZ", function( ply, msg, team )
     if( msg == "!azone" ) then
          if( ply:GetUserGroup() == "moderator" or ply:GetUserGroup() == "sponsor" or ply:GetUserGroup() == "d_owner" or ply:GetUserGroup() == "helper" or ply:GetUserGroup() == "moder" or ply:GetUserGroup() == "admin" or ply:GetUserGroup() == "eventer" or ply:GetUserGroup() == "kurator" or ply:GetUserGroup() == "manager" or ply:GetUserGroup() == "superadmin" ) then
               ply:SetPos( Vector( 6652.9702,-5632.7490,768.0312 ) )
               ply:ChatPrint("Телепортация...")
               return ""
          end
     end
end)