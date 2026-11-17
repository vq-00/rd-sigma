// Pseudo-parenting script for ElevatorSpawn_group_[1-8] -> elevator_main_mover
// Keeps each spawner's exact Hammer offset relative to elevator_main_mover

g_hFollowEntity <- null;
g_vecOffset <- null;
g_bFollowing <- false;

function OnThink()
{
    if ( !g_hFollowEntity || !g_hFollowEntity.IsValid() )
    {
        EntFireByHandle( self, "StopSpawning", "", 0.0, null, null );
        return -1; // Stops this entity's think function cleanly
    }

    self.SetOrigin( g_hFollowEntity.GetOrigin() + g_vecOffset );
    return 0.05; // Runs 20 times per second
}

function StartFollowing()
{
    if ( g_bFollowing )
        return;

    g_hFollowEntity = Entities.FindByName( null, "elevator_main_mover" );
    if ( !g_hFollowEntity || !g_hFollowEntity.IsValid() )
    {
        return;
    }

    g_bFollowing = true;
    // Record this individual spawner's exact offset from elevator_main_mover
    g_vecOffset = self.GetOrigin() - g_hFollowEntity.GetOrigin();
    AddThinkToEnt( self, "OnThink" );
}