// Runs slightly before CountdownLength (154s) so ExplodeLevel never fires
function ArmDropshipTimer( countdownName = "AoCountdownObjective0", duration = 154.0 )
{
    local safetyDelay = duration - 1.0;
    if ( safetyDelay < 0.0 )
    {
        safetyDelay = 0.0;
    }

    // Schedule our handler 1 second before the countdown finishes
    EntFireByHandle( self, "RunScriptCode", format( "OnCountdownAlmostDone(\"%s\")", countdownName ), safetyDelay, null, null );
}

function OnCountdownAlmostDone( countdownName )
{
    local ent = Entities.FindByName( null, countdownName );
    if ( ent != null && ent.IsValid() )
    {
        // CancelCountdown clears the countdown state, and Kill removes the entity
        // before its scheduled ExplodeLevel think tick can fire
        DoEntFire( "!self", "CancelCountdown", "", 0.0, null, ent );
        //DoEntFire( "!self", "Kill", "", 0.05, null, ent );
    }

    // Trigger your own dropship arrival / completion logic here:
    EntFire( "EscapeObjective0", "SetVisible", "1", 0.0 );
    EntFire( "trigger_exitzone", "Enable", "", 0.0 );
    // Add any relay or dropship arrival entity output you need here
}