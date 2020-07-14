// Set mask to player interaction mask
mask_index = maskPlayerInteract;

// Update player-door interaction
var _showmsg = false;
interactInstDoor = instance_place(x, y, oDoor);
if (instance_exists(interactInstDoor))
{
    if (inputUsePress)
    {
        if (interactInstDoor.locked)
        {
            // Try to unlock
            if (weapon.type == eWEAPON.KEY)
            {
                // Unlock the door & replace key weapon to reserve default weapon
                with (interactInstDoor)
                {
                    event_user(3);
                }
                
                weapon_replace(id, instance_create(0, 0, oWeapon));
                
                // Play sfx : door unlock
                sfx_emit(sndDoorOpen, 1.0, random_range(0.95, 1.05));
            }
            else
            {
                // TODO : play sound
                
            }
        }
        else
        {
            // Open the door / Use the door
            if (interactInstDoor.open)
            {
                // use the door
                interactDoorUsed = true;
            }
            else
            {
                // open the door
                with (interactInstDoor)
                {
                    event_user(0);
                }
                
                // Play sfx : door open
                sfx_emit(sndImpact, 0.5, random_range(0.55, 0.75));
            }
            
        }
        
        // play viewmodel animation
        with (viewmodel)
        {
            fsm_set_state("interact");
        }
    }
    
    // Show interact message
    _showmsg |= true;
    
    if (interactInstDoor.locked)
    {
        if (oPlayer.weapon.type == eWEAPON.KEY)
            oControl.UIBottomMsg = "<RIGHT CLICK TO UNLOCK>";
        else
            oControl.UIBottomMsg = "LOCKED! FIND A KEY!!";
    }
    else
    {
        if (interactInstDoor.open)
            oControl.UIBottomMsg = "<UNLOCKED! RIGHT CLICK TO EXIT>";
        else
            oControl.UIBottomMsg = "<RIGHT CLICK TO OPEN>";
    }
}
else
{
    interactDoorUsed = false;
}

// Update player-weapon pickup interaction
interactInstWeaponPickup = instance_place(x, y, oWeaponPickup);
if (instance_exists(interactInstWeaponPickup))
{
    // Use the pickup
    if (inputUsePress)
    {
        interactWeaponPickupUsed = true;
    }
    
    // Show interact message
    _showmsg |= true;
    oControl.UIBottomMsg = "<RIGHT CLICK TO PICK UP>";
}
else
{
    interactWeaponPickupUsed = false;
}

oControl.UIShowBottomMsg = _showmsg;

// Update player-health pickup interaction
var _healthpickup = instance_place(x, y, oHealthPickup);
if (instance_exists(_healthpickup))
{
    // Heal player
    hp = min(hp + 2, hpMax);
    
    // Flash the screen green
    ui_screen_flash(room_speed * 0.5, c_lime);
    
    // Destroy health pickup
    instance_destroy(_healthpickup);
    
    // Play sfx : heal
    sfx_emit(sndHeal, 1.0, random_range(0.95, 1.05));
}

// Update player's weapon & viewmodel
// (update weapon attack)
if (inputAttackPress)
{
    // (activate weapon)
    with (weapon)
    {
        event_user(3);
    }
}

// (update weapon activate hold-down)
weapon.activateRequestHold = inputAttack;
