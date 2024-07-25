/* EXAMPLE */

// Saving to freeze variables for further verification 

new freeze[MAX_PLAYERS] = true; // unfreeze

stock FixTogglePlayerControllable(playerid, bool:fixfreeze)
{
    if(fixfreeze == false) // freeze
    {
        freeze[playerid] = false; // freeze
        TogglePlayerControllable(playerid, false);
    }
    else // unfreeze
    {
        freeze[playerid] = true; // unfreeze
        TogglePlayerControllable(playerid, true); // unfreeze
    }
}
// REPLACE ALL TogglePlayerControllable TO FixTogglePlayerControllable

// to OnPlayerDisconnect
freeze[playerid] = true; // unfreeze after disconnect

// to OnPlayerTimer (Or something similar like OnPlayerUpdate)

if(freeze[playerid] == false) // check freeze
{
    if(GetPlayerSpeed(playerid) > 0)
    {
        TogglePlayerControllable(playerid, false);
        SendClientMessage(playerid, -1, "Do not knock down the freeze");
    }
}

// checking if the player is frozen, then his speed is checked, if he moves back to freeze and send a message to the player in the chat
