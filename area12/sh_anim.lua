hook.Add("CalcMainActivity", "BaseAnimations", function(Player, Velocity)
    if Player:isSCP() then return end

    local activeWeapon = Player:GetActiveWeapon()
    local weaponClass = IsValid(activeWeapon) and activeWeapon:GetClass() or ""

    -- Проверка класса оружия
    if weaponClass:find("arccw_") or weaponClass:find("weapon_") then return end

    -- Проверка состояния на земле
    local isOnGround = Player:OnGround()
    if isOnGround and not Player.LastOnGround then
        Player:AddVCDSequenceToGestureSlot(GESTURE_SLOT_FLINCH, Player:LookupSequence("jump_land"), 0, true)
        Player.LastOnGround = true
    elseif not isOnGround then
        Player.LastOnGround = false
    end

    -- Обновление индекса атаки
    local currentAttackIndex = Player:GetNW2Int("$fist_attack_index")
    if Player.m_FistAttackIndex ~= currentAttackIndex then
        Player.m_FistAttackIndex = currentAttackIndex
        Player:AddVCDSequenceToGestureSlot(5, Player:LookupSequence("zombie_attack_0" .. ((currentAttackIndex % 7) + 1)), 0.5, true)
    end

    -- Проверка на скорость при приземлении
    if isOnGround and Velocity:Length() > Player:GetRunSpeed() - 10 then
        return ACT_HL2MP_RUN_FAST, -1
    end
end)